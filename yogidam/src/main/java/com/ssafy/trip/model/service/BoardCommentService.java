package com.ssafy.trip.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.trip.model.dao.BoardCommentDao;
import com.ssafy.trip.model.dto.BoardComment;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardCommentService {

    private final BoardCommentDao commentDao;
    
    public List<BoardComment> getCommentsByBoardId(int boardId, int page, int size) {
        int offset = page * size;
        return commentDao.findByBoardIdPaged(boardId, offset, size);
    }

    public boolean addComment(BoardComment comment) {
        return commentDao.insert(comment) > 0;
    }

    public boolean updateComment(BoardComment comment) {
        return commentDao.update(comment) > 0;
    }

    public boolean deleteComment(int id) {
        return commentDao.delete(id) > 0;
    }
}
