package com.wad.udo.restaurant.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wad.udo.restaurant.domain.EditFormData;
import com.wad.udo.restaurant.domain.InsertFormData;
import com.wad.udo.restaurant.domain.RestCmtInfo;
import com.wad.udo.restaurant.service.RestCommentDeleteService;
import com.wad.udo.restaurant.service.RestCommentEditService;
import com.wad.udo.restaurant.service.RestCommentListService;
import com.wad.udo.restaurant.service.RestCommentPostService;

@CrossOrigin
@RestController
@RequestMapping("/restaurant/comment")
public class CommentController {

	@Autowired
	private RestCommentPostService cmtPostService;

	@Autowired
	private RestCommentListService cmtListService;
	
	@Autowired
	private RestCommentEditService cmtEditService;
	
	@Autowired
	private RestCommentDeleteService cmtDeleteService;
	

	@ResponseBody
	@GetMapping("/{r_idx}")
	public List<RestCmtInfo> cmtList(@PathVariable(value ="r_idx") int r_idx){
		List<RestCmtInfo> list = cmtListService.cmtListService(r_idx);
		return list;
	}
	
	@PostMapping
	public ResponseEntity<String> writeComment(InsertFormData formData, MultipartHttpServletRequest request) {
		System.out.println("CmtController - formData : " + formData);
		int result = cmtPostService.cmtPostService(formData, request);
		

		return new ResponseEntity<String>(result > 0 ? "success" : "fail", HttpStatus.OK);
	}
	

	
	@PostMapping("/{r_c_idx}")
	public ResponseEntity<String> editComment(@PathVariable(value="r_c_idx") int r_c_idx, EditFormData editData, MultipartHttpServletRequest request){
		
		int result = cmtEditService.editService(r_c_idx, editData, request);
		
		return new ResponseEntity<String>(result > 0 ? "success" : "fail", HttpStatus.OK);
	}

	@DeleteMapping("/{r_c_idx}")
	public ResponseEntity<String> deleteComment(@PathVariable(value="r_c_idx")int r_c_idx) {
		int result = cmtDeleteService.deleteService(r_c_idx);
		System.out.println("result : "+result);
		return new ResponseEntity<String>(result > 0 ? "success" : "fail", HttpStatus.OK);
	}
}