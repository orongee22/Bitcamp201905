package com.bitcamp.mm.member.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.SearchParam;

public interface MemberSessionDao {
	public MemberInfo selectMemberById(String userId);
	public int insertMember(MemberInfo memberInfo);
//	public List<MemberInfo> selectList(int index, int count);
	// searchparam / index / count / 세 가지의 파라미터 값을 보내기 위해 Map으로 묶어서 key값으로 찾을 것
	public List<MemberInfo> selectList(Map<String, Object> params);
	public int selectTotalCount(SearchParam searchparam);
	public int editMemberById(MemberInfo memberinfo);
	public int deleteMemberById(String uId);
}
