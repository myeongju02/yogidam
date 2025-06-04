package com.ssafy.trip.model.dao;

import com.ssafy.trip.model.dto.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardDao {
    List<Board> findAll();
    Board findById(@Param("id") String id);
    int insert(Board board);
    int update(Board board);
    int delete(@Param("id") String id);
    List<Board> selectBoardsByUserId(@Param("userId") String userId);
}
