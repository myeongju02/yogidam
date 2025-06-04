package com.ssafy.trip.config;

import java.util.List;

import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;

@Configuration
@OpenAPIDefinition(info = @Info(title = "SSAFY HRM API 명세서", description = "API 명세서 테스트 입니다.", version = "v1"))
public class SwaggerConfig {
//    @Bean
//    GroupedOpenApi memberOpenApi() {
//        String[] paths = { "/api/v1/members/**" };
//        return GroupedOpenApi.builder().group("Member 관련 API").pathsToMatch(paths).build();
//    }
	@Bean
	GroupedOpenApi memberApi() {
	    String[] paths = { "/api/member/**" };
	    return GroupedOpenApi.builder()
	        .group("회원 API")
	        .pathsToMatch(paths)
	        .build();
	}


    @Bean
    GroupedOpenApi otherOpenApi() {
        String[] paths = { "/api/v1/etc/**" };
        return GroupedOpenApi.builder().group("기타 API").pathsToMatch(paths).build();
    }
    
    @Bean
    GroupedOpenApi tourismApi() {
        String[] paths = { "/api/tour/**" };
        return GroupedOpenApi.builder()
            .group("Tourism API")
            .pathsToMatch(paths)
            .build();
    }
    
    @Bean
    public GroupedOpenApi boardApi() {
        return GroupedOpenApi.builder()
                .group("게시판 API")
                .pathsToMatch("/api/boards/**")
                .build();
    }
}
