package com.wad.udo.restaurant.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wad.udo.restaurant.dao.RestDao;
import com.wad.udo.restaurant.domain.InsertFormData;
import com.wad.udo.restaurant.domain.RestCmtInfo;

@Service("RestCommentPostService")
public class RestCommentPostService implements RestService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private RestDao dao;
	
	
	public int cmtPostService(InsertFormData formData, MultipartHttpServletRequest request) {
		String path = "/uploadfile/";
		
		String dir = request.getSession().getServletContext().getRealPath(path);
		RestCmtInfo cmtInfo = formData.toCmtInfo();
		int result = 0;
		String newFileName = null;
		
		dao = template.getMapper(RestDao.class);
		
		if(formData.getR_c_photo() != null) {
			newFileName = System.nanoTime()+"_"+formData.getR_c_photo().getOriginalFilename();
			try {
				formData.getR_c_photo().transferTo(new File(dir, newFileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		cmtInfo.setR_c_photo(newFileName);
		
		} else {
			cmtInfo.setR_c_photo("noimg.jpg");
		}
		
		
		
		
		result = dao.insertComment(cmtInfo);
		
		return result;
	}
	
	
}
