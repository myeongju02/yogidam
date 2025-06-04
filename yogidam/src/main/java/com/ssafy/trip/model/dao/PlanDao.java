package com.ssafy.trip.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssafy.trip.model.dto.Plan;
import com.ssafy.trip.model.dto.TourSpot;

@Mapper
public interface PlanDao {
	// 1. 계획 저장
    void insertPlan(Plan plan);

    // 2. 계획별 관광지 저장 (여러 개)
    void insertPlanAttractions(@Param("planId") String planId, @Param("list") List<String> attractionIds);

    // 3. 내 모든 계획 목록 조회
    List<Plan> selectPlansByUserId(@Param("userId") String userId);

    // 4. 특정 계획의 관광지 목록 조회
    List<TourSpot> selectAttractionsByPlanId(@Param("planId") String planId);

    // 5. 계획 삭제
    void deletePlan(@Param("planId") String planId);

    // 6. 계획의 모든 관광지 삭제
    void deletePlanAttractions(@Param("planId") String planId);
    
    int existsAttraction(@Param("attractionId") String attractionId);
    void insertAttraction(TourSpot tourSpot);

}