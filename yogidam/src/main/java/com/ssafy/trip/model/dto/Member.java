package com.ssafy.trip.model.dto;

import java.time.LocalDate;
import jakarta.annotation.Nonnull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
	private String id;
	private @NonNull String password;
	private @NonNull String nickname;
	private @NonNull Integer point;
    private @NonNull String email;
    private @NonNull LocalDate birth;
    private @NonNull String profile;
    private @NonNull String profileTitle;
    private @Nonnull String role;

    public Member(String id, String password, String nickname, int point, String email, LocalDate birth, String profile, String profileTitle, String role) {
        this.id = id;
        this.password = password;
        this.nickname = nickname;
        this.point = point;
        this.email = email;
        this.birth = birth;
        this.profile = profile;
        this.profileTitle = profileTitle;
        this.role = role;
    }
}
