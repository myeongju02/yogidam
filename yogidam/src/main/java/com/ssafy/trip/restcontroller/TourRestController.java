
package com.ssafy.trip.restcontroller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.trip.model.dto.Category;
import com.ssafy.trip.model.dto.TourSpot;
import com.ssafy.trip.model.service.TourApiService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/tour")
@RequiredArgsConstructor
@Slf4j
@Tag(name = "Tourism API", description = "관광 정보 관련 API")
public class TourRestController {
    private final TourApiService tourApiService;

    @Operation(summary = "시/도 목록 조회", description = "전체 시/도 코드 목록 조회")
    @GetMapping("/regions/sido")
    public List<Category> getSidoList() {
        return tourApiService.getSidoList();
    }

    @Operation(summary = "구/군 목록 조회", description = "시/도 코드 기반 구/군 코드 목록 조회")
    @GetMapping("/regions/sigungu")
    public List<Category> getSigunguList(
        @RequestParam String sidoCode) {
        return tourApiService.getSigunguList(sidoCode);
    }
    
    @Operation(summary = "관광유형 목록 조회", description = "대분류 관광유형 코드 목록 조회")
    @GetMapping("/categories")
    public List<Category> getTourCategories() {
        return tourApiService.getTourCategories();
    }
    
    @Operation(summary = "관광지 이름 검색", description = "키워드로 관광지 정보를 검색합니다.")
    @GetMapping("/search")
    public List<TourSpot> searchTourSpotsByName(
            @RequestParam String keyword,
            @RequestParam(required = false) String areaCode,
            @RequestParam(required = false) String sigunguCode,
            @RequestParam(required = false) String cat1
    ) {
        return tourApiService.searchTourSpots(keyword, areaCode, sigunguCode, cat1);
    }
    
    @Operation(summary = "지역 기반 관광지 조회", description = "지역(시도, 군구, 카테고리)만으로 관광지 정보를 검색합니다.")
    @GetMapping("/search/region")
    public List<TourSpot> searchTourSpotsByRegion(
            @RequestParam(required = false) String areaCode,
            @RequestParam(required = false) String sigunguCode,
            @RequestParam(required = false) String cat1,
            @RequestParam(required = false) String cat2,
            @RequestParam(required = false) String cat3,
            @RequestParam(required = false) String contentTypeId
    ) {
        // Service에서 null이 아닌 값만 조건에 넣어 검색
        return tourApiService.searchTourSpotsByRegion(areaCode, sigunguCode, cat1, cat2, cat3, contentTypeId);
    }

}