package com.kh.myapp.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.bbs.dto.RbbsDTO;
import com.kh.myapp.util.RecordCriteria;

@Repository
public class RbbsDAOImplXML implements RbbsDAO {

	private static final Logger logger = 
			LoggerFactory.getLogger(RbbsDAOImplXML.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	// 댓글등록
	@Override
	public void write(RbbsDTO rbbsdto) throws Exception {
		sqlSession.insert("rbbsdao.write", rbbsdto);
	}

	// 원글 댓글목록 가져오기	
	@Override
	public List<RbbsDTO> list(Integer bnum) throws Exception {
		return sqlSession.selectList("rbbsdao.listAll", bnum);
	}

	// 요청페이지 글목록 가져오기	
	@Override
	public List<RbbsDTO> list(Integer bnum, RecordCriteria recordCriteria)
			throws Exception {
		
		Map<String,Object> map = new HashMap<>();
		map.put("bnum", bnum);
		map.put("recordCriteria", recordCriteria);
			
		return sqlSession.selectList("rbbsdao.list", map);
	}


	// 댓글수정	
	@Override
	public void modify(RbbsDTO rbbsdto) throws Exception {
		sqlSession.update("rbbsdao.update", rbbsdto);
	}

	// 댓글삭제		
	@Override
	public void delete(Integer rnum) throws Exception {
		sqlSession.delete("rbbsdao.delete", rnum);
	}

	// 원댓글 읽어오기	
	@Override
	public RbbsDTO replyView(Integer bnum) throws Exception {
		return sqlSession.selectOne("rbbsdao.replyView", bnum);
	}

	// 댓글등록하기	
	@Override
	public void reply(RbbsDTO rbbsdto) throws Exception {
		
		// 댓글의 원글정보 가져오기
		RbbsDTO rbbsOrgDTO = replyView(Integer.valueOf(rbbsdto.getRnum()));
		
	  //이전 댓글 step 업데이트
		updateStep(rbbsOrgDTO.getRgroup(),rbbsOrgDTO.getRstep());	
		
		rbbsdto.setBnum(rbbsOrgDTO.getBnum());				//원글 번호		
		rbbsdto.setRgroup(rbbsOrgDTO.getRgroup());   	//댓글번호
		rbbsdto.setRstep(rbbsOrgDTO.getRstep()+1);  	//댓글단계
		rbbsdto.setRindent(rbbsOrgDTO.getRindent()+1);	//댓글들여쓰기
		
		sqlSession.insert("rbbsdao.reply", rbbsdto);
	}

	// 좋아요 or 나빠요!	
	@Override
	public void goodOrBad(Integer rnum, String goodOrBad) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("rnum", rnum);
		map.put("goodOrBad", goodOrBad);
		sqlSession.update("rbbsdao.goodOrBad", map);
	}

	// 댓글 총계	
	@Override
	public Integer replyTotalRec(Integer bnum) throws Exception {
		return sqlSession.selectOne("rbbsdao.replyTotalRec", bnum);
	}

	//이전 댓글 step 업데이트
	private void updateStep(Integer rgroup, Integer rstep) {
		Map<String,Object> map = new HashMap<>();
		map.put("rgroup", rgroup);
		map.put("rstep", rstep);
		sqlSession.update("rbbsdao.updateStep", map);
	}
}






