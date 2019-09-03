package com.wad.udo.restaurant.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wad.udo.restaurant.dao.RestDao;
import com.wad.udo.restaurant.domain.EditFormData;
import com.wad.udo.restaurant.domain.InsertFormData;
import com.wad.udo.restaurant.domain.RestCmtInfo;

@Service
public class RestCommentEditService implements RestService {
	@Autowired
	private SqlSessionTemplate template;
	
	private RestDao dao;
	
	
	public int editService(int r_c_idx, EditFormData editData, MultipartHttpServletRequest request) {
		String path = "/uploadfile/";
		
		String dir = request.getSession().getServletContext().getRealPath(path);
		String oldFile = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = 0;
		RestCmtInfo cmtInfo = editData.toCmtInfo();
		
		String newFileName = null;
		dao = template.getMapper(RestDao.class);
		
		if(editData.getR_c_photo() != null) {
			newFileName = editData.getR_c_photo().getOriginalFilename();
			oldFile = editData.getOldFile();
			try {
				editData.getR_c_photo().transferTo(new File(dir, newFileName));
				cmtInfo.setR_c_photo(newFileName);
				new File(dir, oldFile).delete();
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			cmtInfo.setR_c_photo(oldFile);
		}
		
		map.put("r_c_idx", r_c_idx);
		map.put("cmtInfo", cmtInfo);
		result = dao.updateCmt(map);
		
		return result;
	}
	
//	public int editService(int r_c_idx, EditFormData editData) {
//		int result = 0;
//		dao = template.getMapper(RestDao.class);
//		
//		return result;
//	}
}