package com.wad.udo.restaurant.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wad.udo.restaurant.dao.RestDao;
import com.wad.udo.restaurant.domain.RestCmtInfo;

@Service
public class RestCommentListService implements RestService {
	@Autowired
	private SqlSessionTemplate template;
	private RestDao dao;
	
	public List<RestCmtInfo> cmtListService(int r_idx) {
		dao = template.getMapper(RestDao.class);
		
		List<RestCmtInfo> list = dao.selectCommentListAll(r_idx);
		
//		System.out.println(list.get(1).getR_c_dateformat());
		
		return list;
	}
}
