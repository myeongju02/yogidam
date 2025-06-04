//package com.ssafy.trip.restcontroller;
//
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.web.bind.annotation.CrossOrigin;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.ssafy.trip.model.dto.LoginRequest;
//import com.ssafy.trip.model.dto.Member;
//import com.ssafy.trip.model.dto.MemberSignupRequest;
//import com.ssafy.trip.model.dto.UpdateMemberRequest;
//import com.ssafy.trip.model.service.MemberService;
//
//import io.swagger.v3.oas.annotations.Operation;
//import io.swagger.v3.oas.annotations.responses.ApiResponse;
//import io.swagger.v3.oas.annotations.responses.ApiResponses;
//
//@CrossOrigin(origins = "http://localhost:8080") // Swagger UI 주소
//@RestController
//@RequestMapping("/api/v1/members")
//public class MemberRestController {
//
//	private final MemberService memberService;
//	private final PasswordEncoder passwordEncoder;
//
//	public MemberRestController(MemberService memberService, PasswordEncoder passwordEncoder) {
//		this.memberService = memberService;
//		this.passwordEncoder = passwordEncoder;
//	}
//
//	@Operation(summary = "로그인")
//	@PostMapping("/login")
//	public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) {
//		Member member = memberService.login(loginRequest.getUserId(), loginRequest.getPassword());
//		if (member != null) {
//			return ResponseEntity.ok(member);
//		} else {
//			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("아이디 또는 비밀번호가 올바르지 않습니다.");
//		}
//	}
//
//	@Operation(summary = "회원가입", description = "새로운 회원을 등록합니다.")
//	@ApiResponses(value = { @ApiResponse(responseCode = "201", description = "회원가입 성공"),
//			@ApiResponse(responseCode = "400", description = "잘못된 요청") })
//	
//	@PostMapping("/signup")
//	public ResponseEntity<?> signup(@RequestBody MemberSignupRequest request) {
//		System.out.println("birth: " + request.getBirth()); 
//		Member member = new Member();
//		member.setId(request.getUserId());
//		member.setNickname(request.getNickname());
//		member.setEmail(request.getEmail());
//		member.setPassword(passwordEncoder.encode(request.getPassword()));
//		member.setBirth(request.getBirth());
//
//		int result = memberService.registMember(member);
//
//		if (result > 0) {
//			return ResponseEntity.status(HttpStatus.CREATED).body("회원가입 성공");
//		} else {
//			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("회원가입 실패");
//		}
//	}
//
//	@Operation(summary = "회원정보 조회")
//	@GetMapping("/{userId}")
//	public ResponseEntity<Member> getMember(@PathVariable String userId) {
//		Member member = memberService.findById(userId);
//		return ResponseEntity.ok(member);
//	}
//
//	@Operation(summary = "회원정보 수정")
//	@PutMapping("/{userId}")
//	public ResponseEntity<Member> updateMember(@PathVariable String userId, @RequestBody UpdateMemberRequest req) {
//		memberService.update(userId, req.getNickname(), req.getPassword(), req.getEmail(), req.getProfiletitle());
//		Member updated = memberService.findById(userId);
//		return ResponseEntity.ok(updated);
//	}
//
//	@Operation(summary = "회원탈퇴")
//	@DeleteMapping("/{userId}")
//	public ResponseEntity<Void> deleteMember(@PathVariable String userId) {
//		memberService.delete(userId);
//		return ResponseEntity.noContent().build();
//	}
//}