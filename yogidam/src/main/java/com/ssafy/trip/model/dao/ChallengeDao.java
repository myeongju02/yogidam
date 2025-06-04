package com.ssafy.trip.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssafy.trip.model.dto.Challenge;
import com.ssafy.trip.model.dto.ChallengePlan;
import com.ssafy.trip.model.dto.ChallengeStampRecord;
import com.ssafy.trip.model.dto.PlanAttraction;

@Mapper
public interface ChallengeDao {
	Challenge findByType(@Param("type") int type);
	void insert(ChallengeStampRecord record);
	List<ChallengeStampRecord> findByUserIdAndType(@Param("userId") String userId, @Param("type") int type);
	void delete(@Param("id") int id);
	
	// ----------
	List<ChallengePlan> findByUserId(String userId);
	List<PlanAttraction> findByPlanId(String planId);
	ChallengePlan findPlanById(String planId);
	void updateImageUrl(@Param("planAttractionId") String planAttractionId, @Param("imageUrl") String imageUrl);
	void updatePointGiven(@Param("planAttractionId") String planAttractionId, @Param("pointGiven") int pointGiven);
	PlanAttraction findPlanAttractionById(String planAttractionId);
	void addPoint(@Param("userId") String userId, @Param("point") int point);
	
	// ---------
	int countMissionsByType(@Param("type") int type);
	int countUserMissionsByType(@Param("userId") String userId, @Param("type") int type);

}
