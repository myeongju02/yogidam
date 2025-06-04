package com.ssafy.trip.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestClient;

@Configuration
public class RestClientConfig {
    @Bean
    RestClient restClient() {
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        converter.setSupportedMediaTypes(
            List.of(MediaType.APPLICATION_JSON, MediaType.TEXT_XML)
        );
        return RestClient.builder()
            .baseUrl("https://apis.data.go.kr/B551011/KorService2")
            .defaultHeader("Accept", "application/json")
            .messageConverters(converters -> converters.add(converter))
            .build();
    }
}