package com.ssafy.trip.model.service;

import java.util.List;

import com.ssafy.trip.model.dto.Member;
import com.ssafy.trip.model.dto.Page;
import com.ssafy.trip.model.dto.SearchCondition;

public interface MemberService {
    int registMember(Member emp);

    Member login(String email, String password);

    /**
     * 사용자의 상세 정보를 가져온다고 치자.
     * 
     * @param email
     * @return
     * @
     */
    Member selectDetail(String email);

    Page<Member> search(SearchCondition condition);

    List<Member> searchAll();

    void delete(String id);

    void update(String id, String nickname, String password, String email, String profileTitle);
    
    Member findById(String userId); 

    void updateProfile(String email, byte[] profile);
}
