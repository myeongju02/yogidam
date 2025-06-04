package com.ssafy.trip.model.api.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Header {
	@JsonProperty("resultCode")
	private String resultCode;

	@JsonProperty("resultMsg")
	private String resultMsg;
}
