package com.wad.udo.restaurant.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wad.udo.restaurant.dao.RestDao;
import com.wad.udo.restaurant.domain.RestInfo;
import com.wad.udo.restaurant.domain.RestListData;
import com.wad.udo.restaurant.domain.SearchParam;

@Service
public class RestListService implements RestService {
	
	@Autowired
	private SqlSessionTemplate template;
	private RestDao dao;
	// 상수 : 페이지 당 보여줄 식당 정보 갯수
	final int PAGE_CNT_LIST = 9;
	
	// 페이징 처리를 위한 데이터
	public RestListData restListData(int pgNum, SearchParam searchParam){
		dao = template.getMapper(RestDao.class);
		RestListData listData = new RestListData();
		List<RestInfo> restInfoList = null;
		
		System.out.println("searchparam : "+searchParam);
		// 현재 페이지 번호
		listData.setCurrentPageNum(pgNum);
		// 전체 글 갯수
		int totalCount = dao.selectTotalCount(searchParam);
		listData.setTotalCount(totalCount);
		
		
		int totalPageCount = 0;
		
		if(totalCount > 0) {
			totalPageCount = totalCount/PAGE_CNT_LIST;
			if(totalCount%PAGE_CNT_LIST > 0) {
				totalPageCount++;
			}
		}
		
		listData.setPageTotalCount(totalPageCount);
		
		int index = (pgNum-1)*PAGE_CNT_LIST;
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("index", index);
		param.put("count", PAGE_CNT_LIST);
		param.put("search", searchParam);
		
		restInfoList = dao.selectListAll(param);
		if(restInfoList.size()>0) {
			
			System.out.println("restInfoList : "+restInfoList.get(0).getR_name());
		}
		listData.setRestInfoList(restInfoList);
		int no = totalCount - index;
		
		listData.setNo(no);
		
		
		return listData;
	}
	
	// 전체 리스트 출력하기
//	public List<RestInfo> getListAll(){
//		List<RestInfo> list = null;
//		
//		
//		dao = template.getMapper(RestDao.class);		
//		list = dao.selectListAll();
//		
//		System.out.println("list : "+list);
//		return list;
//	}
}
