package com.ssafy.trip.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.trip.model.dto.Member;
import com.ssafy.trip.model.dto.SearchCondition;

@Mapper
public interface MemberDao {
    int insert(Member member);

    public int update(Member member);
    
    Member findById(String id);

    public int delete(String id);

    public int updateProfile(String email, byte[] profile);

    Member select(String id);

    List<Member> searchAll();

    public Member selectDetail(String email);

    public int getTotalCount(SearchCondition condition);

    public List<Member> search(SearchCondition condition);

}
