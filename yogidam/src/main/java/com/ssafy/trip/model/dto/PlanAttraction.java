package com.ssafy.trip.model.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlanAttraction {
	private String planAttractionId;
	private String planId;
	private String attractionId;
	private String attractionTitle;
	private LocalDate visitDate;
	private int visitOrder;
	private String memo;
	private String imageUrl;
}
