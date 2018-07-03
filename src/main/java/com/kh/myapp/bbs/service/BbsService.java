package com.kh.myapp.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.myapp.bbs.dto.BbsDTO;
import com.kh.myapp.util.FindCriteria;
import com.kh.myapp.util.RecordCriteria;

public interface BbsService {
	// 글등록
	void write(BbsDTO bbsdto) throws Exception;

	void list(HttpServletRequest request) throws Exception;
	
	// 글목록 가져오기
	List<BbsDTO> list() throws Exception;

	// 요청페이지 글목록 가져오기
	List<BbsDTO> list(RecordCriteria recordCriteria) throws Exception;

	// 글내용 가져오기
	BbsDTO view(Integer bnum) throws Exception;

	// 글수정
	void modify(BbsDTO bbsdto) throws Exception;

	// 글삭제
	void delete(Integer bnum) throws Exception;

	// 원글 읽어오기
	BbsDTO replyView(Integer bnum) throws Exception;

	// 답글등록하기
	void reply(BbsDTO bbsdto) throws Exception;

	// 게시글 총계
	int totalRec() throws Exception;

	// 검색 목록 가져오기
	List<BbsDTO> list(FindCriteria findCriteria) throws Exception;

	// 검색결과 총계
	int searchTotalRec(FindCriteria findCriteria) throws Exception;

}
