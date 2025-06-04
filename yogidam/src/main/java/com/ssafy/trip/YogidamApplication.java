package com.ssafy.trip;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@MapperScan("com.ssafy.trip.model.dao")
@SpringBootApplication
@ComponentScan(basePackages = {
	    "com.ssafy.trip",           // 기존 메인 패키지
	    "com.other.package.member" // MemberController가 있는 곳
	})
public class YogidamApplication {

	public static void main(String[] args) {
		SpringApplication.run(YogidamApplication.class, args);
	}

}



