package com.ssafy.trip.model.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClient;
import org.springframework.web.util.UriComponentsBuilder;

import com.ssafy.trip.model.api.dto.ApiResponse;
import com.ssafy.trip.model.api.dto.Body;
import com.ssafy.trip.model.api.dto.Items;
import com.ssafy.trip.model.api.dto.Response;
import com.ssafy.trip.model.dto.Category;
import com.ssafy.trip.model.dto.TourSpot;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class TourApiService {
    private final RestClient restClient;

    @Value("${data.go.kr.api.key}")
    private String publicDataServiceKey;

    // 시/도 목록 조회 (서비스2)
    public List<Category> getSidoList() {
        String url = UriComponentsBuilder
                .fromHttpUrl("https://apis.data.go.kr/B551011/KorService2/areaCode2")
                .queryParam("serviceKey", publicDataServiceKey)
                .queryParam("numOfRows", 50)
                .queryParam("pageNo", 1)
                .queryParam("MobileOS", "ETC")
                .queryParam("MobileApp", "AppTest")
                .queryParam("_type", "json")
                .build().toUriString();

        ApiResponse<Category> apiResponse = restClient.get()
                .uri(url)
                .header("Accept", "application/json")
                .retrieve()
                .body(new ParameterizedTypeReference<ApiResponse<Category>>() {});
        return Optional.ofNullable(apiResponse)
                .map(ApiResponse::getResponse)
                .map(Response::getBody)
                .map(Body::getItems)
                .map(Items::getItem)
                .orElse(Collections.emptyList());
    }

    // 군/구 목록 조회 (서비스2)
    public List<Category> getSigunguList(String sidoCode) {
        String url = UriComponentsBuilder
                .fromHttpUrl("https://apis.data.go.kr/B551011/KorService2/areaCode2")
                .queryParam("serviceKey", publicDataServiceKey)
                .queryParam("areaCode", sidoCode)
                .queryParam("numOfRows", 50)
                .queryParam("pageNo", 1)
                .queryParam("MobileOS", "ETC")
                .queryParam("MobileApp", "AppTest")
                .queryParam("_type", "json")
                .build().toUriString();

        ApiResponse<Category> apiResponse = restClient.get()
                .uri(url)
                .header("Accept", "application/json")
                .retrieve()
                .body(new ParameterizedTypeReference<ApiResponse<Category>>() {});
        return Optional.ofNullable(apiResponse)
                .map(ApiResponse::getResponse)
                .map(Response::getBody)
                .map(Body::getItems)
                .map(Items::getItem)
                .orElse(Collections.emptyList());
    }

    // 관광유형 카테고리 조회 (서비스2)
    public List<Category> getTourCategories() {
        String url = UriComponentsBuilder
            .fromHttpUrl("https://apis.data.go.kr/B551011/KorService2/categoryCode2")
            .queryParam("serviceKey", publicDataServiceKey)
            .queryParam("MobileOS", "ETC")
            .queryParam("MobileApp", "AppTest")
            .queryParam("_type", "json")
            .build().toUriString();

        ApiResponse<Category> response = restClient.get()
            .uri(url)
            .retrieve()
            .body(new ParameterizedTypeReference<>() {});

        return Optional.ofNullable(response)
            .map(ApiResponse::getResponse)
            .map(Response::getBody)
            .map(Body::getItems)
            .map(Items::getItem)
            .orElse(Collections.emptyList());
    }

    // 검색어 기반 관광지 검색 (서비스2)
    public List<TourSpot> searchTourSpots(String keyword, String areaCode, String sigunguCode, String cat1) {
        UriComponentsBuilder builder = UriComponentsBuilder
                .fromHttpUrl("https://apis.data.go.kr/B551011/KorService2/searchKeyword2")
                .queryParam("serviceKey", publicDataServiceKey)
                .queryParam("numOfRows", 500)
                .queryParam("pageNo", 1)
                .queryParam("MobileOS", "ETC")
                .queryParam("MobileApp", "AppTest")
                .queryParam("_type", "json");

        if (keyword != null && !keyword.isEmpty()) builder.queryParam("keyword", keyword);
        if (areaCode != null && !areaCode.isEmpty()) builder.queryParam("areaCode", areaCode);
        if (sigunguCode != null && !sigunguCode.isEmpty()) builder.queryParam("sigunguCode", sigunguCode);
        if (cat1 != null && !cat1.isEmpty()) builder.queryParam("cat1", cat1);

        String url = builder.build().toUriString();

        ApiResponse<TourSpot> apiResponse = restClient.get()
                .uri(url)
                .header("Accept", "application/json")
                .retrieve()
                .body(new ParameterizedTypeReference<>() {});

        if (apiResponse == null ||
            apiResponse.getResponse() == null ||
            apiResponse.getResponse().getBody() == null ||
            apiResponse.getResponse().getBody().getItems() == null) {
            return List.of();
        }

        return apiResponse.getResponse().getBody().getItems().getItem();
    }

    // 검색어 없이 지역 기반 관광지 조회 (서비스2)
    public List<TourSpot> searchTourSpotsByRegion(
            String areaCode,
            String sigunguCode,
            String cat1,
            String cat2,
            String cat3,
            String contentTypeId
    ) {
        // 파라미터가 null이 아닌 것만 쿼리 파라미터로 추가
        Map<String, String> params = new HashMap<>();
        if (areaCode != null && !areaCode.isEmpty()) params.put("areaCode", areaCode);
        if (sigunguCode != null && !sigunguCode.isEmpty()) params.put("sigunguCode", sigunguCode);
        if (cat1 != null && !cat1.isEmpty()) params.put("cat1", cat1);
        if (cat2 != null && !cat2.isEmpty()) params.put("cat2", cat2);
        if (cat3 != null && !cat3.isEmpty()) params.put("cat3", cat3);
        if (contentTypeId != null && !contentTypeId.isEmpty()) params.put("contentTypeId", contentTypeId);

        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl("https://apis.data.go.kr/B551011/KorService2/areaBasedList2")
                .queryParam("MobileOS", "ETC")
                .queryParam("MobileApp", "AppTest")
                .queryParam("serviceKey", publicDataServiceKey)
                .queryParam("_type", "json")
                .queryParam("numOfRows", 500)
                .queryParam("pageNo", 1);

            // 입력받은 파라미터만 추가
            params.forEach(builder::queryParam);

            String url = builder.toUriString();

            ApiResponse<TourSpot> apiResponse = restClient.get()
                    .uri(url)
                    .header("Accept", "application/json")
                    .retrieve()
                    .body(new ParameterizedTypeReference<>() {});
            System.out.println("API 응답 원문: " + apiResponse);
            if (apiResponse == null ||
                apiResponse.getResponse() == null ||
                apiResponse.getResponse().getBody() == null ||
                apiResponse.getResponse().getBody().getItems() == null) {
                return List.of();
            }

            return apiResponse.getResponse().getBody().getItems().getItem();
    }
}
