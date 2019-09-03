package com.wad.udo.restaurant.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wad.udo.restaurant.domain.RestInfo;
import com.wad.udo.restaurant.domain.RestListData;
import com.wad.udo.restaurant.domain.SearchParam;
//import com.wad.udo.restaurant.domain.RestListData;
import com.wad.udo.restaurant.service.RestListService;
@CrossOrigin
@RestController
@RequestMapping("/restaurant/list")
public class RestListController {
	
	@Autowired
	private RestListService restListService;
	
	@GetMapping
	public ResponseEntity<RestListData> restListAll(@RequestParam(value = "page", defaultValue = "1") int page,@RequestParam(value = "searchType", required = false) String sType, @RequestParam(value="keyword", required = false) String keyword) {

		SearchParam searchParam = null;
		
		if(sType!=null && keyword!=null && !sType.isEmpty() && !keyword.isEmpty() ) {
			searchParam = new SearchParam();
			searchParam.setSearchType(sType);
			searchParam.setKeyword(keyword);
			System.out.println("컨트롤러 : "+searchParam);
		}
		
		RestListData listData = restListService.restListData(page,searchParam);
		
		ResponseEntity<RestListData> entity = new ResponseEntity<RestListData>(listData,HttpStatus.OK);
		
		return entity;
	}
	
//	@CrossOrigin
//	@GetMapping("/{idx}/")
//	public ResponseEntity<RestInfo> viewPost(@RequestParam(value = "idx")int r_idx){
//		RestInfo restInfo;
//		ResponseEntity<RestInfo> entity = new ResponseEntity<RestInfo>(restInfo, HttpStatus.OK);
//		
//		return entity;
//	}

}
