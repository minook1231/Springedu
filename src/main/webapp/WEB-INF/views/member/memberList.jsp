<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="/header.jsp" flush="true"/>
<title>회원목록</title>
<script>
$(function(){
	$("#modi, #del, #list").on("click",function(){
		$(location).attr('href',$(this).attr('data-url'));
	});
});
</script>
</head>
<jsp:include page="/navbar.jsp" flush="true"/>
<body>
<div class="container">
<div class="row">&nbsp;</div>
<table class="table">
<tr>
	<th>#</th>
	<th>아이디</th>
	<th>이름</th>
	<th>생년월일</th>
	<th>전화번호</th>
	<th>성별</th>
	<th>수정</th>
	<th>삭제</th>
</tr>
<c:forEach items="${memberVOS }" var="memberVO">
<tr>
	<td>#</td>
	<td>${memberVO.id }</td>
	<td>${memberVO.name }</td>
	<td>${memberVO.birth }</td>
	<td>${memberVO.phone }</td>
	<td>
		<c:if test="${memberVO.gender eq 'M'}" > 남자 </c:if>
		<c:if test="${memberVO.gender eq 'W'}" > 여자 </c:if>
	</td>
	<td><button type="button" class="btn btn-outline-primary btn-sm" id="modi" data-url="/member/memberModify/${memberVO.id }">수정</button></td>
	<td><button type="button" class="btn btn-outline-primary btn-sm" id="del" data-url="/member/memberDelete/${memberVO.id }">삭제</button></td>
</tr>	
</c:forEach>
<tr>
	<td colspan="8" align="center">
		<button type="button" class="btn btn-outline-primary btn-sm" id="list" data-url="/member/memberJoin">회원가입</button>
	</td>
</tr>
</table>
</div>
</body>
</html>
<jsp:include page="/footer.jsp" flush="true"/>



