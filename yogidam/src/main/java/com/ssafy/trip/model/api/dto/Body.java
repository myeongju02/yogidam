package com.ssafy.trip.model.api.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;


@Data
public class Body<T> {
	@JsonProperty("items")
	private Items<T> items;

	@JsonProperty("numOfRows")
	private int numOfRows;

	@JsonProperty("pageNo")
	private int pageNo;

	@JsonProperty("totalCount")
	private int totalCount;
}