package com.ssafy.trip.model.api.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class ApiResponse<T> {
	@JsonProperty("response")
	private Response<T> response;
}
