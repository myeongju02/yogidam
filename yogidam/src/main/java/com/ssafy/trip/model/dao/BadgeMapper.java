package com.ssafy.trip.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssafy.trip.model.dto.Badge;

@Mapper
public interface BadgeMapper {
    List<Badge> findCompletedBadges(@Param("userId") String userId);
    int countMissionRecords(@Param("userId") String userId, @Param("type") int type);
}