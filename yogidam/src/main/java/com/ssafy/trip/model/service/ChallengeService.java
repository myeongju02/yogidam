package com.ssafy.trip.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.trip.model.dao.ChallengeDao;
import com.ssafy.trip.model.dao.UserMapper;
import com.ssafy.trip.model.dto.Challenge;
import com.ssafy.trip.model.dto.ChallengePlan;
import com.ssafy.trip.model.dto.ChallengeStampRecord;
import com.ssafy.trip.model.dto.PlanAttraction;

@Service
public class ChallengeService {
	private final ChallengeDao challengeDao;
	private final BadgeService badgeService;
	private final UserMapper userMapper;
	
	public ChallengeService(ChallengeDao challengeDao, BadgeService badgeService, UserMapper userMapper) {
        this.challengeDao = challengeDao;
        this.badgeService = badgeService;
        this.userMapper = userMapper;
    }

    public void saveRecord(ChallengeStampRecord record) {
        challengeDao.insert(record);
        badgeService.handleMissionComplete(record.getUserId(), record.getType());
    }

    public Challenge getByType(int type) {
        return challengeDao.findByType(type);
    }
    
    public List<ChallengeStampRecord> findByUserIdAndType(String userId, int type) {
        return challengeDao.findByUserIdAndType(userId, type);
    }

    public void deleteRecord(int id) {
        challengeDao.delete(id);
    }

    // ------------------
    public List<ChallengePlan> findPlansByUserId(String userId) {
        return challengeDao.findByUserId(userId);
    }

    public List<PlanAttraction> findByPlanId(String planId) {
    	return challengeDao.findByPlanId(planId);
    }
    
    public ChallengePlan findPlanById(String planId) {
        return challengeDao.findPlanById(planId);
    }
    
    public void updatePlanAttractionImage(String planAttractionId, String imageUrl) {
    	challengeDao.updateImageUrl(planAttractionId, imageUrl);
    }
    
    @Transactional
    public void addPointForList(String userId) {
        userMapper.addPoint(userId, 10);
    }
    
    // -----------
    public int countMissionsByType(int type) {
        return challengeDao.countMissionsByType(type);
    }
    
    public int countUserMissionsByType(String userId, int type) {
        return challengeDao.countUserMissionsByType(userId, type);
    }
}
