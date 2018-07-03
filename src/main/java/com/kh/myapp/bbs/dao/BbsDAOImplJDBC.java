package com.kh.myapp.bbs.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.myapp.bbs.dto.BbsDTO;
import com.kh.myapp.util.FindCriteria;
import com.kh.myapp.util.RecordCriteria;

@Repository
public class BbsDAOImplJDBC implements BbsDAO {

	@Override
	public void write(BbsDTO bbsdto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BbsDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BbsDTO> list(RecordCriteria recordCriteria) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BbsDTO view(Integer bnum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(BbsDTO bbsdto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer bnum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BbsDTO replyView(Integer bnum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void reply(BbsDTO bbsdto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int totalRec() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BbsDTO> list(FindCriteria findCriteria) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int searchTotalRec(FindCriteria findCriteria) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
