package com.wad.udo.restaurant.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class RestCmtInfo {
	// 글번호
	private int r_c_idx;
	// 회원번호
	private int idx;
	// 식당번호
	private int r_idx;
	// 코멘트
	private String r_c_comment;
	//평점
	private float r_c_star;
	// 사진
	private String r_c_photo;
	// 날짜
	private Date r_c_date;
	
	public RestCmtInfo() {
		this.r_c_date = new Date();
	}
	
	public RestCmtInfo(int r_c_idx, int idx, int r_idx, String r_c_comment, float r_c_star, String r_c_photo,
			Date r_c_date) {
		super();
		this.r_c_idx = r_c_idx;
		this.idx = idx;
		this.r_idx = r_idx;
		this.r_c_comment = r_c_comment;
		this.r_c_star = r_c_star;
		this.r_c_photo = r_c_photo;
		this.r_c_date = r_c_date;
	}

	public int getR_c_idx() {
		return r_c_idx;
	}

	public void setR_c_idx(int r_c_idx) {
		this.r_c_idx = r_c_idx;
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

	public String getR_c_photo() {
		return r_c_photo;
	}

	public void setR_c_photo(String r_c_photo) {
		this.r_c_photo = r_c_photo;
	}

	public Date getR_c_date() {
		return r_c_date;
	}

	public void setR_c_date(Date r_c_date) {
		this.r_c_date = r_c_date;
	}
	
	
	
}
