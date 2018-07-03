package com.kh.myapp.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.myapp.bbs.dao.BbsDAO;
import com.kh.myapp.bbs.dto.BbsDTO;
import com.kh.myapp.util.FindCriteria;
import com.kh.myapp.util.PageCriteria;
import com.kh.myapp.util.RecordCriteria;

@Service
public class BbsServiceImplXML implements BbsService {
	private static final Logger logger = LoggerFactory
			.getLogger(BbsServiceImplXML.class);

	@Autowired
	@Qualifier("bbsDAOImplXML")
	private BbsDAO bbsDAO;

	@Override
	public void write(BbsDTO bbsdto) throws Exception {
		bbsDAO.write(bbsdto);

	}
	
	@Override
	public void list(HttpServletRequest request) throws Exception {
		
		int reqPage = 0;
		
		// 요청페이지가 없으면 1페이지로 이동
		if (request.getParameter("reqPage") == null ||
				request.getParameter("reqPage") == "") {
			reqPage = 1;
		}else {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}
		
		// 검색유무조건에 따라 분기
		String searchType = request.getParameter("searchType");
		String keyword	= request.getParameter("keyword");
		

		List<BbsDTO> list = null;
		PageCriteria pc = null;
		RecordCriteria rc = null;
		
		if(keyword == null || keyword.trim().equals("")) {
			// 검색조건이 없는 경우
			rc = new RecordCriteria(reqPage);		
			list = this.list(rc);		
			int totalRec = this.totalRec();
			pc = new PageCriteria(rc,totalRec);		
			
		}else {
			// 검색조건이 있는 경우
			rc = new FindCriteria(reqPage,searchType,keyword);
			list = this.list((FindCriteria)rc);		
			int totalRec = this.searchTotalRec((FindCriteria)rc);
			pc = new PageCriteria(rc,totalRec);	
			
			logger.info(rc.toString());
			logger.info("토탈" + totalRec);
			logger.info("검색목록수" + list.size());
			
			request.setAttribute("findCriteria", (FindCriteria)rc);			
		}	
				
		logger.info("레코드" + rc);
		logger.info("페이지" + pc);
		
		request.setAttribute("list", list);
		request.setAttribute("pageCriteria", pc);
		
	}

	@Override
	public List<BbsDTO> list() throws Exception {
		return bbsDAO.list();
	}

	@Override
	public List<BbsDTO> list(RecordCriteria recordCriteria) throws Exception {
		return bbsDAO.list(recordCriteria);
	}

	@Override
	public BbsDTO view(Integer bnum) throws Exception {
		return bbsDAO.view(bnum);
	}

	@Override
	public void modify(BbsDTO bbsdto) throws Exception {
		bbsDAO.modify(bbsdto);

	}

	@Override
	public void delete(Integer bnum) throws Exception {
		bbsDAO.delete(bnum);

	}

	@Override
	public BbsDTO replyView(Integer bnum) throws Exception {
		return bbsDAO.replyView(bnum);
	}

	@Override
	public void reply(BbsDTO bbsdto) throws Exception {
		bbsDAO.reply(bbsdto);

	}

	@Override
	public int totalRec() throws Exception {
		return bbsDAO.totalRec();
	}

	@Override
	public List<BbsDTO> list(FindCriteria findCriteria) throws Exception {
		return bbsDAO.list(findCriteria);
	}

	@Override
	public int searchTotalRec(FindCriteria findCriteria) throws Exception {
		return bbsDAO.searchTotalRec(findCriteria);
	}

}
