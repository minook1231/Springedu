package com.kh.myapp.util;

public class FindCriteria extends RecordCriteria {
	private String searchType; // 검색타입
	private String keyword;		 // 검색어
		
	public FindCriteria() {	}  // 디폴트 생성자
	
//	public FindCriteria(int reqPage) {
//		super(reqPage);
//	}
	
	public FindCriteria(int reqPage, String searchType, String keyword) {
		super(reqPage);
		this.searchType = searchType;
		this.keyword = keyword;
	}

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
	
	@Override
	public String toString() {
		return "FindCriteria [searchType=" + searchType + ", keyword=" + keyword
				+ "]";
	}
	
}
