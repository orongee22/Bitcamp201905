package com.bitcamp.mm.member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.member.dao.MemberDao;
import com.bitcamp.mm.member.domain.ListViewData;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.SearchParam;

import org.springframework.stereotype.Service;

@Service("listService")
public class MemberListService implements MemberService {
	@Autowired
	private MemberDao dao;
	
	final int MEMBER_COUNT_LIST = 10;
	
	public ListViewData getListData(int PageNumber, SearchParam searchparam) {
		ListViewData listData = new ListViewData();
		int currentPageNumber = PageNumber;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			listData.setCurrentPageNumber(currentPageNumber);
			
			// 전체 게시물의 개수
			int totalCnt = dao.selectTotalCount(conn, searchparam);
			
			// 전체 페이지 개수
			int totalPageCnt = 0;
			if(totalCnt > 0) {
				totalPageCnt = totalCnt/MEMBER_COUNT_LIST;
				if(totalCnt%MEMBER_COUNT_LIST>0) {
					totalPageCnt++;
				}
			}
			// 페이지 별 첫 시작 index값 구하기 
			int index = (currentPageNumber-1)*MEMBER_COUNT_LIST;
			
			// 회원 정보 리스트 : 검색별 조건에 의해 서로 다른 리스트가 출력되기 때문에 조건별 분기처리 하여 memberList를 받아와야 함. (searchparam == null) 이 디폴트 / selectList() 메소드 사용하여 전체 리스트 출력.
			List<MemberInfo> memberList = null;
			// 1. 검색 조건이 없는 경우? (searchparam==null): dao.selectList() 를 통해 전체 회원의 리스트를 출력하도록 함.
				// listData.setMemberList(dao.selectList(conn,index,MEMBER_COUNT_LIST)); => 전체 출력
			// 2. id로 검색 : dao.selectListById()
			// 3. name으로 검색 : dao.selectListByName()
			
			if(searchparam == null) {
				memberList = dao.selectList(conn, index, MEMBER_COUNT_LIST);
			} else if(searchparam.getSearchType().equals("both")) {
				memberList = dao.selectListByBoth(conn, index, MEMBER_COUNT_LIST, searchparam);
			} else if(searchparam.getSearchType().equals("id")) {
				memberList = dao.selectListById(conn, index, MEMBER_COUNT_LIST, searchparam);
			} else if(searchparam.getSearchType().equals("name")) {
				memberList = dao.selectListByName(conn, index, MEMBER_COUNT_LIST, searchparam);
			}
			
			
			listData.setMemberList(memberList);
			
			//  : 전체 게시물의 개수 - index(페이지 별 첫 시작 개수 index)
			int no = totalCnt - index;
			
			listData.setNo(no);
			listData.setPageTotalCount(totalPageCnt);
			listData.setTotalCount(totalCnt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return listData;
	}
}
