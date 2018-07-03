package com.kh.myapp.bbs.dao;

import java.util.List;

import com.kh.myapp.bbs.dto.RbbsDTO;
import com.kh.myapp.util.RecordCriteria;

public interface RbbsDAO {


	// 댓글등록
	void write(RbbsDTO rbbsdto) throws Exception;

	// 원글 댓글목록 가져오기
	List<RbbsDTO> list(Integer bnum) throws Exception;

	// 요청페이지 글목록 가져오기
	List<RbbsDTO> list(Integer bnum, RecordCriteria recordCriteria) throws Exception;

	// 댓글수정
	void modify(RbbsDTO rbbsdto) throws Exception;

	// 댓글삭제		
	void delete(Integer rnum) throws Exception;

	// 원댓글 읽어오기
	RbbsDTO replyView(Integer bnum) throws Exception;

	// 댓글등록하기
	void reply(RbbsDTO rbbsdto) throws Exception;

	// 좋아요 or 나빠요!
	void goodOrBad(Integer rNum, String goodOrBad) throws Exception;

	// 댓글 총계
	Integer replyTotalRec(Integer bnum) throws Exception;
	
}
