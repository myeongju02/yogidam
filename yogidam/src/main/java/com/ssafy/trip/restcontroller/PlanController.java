package com.ssafy.trip.restcontroller;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.trip.model.dao.PlanDao;
import com.ssafy.trip.model.dto.Plan;
import com.ssafy.trip.model.dto.TourSpot;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/plans")
@RequiredArgsConstructor
public class PlanController {

	private final PlanDao planDao;

	// 1. 여행 계획(리스트) 저장
	@PostMapping("/save")
	public ResponseEntity<?> savePlan(@RequestBody Plan plan) {
		// planId 생성
		String planId = UUID.randomUUID().toString();
		plan.setPlanId(planId);

		// 1) 계획 저장
		planDao.insertPlan(plan);

		// 2) 관광지 리스트 유효성 검사
		if (plan.getAttractions() != null && !plan.getAttractions().isEmpty()) {
			List<String> attractionIds = plan.getAttractions().stream().map(TourSpot::getContentId)
					.filter(id -> id != null && !id.isBlank()).collect(Collectors.toList());
			
	        for (TourSpot spot : plan.getAttractions()) {
	            String attractionId = spot.getContentId();
	            if (attractionId == null || attractionId.isBlank()) continue;
	            int exists = planDao.existsAttraction(attractionId);
	            if (exists == 0) {
	                planDao.insertAttraction(spot);
	            }
	        }
	        
			System.out.println("planId: " + planId);
			System.out.println("attractionIds: " + attractionIds);
			if (!attractionIds.isEmpty()) {
				planDao.insertPlanAttractions(planId, attractionIds);
			}
		}
		return ResponseEntity.ok(planId);
	}

	// 2. 내 모든 계획 목록 조회
	@GetMapping
	public ResponseEntity<List<Plan>> getPlans(@RequestParam String userId) {
		List<Plan> plans = planDao.selectPlansByUserId(userId);
		return ResponseEntity.ok(plans);
	}

	// 3. 특정 계획의 관광지 목록 조회
	@GetMapping("/{planId}/attractions")
	public ResponseEntity<List<TourSpot>> getPlanAttractions(@PathVariable String planId) {
		List<TourSpot> spots = planDao.selectAttractionsByPlanId(planId);
		return ResponseEntity.ok(spots);
	}

	// 4. 계획 삭제 (관광지도 함께 삭제)
	@DeleteMapping("/{planId}")
	public ResponseEntity<?> deletePlan(@PathVariable String planId) {
		planDao.deletePlanAttractions(planId);
		planDao.deletePlan(planId);
		return ResponseEntity.ok().build();
	}
}
