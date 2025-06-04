package com.ssafy.trip.restcontroller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.trip.model.dto.Board;
import com.ssafy.trip.model.service.BoardService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/boards")
@RequiredArgsConstructor
@Tag(name = "게시판 API", description = "게시판 CRUD API")

public class BoardRestController {

	private final BoardService boardService;
	
	@Operation(summary = "전체 게시글 조회", description = "등록된 모든 게시글을 조회합니다.")
	@GetMapping
	public ResponseEntity<List<Board>> getAllBoards() {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//      System.out.println("Login Success Authentication: " + auth);
		return ResponseEntity.ok(boardService.getAllBoards());
	}

	@Operation(summary = "게시글 상세 조회")
	@GetMapping("/{id}")
	public ResponseEntity<Board> getBoardById(
			@Parameter(description = "게시글 ID", required = true) @PathVariable String id) {
		Board board = boardService.getBoardById(id);
		if (board == null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(board);
	}

	@Operation(summary = "신규 게시글 등록")
	@PostMapping
	public ResponseEntity<Board> createBoard(@RequestPart("board") Board board,
			@RequestPart(value = "images", required = false) List<MultipartFile> images,
			@RequestPart(value = "files", required = false) List<MultipartFile> files) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName(); 

		board.setAuthor(username);
		return new ResponseEntity<>(boardService.createBoard(board, images, files), HttpStatus.CREATED);
	}

	@Operation(summary = "게시글 수정")
	@PreAuthorize("(hasRole('USER') or hasRole('ADMIN')) && @boardService.isAuthor(#id, authentication.name)")	
	@PutMapping(value = "/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<String> updateBoard(
	    @PathVariable String id,
	    @RequestPart("board") Board board,
	    @RequestPart(value = "images", required = false) List<MultipartFile> images,
	    @RequestPart(value = "files", required = false) List<MultipartFile> files
	) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName(); 

		board.setAuthor(username);
	    boolean updated = boardService.updateBoard(board, images, files);
	    return updated ? ResponseEntity.ok("수정 성공") : ResponseEntity.notFound().build();
	}


	@Operation(summary = "게시글 삭제")
	@PreAuthorize("(hasRole('USER') or hasRole('ADMIN')) && @boardService.isAuthor(#id, authentication.name)")
	@DeleteMapping("/{id}")
	public ResponseEntity<String> deleteBoard(
			@Parameter(description = "게시글 ID", required = true) @PathVariable String id) {
		boolean deleted = boardService.deleteBoard(id);
		return deleted ? ResponseEntity.ok("게시글이 삭제되었습니다.") : ResponseEntity.notFound().build();
	}
	
	@Operation(summary = "게시글 이미지 삭제")
	@PreAuthorize("(hasRole('USER') or hasRole('ADMIN')) && @boardService.isAuthor(#boardId, authentication.name)")
	@DeleteMapping("/{boardId}/images/{imageId}")
	public ResponseEntity<String> deleteBoardImage(
	        @PathVariable String boardId,
	        @PathVariable String imageId
	) {
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String username = authentication.getName();

	    boolean deleted = boardService.deleteBoardFile(boardId, imageId, username);
	    return deleted ? ResponseEntity.ok("이미지가 삭제되었습니다.") : ResponseEntity.notFound().build();
	}
	
    @Operation(summary = "내 게시물 찾기")
    @GetMapping("/my")
    public ResponseEntity<List<Board>> getMyBoards(@RequestParam String userId) {
        List<Board> boards = boardService.selectBoardsByUserId(userId);
        return ResponseEntity.ok(boards);
    }
}
