package com.ssafy.trip.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TMapConfig {

    @Value("${tmap.api.key}")
    private String TMapApiKey;

    public String getKakaoMapApiKey() {
        return TMapApiKey;
    }
}
//TODO : 삭제