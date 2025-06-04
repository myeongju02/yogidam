package com.ssafy.trip.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import static org.springframework.security.config.Customizer.withDefaults;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import jakarta.servlet.http.Cookie;

@EnableWebSecurity
@Configuration
@EnableMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class CustomSecurityConfig {	
	@Autowired
    private CustomAuthFailureHandler customAuthFailureHandler;

    @Bean
    RoleHierarchy roleHierachy() {
        return RoleHierarchyImpl.withDefaultRolePrefix() // role의 기본 prefix 설정: ROLE_
                .role("ADMIN").implies("USER").role("USER").implies("GUEST").build();
    }

    @Bean
    PasswordEncoder passEncoder() {
        // 내부적으로 BCryptPasswordEncoder를 사용한다.
         return new BCryptPasswordEncoder();
        //return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    	
        http
            .authorizeHttpRequests(authorize -> authorize
                .requestMatchers(
                		HttpMethod.OPTIONS, "/**").permitAll()
                .requestMatchers(HttpMethod.GET, "/api/boards", "/api/boards/**").permitAll()
                .requestMatchers(HttpMethod.POST, "/api/boards").hasRole("USER") // 글쓰기 권한
                .requestMatchers(HttpMethod.PUT, "/api/boards/**").authenticated() // 수정 권한
                .requestMatchers(HttpMethod.DELETE, "/api/boards/**").authenticated()// 삭제 권한
                .requestMatchers("/api/member/login", "/api/member/register").permitAll()
                .requestMatchers("/api/**").authenticated()
                .requestMatchers("/secured/user/**").hasRole("USER")
                .requestMatchers("/secured/admin/**").hasRole("ADMIN")
                .requestMatchers("/auth/**").authenticated()
                .anyRequest().permitAll()
            )
            .csrf(csrf -> csrf.disable())
            .cors(withDefaults());

        // API 서버에서는 formLogin을 사용하지 않는 것이 일반적입니다.
        // 만약 필요하다면, 실제로 사용하는 경로로 맞추세요.
        // http.formLogin().disable();

        http.logout(logout -> logout
            .logoutUrl("/api/member/logout")
            .invalidateHttpSession(true)
            .logoutSuccessUrl("/")
            .deleteCookies("JSESSIONID", "remember-me")
        );

        http.rememberMe(remember -> remember.tokenValiditySeconds(60 * 60 * 24));

        return http.build();
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowedOrigins(List.of("http://localhost:5173")); // 프론트엔드 주소
        config.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        config.setAllowedHeaders(List.of("*"));
        config.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return source;
    }
}
