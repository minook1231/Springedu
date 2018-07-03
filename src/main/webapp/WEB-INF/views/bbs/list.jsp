<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<jsp:include page="/header.jsp" flush="true"/>    
<title>게시글 목록</title>
<script>
$(function(){
   var str;
	$('#search').click(function(){
		self.location = "list?reqPage=1"
							+"&searchType='" 
							+$("select[name=searchType]").val()
							+"'"
							+"&keyword='"
							+$("input[name=keyword]").val()
							+"'";		
		console.log(self.location.toString());
	});
	
});
</script>
</head>
<jsp:include page="/navbar.jsp" flush="true"/>
<body>
<div class="container">
<p class="h2" align="center"> 글 목록보기 </p>
<table class="table table-hover">
  <thead class="thead-light">
    <tr>
      <th scope="col" width="10%">번호</th>
      <th scope="col" width="50%">제목</th>
      <th scope="col" width="15%">작성자</th>
      <th scope="col" width="15%">작성일</th>
      <th scope="col" width="10%">조회수</th>
    </tr>
  </thead>
  <tbody>
	 <c:forEach items="${list }" var="dto">
    <tr>
      <th scope="row">${dto.bnum }</th>
		<td>
			<c:forEach begin="1" end="${dto.bindent }">&nbsp;&nbsp;</c:forEach>
			<c:if test="${dto.bindent > 0}"><img alt="" src="/images/icon_reply.gif"></c:if>				
			<a class="text-dark" href="/bbs/view?${pageCriteria.makeSearchURL(pageCriteria.recordCriteria.reqPage) }&bnum=${dto.bnum }">${dto.btitle }</a>
		</td>
		<td>${dto.bname }</td>
		<td>${dto.bcdate }</td>
		<td>${dto.bhit }</td>   	
    </tr>
	 </c:forEach>	
  </tbody>
</table>
<div class="row justify-content-end">
<a href="write?${pageCriteria.makeSearchURL(pageCriteria.recordCriteria.reqPage) }" class="btn btn-primary" role="button" aria-pressed="true">글쓰기</a>
</div>
<div class="container">
  <div class="row justify-content-center">
		<nav aria-label="Page navigation example">
		  <ul class="pagination" >
		  	 <c:if test="${pageCriteria.prev }"> <!-- pageCreateria.isPrev() -->
			    <li class="page-item">
			    	<a class="page-link" href="list?${pageCriteria.makeSearchURL(1)}">◀</a>
			    </li>		  	 
			    <li class="page-item">
			    	<a class="page-link" href="list?${pageCriteria.makeSearchURL(pageCriteria.startPage-1)}">◁</a>
			    </li>
		    </c:if>
		    <c:forEach begin="${pageCriteria.startPage }" end="${pageCriteria.endPage }" var="pageNum">
		    	<c:if test="${pageCriteria.recordCriteria.reqPage == pageNum }">
			    <li class="page-item active">		
			      <a class="page-link" href="list?${pageCriteria.makeSearchURL(pageNum) }">${pageNum}</a>
			    </li>
	    		 </c:if>   
	    		 <c:if test="${pageCriteria.recordCriteria.reqPage != pageNum }">
			    <li class="page-item">
			    	<a class="page-link" href="list?${pageCriteria.makeSearchURL(pageNum) }">${pageNum}</a>
			    </li>
			    </c:if>
		    </c:forEach>
		    <c:if test="${pageCriteria.next }">
			    <li class="page-item">
			    	<a class="page-link" href="list?${pageCriteria.makeSearchURL(pageCriteria.endPage+1)}">▷</a>
			    </li>
			    <li class="page-item">
			    	<a class="page-link" href="list?${pageCriteria.makeSearchURL(pageCriteria.finalEndPage)}">▶</a>
			    </li>		    
		    </c:if>		    
		  </ul>
		</nav>      
  </div>
</div>

<div class="container">
  <div class="row justify-content-center">
	<form class="form-inline">
	  <div class="form-group mx-sm-3 mb-2">	
		  <select class="custom-select" name="searchType">
		    <option value="TC" 
		    	<c:out value="${searchType == 'TC' ? 'selected' : '' }"/>>
		    	제목 + 내용</option>
		    <option value="T"
		  		<c:out value="${earchType == 'T' ? 'selected' : '' }"/>>		    
		    	제목</option>
		    <option value="C"
			  	<c:out value="${searchType == 'C' ? 'selected' : '' }"/>>	
		    	내용</option>
		    <option value="W"
		  		<c:out value="${searchType == 'W' ? 'selected' : '' }"/>>
		    	작성자</option>
		  </select>&nbsp;    
	    <input type="text" class="form-control" placeholder="검색어를 입력하세요" 
	    	name="keyword" value="${keyword }">
	    <button type="submit" class="btn btn-primary mb-auto" id="search"> 검색 </button>		  
	  </div>	  
	</form> 
  </div>
</div> 
</div>
</body>
<jsp:include page="/footer.jsp" flush="true"/> 