package com.ssafy.trip.model.api.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Items<T> {
	@JsonProperty("item")
	private List<T> item;
}
