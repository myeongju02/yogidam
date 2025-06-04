package com.ssafy.trip.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.trip.model.dto.Challenge;
import com.ssafy.trip.model.dto.ChallengePlan;
import com.ssafy.trip.model.dto.ChallengeStampRecord;
import com.ssafy.trip.model.dto.Member;
import com.ssafy.trip.model.dto.PlanAttraction;
import com.ssafy.trip.model.service.BadgeService;
import com.ssafy.trip.model.service.ChallengeService;
import com.ssafy.trip.util.S3Util;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

//챌린지(미션) 정보 관리 및 뱃지 정보 기능 

@RestController
@RequestMapping("/api/challenge")
@RequiredArgsConstructor
public class ChallengeController {
	private final ChallengeService challengeService; 
	private final S3Util s3Service;
	
	@GetMapping("/stamp/{type}")
	public Challenge getMissions(@PathVariable int type) {
        return challengeService.getByType(type);
    }
	
	@PostMapping("/record")
	public ResponseEntity<?> saveRecord(@RequestBody ChallengeStampRecord record) {
		challengeService.saveRecord(record);
		return ResponseEntity.ok().build();
	}

	@PostMapping("/upload")
    public ResponseEntity<String> uploadImage(@RequestParam("file") MultipartFile file) throws IOException {
        String fileName = "challenge/" + java.util.UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        String imageUrl = s3Service.upload(file, fileName);
        return ResponseEntity.ok(imageUrl);
    }
	
	@GetMapping("/stamplist")
	public List<ChallengeStampRecord> getUserRecords(
	        @RequestParam String userId,
	        @RequestParam int type) {
	    return challengeService.findByUserIdAndType(userId, type);
	}
	
	@DeleteMapping("/record/{id}")
	public ResponseEntity<?> deleteRecord(@PathVariable int id) {
	    challengeService.deleteRecord(id);
	    return ResponseEntity.ok().build();
	}

	// -------------------------
	@GetMapping("/triplist")
	public ResponseEntity<List<ChallengePlan>> getMyPlans(HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		String userId = member.getId();
	    List<ChallengePlan> myPlans = challengeService.findPlansByUserId(userId);
	    return ResponseEntity.ok(myPlans);
	}

	@GetMapping("/triplistdetail/{planId}")
	public ResponseEntity<List<PlanAttraction>> getPlanAttration(@PathVariable String planId) {
		List<PlanAttraction> list = challengeService.findByPlanId(planId);
		return ResponseEntity.ok(list);
	}
	
	@GetMapping("/plan/{planId}")
	public ResponseEntity<ChallengePlan> getPlanById(@PathVariable String planId) {
	    ChallengePlan plan = challengeService.findPlanById(planId);
	    return ResponseEntity.ok(plan);
	}

	@PostMapping("/listupload")
	public ResponseEntity<Map<String, String>> uploadlistImage(@RequestParam("file") MultipartFile file) throws IOException {
	    String fileName = "challenge/" + UUID.randomUUID() + "_" + file.getOriginalFilename();
	    String imageUrl = s3Service.upload(file, fileName);
	    return ResponseEntity.ok(Map.of("imageUrl", imageUrl));
	}

	@PostMapping("/save")
	public ResponseEntity<?> savePlanAttractionImage(@RequestBody PlanAttraction dto) {
	    challengeService.updatePlanAttractionImage(dto.getPlanAttractionId(), dto.getImageUrl());
	    return ResponseEntity.ok().build();
	}

	@PostMapping("/listcomplete")
	public ResponseEntity<?> completeChallenge(@RequestBody Map<String, Object> params) {
		String userId = (String) params.get("userId");
        challengeService.addPointForList(userId);
        return ResponseEntity.ok().build();
	}

	// ------
	@GetMapping("/progress")
	public Map<String, Integer> getStampProgress(
	        @RequestParam String userId,
	        @RequestParam int type) {
	    int total = challengeService.countMissionsByType(type);
	    int done = challengeService.countUserMissionsByType(userId, type);
	    return Map.of("total", total, "done", done);
	}
}
