<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<jsp:include page="/header.jsp" flush="true"/>    
<title>게시글쓰기</title>
</head>
<jsp:include page="/navbar.jsp" flush="true"/>
<body>
<p class="h2" align="center"> 글쓰기 </p>
<div class="container">
<table class="table table-hover">
	<form:form action="/bbs/write" method="post">
		<input type="hidden" name="bid" value=${user.username }>		
<%-- 	<sec:csrfInput  /> --%>
		<tr>
			<th scope="col" >제목</th>
			<td scope="col" ><input type="text" name="btitle" class="form-control" id="" placeholder="제목을 입력하세요"></td>
		</tr>
<!-- 		<tr>
			<th scope="col">작성자</th>
			<td scope="col"> <input type="text" name="bname" class="form-control" id="" placeholder="이름을 입력하세요"></td>
		</tr> -->
		<tr>
			<th scope="col">작성자</th>
			<td scope="col"><input type="text" name="bname" class="form-control" id="" placeholder="이름을 입력하세요" value="${user.name }" readOnly='true'"></td>
		</tr>		
		<tr>
			<th scope="col">내용</th>
			<td scope="col"><textarea name="bcontent" class="form-control" id="" rows="10"></textarea></td>
		</tr>				
			<td colspan=2 align="right"><input class="btn btn-primary" type="submit" value="등록">
			<a href="list?reqPage=${param.reqPage }" class="btn btn-primary" role="button" aria-pressed="true">목록으로</a>
			</td>
		</tr>
	</form:form>
</table>
</div>
</body>
<jsp:include page="/footer.jsp" flush="true"/> 
