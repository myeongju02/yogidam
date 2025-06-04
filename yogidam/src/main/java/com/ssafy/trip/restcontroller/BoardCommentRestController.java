package com.ssafy.trip.restcontroller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.trip.model.dao.BoardCommentDao;
import com.ssafy.trip.model.dto.BoardComment;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/boards/{boardId}/comments")
@RequiredArgsConstructor
@Tag(name = "댓글 API", description = "게시글 댓글 CRUD + 페이징 + 대댓글")
public class BoardCommentRestController {

    private final BoardCommentDao commentDao;

    @Operation(summary = "댓글 목록(페이징)")
    @GetMapping
    public ResponseEntity<Map<String, Object>> getComments(
            @PathVariable int boardId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        int offset = page * size;
        List<BoardComment> comments = commentDao.findByBoardIdPaged(boardId, offset, size);
        int total = commentDao.countByBoardId(boardId);
        Map<String, Object> result = new HashMap<>();
        result.put("comments", comments);
        result.put("total", total);
        return ResponseEntity.ok(result);
    }

    @Operation(summary = "댓글 등록")
    @PostMapping
    public ResponseEntity<String> addComment(
            @PathVariable int boardId,
            @RequestBody BoardComment comment) {
        comment.setBoardId(boardId);
        boolean result = commentDao.insert(comment) > 0;
        return result ? ResponseEntity.ok("댓글이 등록되었습니다.") : ResponseEntity.badRequest().body("등록 실패");
    }

    @Operation(summary = "댓글 수정")
    @PutMapping("/{commentId}")
    public ResponseEntity<String> updateComment(
            @PathVariable int boardId,
            @PathVariable int commentId,
            @RequestBody BoardComment comment) {
        comment.setId(commentId);
        comment.setBoardId(boardId);
        boolean result = commentDao.update(comment) > 0;
        return result ? ResponseEntity.ok("댓글이 수정되었습니다.") : ResponseEntity.badRequest().body("수정 실패");
    }

    @Operation(summary = "댓글 삭제")
    @DeleteMapping("/{commentId}")
    public ResponseEntity<String> deleteComment(
            @PathVariable int boardId,
            @PathVariable int commentId) {
        boolean result = commentDao.delete(commentId) > 0;
        return result ? ResponseEntity.ok("댓글이 삭제되었습니다.") : ResponseEntity.badRequest().body("삭제 실패");
    }
}
