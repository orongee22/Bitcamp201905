package com.wad.udo.restaurant.domain;

import java.util.List;

// 리스트 전체 출력을 위한 domain
public class RestListData {
	// 전체 갯수
	private int totalCount;
	//현재 페이지 번호
	private int currentPageNum;
	private List<RestInfo> restInfoList;
	// 
	private int no;
	// 페이지당 보여줄 카운트 갯수
	private int pageTotalCount;
	
	public RestListData() {	}
	
	public RestListData(int totalCount, int currentPageNum, List<RestInfo> restInfoList, int no, int pageTotalCount) {
		super();
		this.totalCount = totalCount;
		this.currentPageNum = currentPageNum;
		this.restInfoList = restInfoList;
		this.no = no;
		this.pageTotalCount = pageTotalCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}

	public List<RestInfo> getRestInfoList() {
		return restInfoList;
	}

	public void setRestInfoList(List<RestInfo> restInfoList) {
		this.restInfoList = restInfoList;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}
	
	
	
}
