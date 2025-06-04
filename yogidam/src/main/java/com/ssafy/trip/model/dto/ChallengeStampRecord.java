package com.ssafy.trip.model.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChallengeStampRecord {
	private int userMissionId;
	private String userId;
	private int type;
	private String place;
	private String content;
	private String proof;
}
