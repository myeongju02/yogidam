package com.ssafy.trip.restcontroller;

import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/tmap")
@RequiredArgsConstructor
public class TmapRestController {

    private final RestTemplate restTemplate;

    @Value("${tmap.api.key}")
    private String tmapAppKey;

    // POI 검색 예시 (GET)
    @GetMapping("/search")
    public ResponseEntity<String> searchPoi(@RequestParam String keyword) {
        String url = "https://apis.openapi.sk.com/tmap/pois";

        HttpHeaders headers = new HttpHeaders();
        headers.set("appKey", tmapAppKey);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("version", "1")
                .queryParam("searchKeyword", keyword)
                .queryParam("resCoordType", "WGS84GEO")
                .queryParam("reqCoordType", "WGS84GEO");

        HttpEntity<?> entity = new HttpEntity<>(headers);

        return restTemplate.exchange(builder.build().toUri(), HttpMethod.GET, entity, String.class);
    }

    @PostMapping("/route/multistop")
    public ResponseEntity<?> multiStopRoute(@RequestBody Map<String, Object> reqData) {
        String url = "https://apis.openapi.sk.com/tmap/routes?version=1&format=json";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("appKey", tmapAppKey);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(reqData, headers);

        ResponseEntity<String> tmapRes = restTemplate.postForEntity(url, entity, String.class);

        ObjectMapper mapper = new ObjectMapper();
        JsonNode root;
        try {
            root = mapper.readTree(tmapRes.getBody());
        } catch (JsonProcessingException e) {
            return ResponseEntity.status(500).body("Tmap 응답 파싱 실패");
        }

        return ResponseEntity.ok(root);
    }


}
