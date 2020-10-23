package com.mvc.homeseek.model.biz;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.homeseek.model.dao.MemberDao;
import com.mvc.homeseek.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {
	
	@Autowired
	private MemberDao memberDao;
	
	
	@Override
	public MemberDto login(MemberDto dto) {
		return memberDao.login(dto);
	}
	
	@Override
	public int insert(MemberDto dto) {
		return memberDao.insert(dto);
	}

	@Override
	public MemberDto selectMemberById(String id) {
		return memberDao.selectMemberById(id);
	};
	
	@Override
	public int checkId(String member_id){
		
		return memberDao.checkId(member_id);
		
	}

	@Override
	public MemberDto getBySns(MemberDto snsUser) {
		
		return memberDao.getBySns(snsUser);
	}
}

