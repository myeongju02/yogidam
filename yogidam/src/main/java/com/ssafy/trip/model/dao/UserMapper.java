package com.ssafy.trip.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {
    void addPoint(@Param("userId") String userId, @Param("point") int point);
}
