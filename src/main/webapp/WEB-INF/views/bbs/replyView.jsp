<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/header.jsp" flush="true"/>   
<title>답글 작성</title>
<script>
$(function(){
		
});
</script>
</head>
<jsp:include page="/navbar.jsp" flush="true"/>
<body>
<div class="container">
<p class="h2" align="center"> 답글작성하기 </p>
<table class="table table-hover">
	<form:form action="reply" name="frm_1" id="myfrm1" method="post">
		<input type="hidden" name="bid" value=${user.username }>			
		<input type="hidden" name="bnum" value="${replyView.bnum }" />
		<input type="hidden" name="bgroup" value="${replyView.bgroup }" />
		<input type="hidden" name="bstep" value="${replyView.bstep }" />
		<input type="hidden" name="bindent" value="${replyView.bindent }" />
		<input type="hidden" name="reqPage" value="${recordCriteria.reqPage }" />
		<tr>
			<th scope="col" class="w-25 p-3" width="30%">조회수</th>
			<td scope="col" width="70%"><input type="text" name="bhit" readonly="true" class="form-control" id="" value="${replyView.bhit }" ></td>
		</tr>		
		<tr>
			<th scope="col" class="w-25 p-3">작성일</th>
			<td scope="col"><input type="text" name="cDate" readonly="true" class="form-control" id="" value="${replyView.bcdate }"></td>
		</tr>				
		<tr>
			<th scope="col" class="w-25 p-3">제목</th>
			<td scope="col"><input type="text" name="btitle"  class="form-control" id="myinput1" value="${replyView.btitle }"></td>
		</tr>
		<tr>
			<th scope="col">작성자</th>
			<td scope="col"> <input type="text" name="bname"  class="form-control" id="myinput2" value="${user.name }" readOnly='true'"></td>
		</tr>		
		<tr>
			<th scope="col">내용</th>
			<td scope="col"><textarea name="bcontent"  class="form-control" id="myinput3" rows="5">${replyView.bcontent }</textarea></td>
		</tr>	

		<tr >			
			<td colspan=2 align="right">
			<input class="btn btn-primary" type="submit" value="답글등록">
			<a href="list?reqPage=${recordCriteria.reqPage }" class="btn btn-primary" role="button" aria-pressed="true">목록으로</a>
			</td>
		</tr>	
	</form:form>
</table>
</div>
</body>
<jsp:include page="/footer.jsp" flush="true"/> 
</html>