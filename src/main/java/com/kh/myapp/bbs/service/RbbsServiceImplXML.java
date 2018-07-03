package com.kh.myapp.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.myapp.bbs.dao.RbbsDAO;
import com.kh.myapp.bbs.dto.RbbsDTO;
import com.kh.myapp.util.RecordCriteria;

@Service
public class RbbsServiceImplXML implements RbbsService {

	@Autowired
	@Qualifier("rbbsDAOImplXML")
	private RbbsDAO rbbsdao;
	
	@Override
	public void write(RbbsDTO rbbsdto) throws Exception {
		rbbsdao.write(rbbsdto);
	}

	@Override
	public List<RbbsDTO> list(Integer bnum) throws Exception {
		return rbbsdao.list(bnum);
	}

	@Override
	public List<RbbsDTO> list(Integer bnum, RecordCriteria recordCriteria)
			throws Exception {
		return rbbsdao.list(bnum, recordCriteria);
	}

	@Override
	public void modify(RbbsDTO rbbsdto) throws Exception {
		rbbsdao.modify(rbbsdto);
	}

	@Override
	public void delete(Integer rnum) throws Exception {
		rbbsdao.delete(rnum);
	}

	@Override
	public RbbsDTO replyView(Integer bnum) throws Exception {
		return rbbsdao.replyView(bnum);
	}

	@Override
	public void reply(RbbsDTO rbbsdto) throws Exception {
		rbbsdao.reply(rbbsdto);
	}

	@Override
	public void goodOrBad(Integer rnum, String goodOrBad) throws Exception {
		rbbsdao.goodOrBad(rnum, goodOrBad);
	}

	@Override
	public Integer replyTotalRec(Integer bnum) throws Exception {
		return rbbsdao.replyTotalRec(bnum);
	}

}
