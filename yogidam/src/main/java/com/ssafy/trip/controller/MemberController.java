package com.ssafy.trip.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.trip.model.dto.LoginRequest;
import com.ssafy.trip.model.dto.Member;
import com.ssafy.trip.model.service.MemberService;
import com.ssafy.trip.security.service.CustomUserDetailService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
@Tag(name="회원 API")
@RestController
@RequestMapping("/api/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService mService;
    private final PasswordEncoder passwordEncoder;
    private final CustomUserDetailService customUserDetailService; 

    
    @Operation(summary = "로그인", tags = {"회원 API"})
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest, HttpSession session) {
        try {
            Member member = mService.login(loginRequest.getUserId(), loginRequest.getPassword());
            session.setAttribute("loginUser", member);

            UserDetails userDetails = customUserDetailService.loadUserByUsername(member.getId());
            UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContext context = SecurityContextHolder.createEmptyContext();
            context.setAuthentication(authentication);
            SecurityContextHolder.setContext(context);

            // === 반드시 세션에 SecurityContext 저장 ===
            session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, context);

            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            System.out.println("Login Success Authentication: " + auth.getAuthorities());

            return ResponseEntity.ok(member);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        }
    }

    @PostMapping("/logout")
    public ResponseEntity<?> logout(HttpSession session) {
        session.invalidate();
        return ResponseEntity.ok().build();
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody Member member) {
        member.setPassword(passwordEncoder.encode(member.getPassword()));
        mService.registMember(member);
        return ResponseEntity.ok().build();
    }
    
    @Operation(summary = "사용자 프로필 이미지 조회", tags = {"회원 API"})
    @GetMapping("/profile")
    public ResponseEntity<String> getProfile(@RequestParam String userId) {
        Member member = mService.findById(userId);
        if (member == null) {
            return ResponseEntity.notFound().build();
        }
        // 예: member.getProfile()이 이미지 URL을 반환한다고 가정
        return ResponseEntity.ok(member.getProfile());
    }
}
