package com.ssafy.trip.security.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ssafy.trip.model.dao.MemberDao;
import com.ssafy.trip.model.dto.Member;
import com.ssafy.trip.security.dto.CustomUserDetails;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomUserDetailService implements UserDetailsService {

    private final MemberDao mDao;

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        Member member = mDao.select(id);
        if (member == null) {
            throw new UsernameNotFoundException(id);
        }
        return new CustomUserDetails(member);
    }
}
