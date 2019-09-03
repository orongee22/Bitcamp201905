package com.wad.udo.restaurant.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wad.udo.restaurant.dao.RestDao;
import com.wad.udo.restaurant.domain.EditFormData;
import com.wad.udo.restaurant.domain.InsertFormData;

@Service
public class RestCommentDeleteService implements RestService {
	@Autowired
	private SqlSessionTemplate template;
	
	private RestDao dao;
	
	
	public int deleteService(int r_c_idx) {
		int result = 0;
		dao = template.getMapper(RestDao.class);
		result = dao.deleteCmt(r_c_idx);
		return result;
	}
}
