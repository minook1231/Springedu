package com.kh.myapp.util;

public class PageCriteria {
	private int pageNumPerPage = 10; //	한페이지에 보여줄 페이지수 
	private int startPage;			//	한페이지에  시작페이지
	private int endPage;				//	한페이지에  종료페이지
		
	private int totalRec;				// 전체 레코드수
	private int finalEndPage;		//	최종페이지
		
	private boolean prev;				//	이전페이지
	private boolean next;				//	다음페이지
	
	private RecordCriteria recordCriteria;		// 한 페이지에 보여줄 레코드수 ,요청페이지 참조 
	
	private PageCriteria(RecordCriteria recordCriteria) {
		this.recordCriteria = recordCriteria;
	}
	
	public PageCriteria(RecordCriteria recordCriteria, int totalRec) {
		this(recordCriteria);
		this.totalRec = totalRec;
		init();
	}

	public PageCriteria(RecordCriteria recordCriteria, int totalRec, int pageNumPerPage) {
		this(recordCriteria);
		this.totalRec = totalRec;
		this.pageNumPerPage = pageNumPerPage;
		init();
	}

	
	private void init() {
		// 1) endPage 계산
		this.endPage = (int)(Math.ceil(this.recordCriteria.getReqPage() /
				(double)this.pageNumPerPage)) * pageNumPerPage;
		
		// 2) startPage 계산
		this.startPage = (this.endPage-this.pageNumPerPage) + 1;
		
		// 3) finalEndPage계산
		this.finalEndPage = (int)(Math.ceil(this.totalRec/(double)this.recordCriteria.getNumPerPage()));
		if(endPage > finalEndPage) {
			endPage = finalEndPage;
		}
		
		// 4) prev 계산
		this.prev = this.startPage == 1 ? false : true;
		
		// 5) next 계산
		this.next = 
			( this.endPage * this.recordCriteria.getNumPerPage() >= this.totalRec ) ? false : true;
	}

	// 미검색용 파라미터 설정
	public String makeURL() {
		
		StringBuffer str = new StringBuffer();
		
		if(recordCriteria.getReqPage() != 0) {
			str.append("reqPage="+recordCriteria.getReqPage());
		}

		return str.toString();
	}
	
	// 검색용 파라미터 설정
	public String makeSearchURL(int reqPage) {
		
		StringBuffer str = new StringBuffer();
		
		str.append("reqPage="+reqPage);		
//		if(recordCriteria.getReqPage() != 0) {
//			str.append("reqPage="+recordCriteria.getReqPage());
//		}
		
		if (recordCriteria instanceof FindCriteria) {
			
			if( ((FindCriteria)recordCriteria).getSearchType() != null ||
				 !((FindCriteria)recordCriteria).getSearchType().trim().equals("")	) {
				
				str.append("&searchType="+((FindCriteria)recordCriteria).getSearchType());
			}		
			if( ((FindCriteria)recordCriteria).getKeyword() != null ||
				 !((FindCriteria)recordCriteria).getKeyword().trim().equals("") ) {
				
				str.append("&keyword="+((FindCriteria)recordCriteria).getKeyword());
			}			
		}
		return str.toString();
	}

	public int getPageNumPerPage() {
		return pageNumPerPage;
	}

	public void setPageNumPerPage(int pageNumPerPage) {
		this.pageNumPerPage = pageNumPerPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalRec() {
		return totalRec;
	}

	public void setTotalRec(int totalRec) {
		this.totalRec = totalRec;
	}

	public int getFinalEndPage() {
		return finalEndPage;
	}

	public void setFinalEndPage(int finalEndPage) {
		this.finalEndPage = finalEndPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public RecordCriteria getRecordCriteria() {
		return recordCriteria;
	}

	public void setRecordCriteria(RecordCriteria recordCriteria) {
		this.recordCriteria = recordCriteria;
	}

	@Override
	public String toString() {
		return "PageCriteria [pageNumPerPage=" + pageNumPerPage + ", startPage="
				+ startPage + ", endPage=" + endPage + ", totalRec=" + totalRec
				+ ", finalEndPage=" + finalEndPage + ", prev=" + prev + ", next=" + next
				+ ", recordCriteria=" + recordCriteria + "]";
	}
	
}













