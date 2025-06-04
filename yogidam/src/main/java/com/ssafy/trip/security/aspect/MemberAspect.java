//package com.ssafy.trip.security.aspect;
//
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Component;
//
//import com.ssafy.trip.model.dto.Member;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Aspect
//@Component
//@Slf4j
//public class MemberAspect {
//    @Autowired
//    PasswordEncoder encoder;
//
//    @Before("execution( * com.ssafy..dao.*.insert(com.ssafy.trip.model.dto.Member)) && args(member)")
//    public void encodeMemberPassword(Member member) {
//        member.setPassword(encoder.encode(member.getPassword()));
//    }
//}
