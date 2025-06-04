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
public class Plan {
	private String planId;
	private String userId;
	private String title;
	private String startDate;
	private String endDate;
	private String memo;
	private List<TourSpot> attractions; // 포함된 관광지 목록
	
    public void setStartDate(String startDate) {
        this.startDate = (startDate == null || startDate.isEmpty()) ? null : startDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = (endDate == null || endDate.isEmpty()) ? null : endDate;
    }
}