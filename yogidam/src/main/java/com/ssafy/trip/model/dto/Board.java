package com.ssafy.trip.model.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Board {
	private int id;
	private String title;
	private String content;
	private String author;
	private String createdAt;
    private String category;           // 카테고리
    private List<FileInfo> images;       // 이미지 파일명 리스트 (서버 저장 경로/URL 등)
    private List<FileInfo> files;        // 첨부파일명 리스트 (서버 저장 경로/URL 등)
    
    
    // DB 매핑용 임시 필드 (MyBatis에서 직접 매핑)
    private String imagesJson;
    private String filesJson;
}
