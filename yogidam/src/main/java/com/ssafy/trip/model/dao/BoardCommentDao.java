package com.ssafy.trip.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssafy.trip.model.dto.BoardComment;

@Mapper
public interface BoardCommentDao {
    List<BoardComment> findByBoardIdPaged(@Param("boardId") int boardId, @Param("offset") int offset, @Param("limit") int limit);
    int countByBoardId(@Param("boardId") int boardId);
    int insert(BoardComment comment);
    int update(BoardComment comment);
    int delete(int id);
}
