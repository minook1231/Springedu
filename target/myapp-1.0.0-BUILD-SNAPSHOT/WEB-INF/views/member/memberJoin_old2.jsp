<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/4.1.0/css/bootstrap.css">
<script src="/webjars/jquery/3.3.1/dist/jquery.js"></script>
<script src="/webjars/bootstrap/4.1.0/js/bootstrap.js"></script>
<script>
$(function(){
	
	$("#joinBtn").on("click",function(e){
		e.preventDefault();
		$("form").submit();
		
	});
	$("#joinClearBtn").on("click",function(e){
		e.preventDefault();		
		  $("form").each(function(){
			    this.reset();
			  });
	});	
	
	$("#joinCancelBtn").on("click",function(e){
		e.preventDefault();		
			location.href="/";
	});		
});
</script>
<title>Insert title here</title>
</head>
<body>
<form action="/member/memberJoinOK" method="post">
<table>
	<tr>
		<th>아이디</th><td><input type="text" /></td>
	</tr>
	<tr>
		<th>비밀번호</th><td><input type="text" /></td>
	</tr>
	<tr>
		<th>비밀번호확인</th><td><input type="text" /></td>
	</tr>
	<tr>
		<th>이름</th><td><input type="text" /></td>
	</tr>
	<tr>
		<th>생일</th><td><input type="text" /></td>
	</tr>
	<tr>
		<th>전화번호</th><td><input type="text" /></td>
	</tr>
	<tr align = right>
		<td colspan=2>
			<button id="joinBtn">가입</button>
			<button id="joinClearBtn">초기화</button>
			<button id="joinCancelBtn">가입취소</button>
	</tr>	
</table>

</form>
</body>
</html>