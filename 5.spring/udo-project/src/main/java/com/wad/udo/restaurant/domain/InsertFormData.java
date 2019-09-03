package com.wad.udo.restaurant.domain;

import org.springframework.web.multipart.MultipartFile;

public class InsertFormData {
	private int idx;
	private int r_idx;
	private String r_c_comment;
	private float r_c_star;
	private MultipartFile r_c_photo;
	
	public InsertFormData() {}
	
	public InsertFormData(int idx, int r_idx, String r_c_comment, float r_c_star, MultipartFile r_c_photo) {
		super();
		this.idx = idx;
		this.r_idx = r_idx;
		this.r_c_comment = r_c_comment;
		this.r_c_star = r_c_star;
		this.r_c_photo = r_c_photo;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getR_c_comment() {
		return r_c_comment;
	}
	public void setR_c_comment(String r_c_comment) {
		this.r_c_comment = r_c_comment;
	}
	public float getR_c_star() {
		return r_c_star;
	}
	public void setR_c_star(float r_c_star) {
		this.r_c_star = r_c_star;
	}
	public MultipartFile getR_c_photo() {
		return r_c_photo;
	}
	public void setR_c_photo(MultipartFile r_c_photo) {
		this.r_c_photo = r_c_photo;
	}
	
	public RestCmtInfo toCmtInfo() {
		RestCmtInfo cmtInfo = new RestCmtInfo();
		cmtInfo.setIdx(idx);
		cmtInfo.setR_c_comment(r_c_comment);
		cmtInfo.setR_c_star(r_c_star);
		cmtInfo.setR_idx(r_idx);
		
		return cmtInfo;
	}
	
}
