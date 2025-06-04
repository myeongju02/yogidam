package com.ssafy.trip.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChallengePlan {
	private String planId;
    private String userId;
    private String title;
    private Date startDate;
    private Date endDate;
    private Date createdAt;
    private String memo;
}
