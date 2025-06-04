package com.ssafy.trip.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.trip.exception.RecordNotFoundException;
import com.ssafy.trip.model.dao.MemberDao;
import com.ssafy.trip.model.dto.Member;
import com.ssafy.trip.model.dto.Page;
import com.ssafy.trip.model.dto.SearchCondition;

@Service
//@RequiredArgsConstructor
public class BasicMemberService implements MemberService {
    private final MemberDao mDao;
    private final PasswordEncoder passwordEncoder;

    public BasicMemberService(MemberDao m, PasswordEncoder passwordEncoder) {
        this.mDao = m;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public int registMember(Member member) {
        int result = mDao.insert(member);
        return result;
    }

    @Override
    public Member login(String id, String password) {
        Member member = mDao.select(id);
        if (member != null && passwordEncoder.matches(password, member.getPassword())) {
            return member;
        } else {
            throw new RecordNotFoundException("id/pass 확인");
        }
    }


    @Override
    public Member selectDetail(String email) {
        return mDao.selectDetail(email);
    }

    public List<Member> searchAll() {
        return mDao.searchAll();
    }

    @Override
    public Page<Member> search(SearchCondition condition) {
        // 전체 회원 수 조회
        int totalItems = mDao.getTotalCount(condition);
        // 현재 페이지의 회원 목록 조회
        List<Member> members = mDao.search(condition);
        // 페이지네이션 정보 생성
        Page<Member> page = new Page<>(condition, totalItems, members);
        return page;
    }

    @Override
    @Transactional
    public void delete(String id) { 
        mDao.delete(id);
    }

    @Override
    public void update(String userid, String nickname, String password, String email, String profileTitle) {
        Member member = mDao.select(userid);
        member.setNickname(nickname);
        if(password != null && !password.isEmpty()) {
        	member.setPassword(passwordEncoder.encode(password));
        }
        member.setEmail(email);
        member.setProfileTitle(profileTitle);
    	mDao.update(member);
    }

    @Override
    public void updateProfile(String email, byte[] profile) {
        mDao.updateProfile(email, profile);
    }

	@Override
	public Member findById(String userId) {
		return mDao.findById(userId);
	}
}
