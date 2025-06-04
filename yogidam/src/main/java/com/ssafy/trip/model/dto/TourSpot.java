package com.ssafy.trip.model.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.jackson.Jacksonized;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Jacksonized
public class TourSpot {
    @JsonProperty("contentid")
    private String contentId;
    @JsonProperty("title")
    private String title;
    @JsonProperty("addr1")
    private String addr1;
    @JsonProperty("addr2")
    private String addr2;
    @JsonProperty("areacode")
    private String areacode;
    @JsonProperty("booktour")
    private String booktour;
    @JsonProperty("cat1")
    private String cat1;
    @JsonProperty("cat2")
    private String cat2;
    @JsonProperty("cat3")
    private String cat3;
    @JsonProperty("contenttypeid")
    private String contenttypeid;
    @JsonProperty("createdtime")
    private String createdtime;
    @JsonProperty("firstimage")
    private String firstimage;
    @JsonProperty("firstimage2")
    private String firstimage2;
    @JsonProperty("cpyrhtDivCd")
    private String cpyrhtDivCd;
    @JsonProperty("mapx")
    private String mapx;
    @JsonProperty("mapy")
    private String mapy;
    @JsonProperty("mlevel")
    private String mlevel;
    @JsonProperty("modifiedtime")
    private String modifiedtime;
    @JsonProperty("sigungucode")
    private String sigungucode;
    @JsonProperty("tel")
    private String tel;
}