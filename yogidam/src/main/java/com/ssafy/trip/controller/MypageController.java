package com.ssafy.trip.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.trip.model.dto.Badge;
import com.ssafy.trip.model.dto.Member;
import com.ssafy.trip.model.service.BadgeService;
import com.ssafy.trip.model.service.MemberService;
import com.ssafy.trip.security.dto.CustomUserDetails;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/mypage")
public class MypageController {
    private final MemberService memberService;
    private final BadgeService badgeService;


    public MypageController(MemberService memberService, BadgeService badgeService) {
        this.memberService = memberService;
        this.badgeService = badgeService;
    }
    
    @GetMapping("/detail")
    public ResponseEntity<Member> getProfile(Principal principal) {
        String userId = principal.getName();
        Member member = memberService.findById(userId);
        return ResponseEntity.ok(member);
    }

    @PutMapping("/update")
    public ResponseEntity<Member> updateProfile(@RequestBody UpdateRequest request, Principal principal) {
        String userId = principal.getName();
        memberService.update(userId,
            request.getNickname(),
            request.getPassword(),
            request.getEmail(),
            request.getProfileTitle());

        // 재인증
        Member updatedMember = memberService.findById(userId);
        CustomUserDetails userDetails = new CustomUserDetails(updatedMember);
        Authentication currentAuth = SecurityContextHolder.getContext().getAuthentication();
        Authentication newAuth = new UsernamePasswordAuthenticationToken(
            userDetails,
            currentAuth.getCredentials(),
            userDetails.getAuthorities()
        );
        SecurityContextHolder.getContext().setAuthentication(newAuth);

        return ResponseEntity.ok(updatedMember);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteProfile(
        Principal principal,
        HttpSession session,
        HttpServletResponse response
    ) {
        String userId = principal.getName();
        memberService.delete(userId);

        if (session != null) {
        	try {        		
        		session.invalidate();
        	} catch(IllegalStateException e) {}
        }

        SecurityContextHolder.clearContext();

        Cookie cookie = new Cookie("JSESSIONID", null);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        return ResponseEntity.noContent().build();
    }
    
    @GetMapping("/badges")
    public List<Badge> getBadges(Principal principal) {
        String userId = principal.getName();
        return badgeService.getCompletedBadges(userId);
    }



    // 클라이언트에서 보낼 요청 DTO
    public static class UpdateRequest {
        private String nickname;
        private String password;
        private String email;
        private String profileTitle;

        // getters & setters
        public String getNickname() { return nickname; }
        public void setNickname(String nickname) { this.nickname = nickname; }
        public String getPassword() { return password; }
        public void setPassword(String password) { this.password = password; }
        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }
        public String getProfileTitle() { return profileTitle; }
        public void setProfileTitle(String profileTitle) { this.profileTitle = profileTitle; }
    }
}
