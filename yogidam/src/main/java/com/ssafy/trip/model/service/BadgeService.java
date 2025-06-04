package com.ssafy.trip.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.trip.model.dao.BadgeMapper;
import com.ssafy.trip.model.dao.ChallengeDao;
import com.ssafy.trip.model.dao.UserMapper;
import com.ssafy.trip.model.dto.Badge;
import com.ssafy.trip.model.dto.PlanAttraction;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BadgeService {
    private final BadgeMapper badgeMapper; // 뱃지
    private final UserMapper userMapper; // ㅠㅗ인트
    private final ChallengeDao challengeDao;

    public List<Badge> getCompletedBadges(String userId) {
        return badgeMapper.findCompletedBadges(userId);
    }
    
    @Transactional
    public void handleMissionComplete(String userId, int missionType) {
        int count = badgeMapper.countMissionRecords(userId, missionType);
        System.out.println("count = " + count);
        if (count == 10) {
            System.out.println("포인트 지급!");
            userMapper.addPoint(userId, 10);
        }
    }
}
