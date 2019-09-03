package com.wad.udo.restaurant.domain;

public class SearchParam {
	// 타입명
	private String searchType;
	// 입력한 키워드
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public SearchParam() {
	}
	public SearchParam(String searchType, String keyword) {
		super();
		this.searchType = searchType;
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchParam [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
