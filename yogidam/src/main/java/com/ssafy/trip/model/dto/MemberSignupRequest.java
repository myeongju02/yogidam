package com.ssafy.trip.model.dto;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberSignupRequest {
    private String userId;
    private String password;
    private String nickname;
    private String email;
    @JsonFormat(pattern = "yyyy-MM-dd") 
    private LocalDate birth;
}