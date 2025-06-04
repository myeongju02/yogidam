package com.ssafy.trip.model.service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.trip.model.dao.BoardDao;
import com.ssafy.trip.model.dto.Board;
import com.ssafy.trip.model.dto.FileInfo;
import com.ssafy.trip.util.S3Util;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardDao boardDao;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Transactional(readOnly = true)
    public List<Board> getAllBoards() {
        List<Board> boards = boardDao.findAll();
        for (Board board : boards) {
            board.setImages(fromJson(board.getImagesJson()));
            board.setFiles(fromJson(board.getFilesJson()));
        }
        return boards;
    }

    @Transactional(readOnly = true)
    public Board getBoardById(String id) {
        Board board = boardDao.findById(id);
        if (board != null) {
            board.setImages(fromJson(board.getImagesJson()));
            board.setFiles(fromJson(board.getFilesJson()));
        }
        return board;
    }

    @Transactional
    public Board createBoard(Board board, List<MultipartFile> images, List<MultipartFile> files) {
    	List<FileInfo> imageInfos = uploadFilesToS3(images, "images");
        List<FileInfo> fileInfos = uploadFilesToS3(files, "files");

        board.setImages(imageInfos);
        board.setFiles(fileInfos);

        String now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        board.setCreatedAt(now);
        board.setImagesJson(toJson(board.getImages()));
        board.setFilesJson(toJson(board.getFiles()));

        boardDao.insert(board);
        return board;
    }
    
    @Autowired
    private S3Util s3Util;

    private List<FileInfo> uploadFilesToS3(List<MultipartFile> files, String dir) {
        List<FileInfo> fileInfos = new ArrayList<>();
        if (files != null) {
            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    try {
                        String url = s3Util.upload(file, dir);
                        // URL에서 UUID 추출 (예: "images/2779aab9-...")
                        String[] parts = url.split("/");
                        String fileName = parts[parts.length - 1];
                        String id = fileName.split("_")[0];  // UUID 부분 추출
                        fileInfos.add(new FileInfo(id, url));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return fileInfos;
    }

    @Transactional
    public boolean updateBoard(Board board, List<MultipartFile> images, List<MultipartFile> files) {
    	// 1. 기존 이미지/파일 정보
        List<FileInfo> existingImages = board.getImages();
        List<FileInfo> existingFiles = board.getFiles();

        // 2. 새로 업로드된 파일 S3 업로드
        List<FileInfo> newImages = uploadFilesToS3(images, "images");
        List<FileInfo> newFiles = uploadFilesToS3(files, "files");

        // 3. 기존 + 새 파일 합치기
        if (existingImages == null) existingImages = new ArrayList<>();
        if (newImages != null) existingImages.addAll(newImages);

        if (existingFiles == null) existingFiles = new ArrayList<>();
        if (newFiles != null) existingFiles.addAll(newFiles);

        // 4. 합쳐진 리스트를 저장
        board.setImages(existingImages);
        board.setFiles(existingFiles);
        board.setImagesJson(toJson(existingImages));
        board.setFilesJson(toJson(existingFiles));
        return boardDao.update(board) > 0;
    }

    @Transactional
    public boolean deleteBoard(String id) {
        return boardDao.delete(id) > 0;
    }

    @Transactional(readOnly = true)
    public boolean isAuthor(String boardId, String username) {
        Board board = boardDao.findById(boardId);
        return board != null && board.getAuthor().equals(username);
    }

    // JSON 변환 메서드
    private String toJson(List<FileInfo> list) {
        try {
            return objectMapper.writeValueAsString(list);
        } catch (Exception e) {
            return "[]";
        }
    }
    private List<FileInfo> fromJson(String json) {
        try {
            return json == null ? List.of() 
                : objectMapper.readValue(json, new TypeReference<List<FileInfo>>() {});
        } catch (Exception e) {
            return List.of();
        }
    }

    @Transactional
    public boolean deleteBoardFile(String boardId, String imageId, String username) {
        // 1. 게시글 조회 및 권한 확인
        Board board = boardDao.findById(boardId);
        if (board == null) return false;
        if (!board.getAuthor().equals(username)) return false;

        // 2. 기존 이미지 목록 파싱
        List<FileInfo> images = fromJson(board.getImagesJson());
        if (images == null || images.isEmpty()) return false;

        // 3. 삭제할 이미지 URL 찾기 
        FileInfo FileToDelete  = null;
        for (FileInfo info : images) {
            if (info.getId() != null && info.getId().equals(imageId)) {
            	FileToDelete = info;
                break;
            }
        }
        if (FileToDelete == null) {
            System.out.println("no image");
            return false; // 해당 이미지 없음
        }

        // 4. S3에서 파일 삭제
        try {
            s3Util.delete(FileToDelete.getUrl()); 
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 5. DB에서 이미지 URL 제거 및 저장
        images.remove(FileToDelete);
        board.setImages(images);
        board.setImagesJson(toJson(images));
        int updated = boardDao.update(board);

        return updated > 0;
    }
    
    @Transactional
    public List<Board> selectBoardsByUserId(String userId) {
    	return boardDao.selectBoardsByUserId(userId);
    }
}
