package com.ssafy.trip.model.api.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Response<T> {
	@JsonProperty("header")
	private Header header;

	@JsonProperty("body")
	private Body<T> body;
}