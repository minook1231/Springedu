package com.kh.myapp.bbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.bbs.dto.BbsDTO;
import com.kh.myapp.util.FindCriteria;
import com.kh.myapp.util.RecordCriteria;

@Repository
public class BbsDAOImplXML implements BbsDAO {

	private static final Logger logger = Logger.getLogger(BbsDAOImplXML.class);
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void write(BbsDTO bbsdto) throws Exception {
		sqlSession.insert("bbsdao.insert", bbsdto);
	}

	@Override
	public List<BbsDTO> list() throws Exception {
		return sqlSession.selectList("bbsdao.list");
	}

	@Override
	public List<BbsDTO> list(RecordCriteria recordCriteria) throws Exception {
		logger.info(recordCriteria);
		return sqlSession.selectList("bbsdao.listPageCri", recordCriteria);
	}

	@Override
	public BbsDTO view(Integer bnum) throws Exception {
		// 조회수증가
		updateHit(bnum);
		return sqlSession.selectOne("bbsdao.view", bnum);
	}
	
	// 조회수 증가
	private void updateHit(Integer bnum) throws Exception {
		sqlSession.update("bbsdao.hit", bnum);
	}
	
	@Override
	public void modify(BbsDTO bbsdto) throws Exception {
		sqlSession.update("bbsdao.update", bbsdto);
	}

	@Override
	public void delete(Integer bnum) throws Exception {
		sqlSession.delete("bbsdao.delete", bnum);

	}

	@Override
	public BbsDTO replyView(Integer bnum) throws Exception {
		return sqlSession.selectOne("bbsdao.replyView", bnum);
	}

	@Override
	public void reply(BbsDTO bbsdto) throws Exception {
		
		//이전 댓글 step 업데이트
		updateStep(bbsdto);
		
		bbsdto.setBhit(0);
		bbsdto.setBstep(bbsdto.getBstep()+1);
		bbsdto.setBindent(bbsdto.getBindent()+1);		
		
		sqlSession.insert("bbsdao.reply", bbsdto);

	}

	@Override
	public int totalRec() throws Exception {
		return sqlSession.selectOne("bbsdao.totalRec");
	}

	@Override
	public List<BbsDTO> list(FindCriteria findCriteria) throws Exception {
		return sqlSession.selectList("bbsdao.listFindCri", findCriteria);
	}

	@Override
	public int searchTotalRec(FindCriteria findCriteria) throws Exception {
		return sqlSession.selectOne("bbsdao.searchTotalRec", findCriteria);
	}

	//이전 댓글 step 업데이트
	private void updateStep(BbsDTO bbsdto) {
	
		sqlSession.update("bbsdao.updateStep",bbsdto);
	}
}









