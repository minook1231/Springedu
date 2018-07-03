<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/public/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="/webjars/fontawesome/5.0.13/web-fonts-with-css/css/fontawesome-all.css">
<script src="/webedu/public/jquery/jquery-3.3.1.js"></script>
<script src="/webedu/public/bootstrap/dist/js/bootstrap.js"></script>
<title>로그인</title>
<script src="/webedu/public/jquery/jquery-3.3.1.js"></script>
<script>
	$(function(){
		$("#join_btn").on("click", function(e){
			e.preventDefault();
				$(location).attr("href", $(this).attr("data-url"));
		});
		
		$("#login_btn").on("click", function(e){
			e.preventDefault();
				$("form").submit();
		});
	});
</script>
</head>
<body>
<hr />
<h2>로그인</h2>
<hr />

<div style="font-size:1em; color:green;">
	<i class="fas fa-camera-retro"></i>
</div>

<form:form modelAttribute="user" action="/login/memLoginOK" method="post" />
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<form:input path="id"/><form:errors path='id'></form:errors>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<form:password path="passwd"/><form:errors path='passwd'></form:errors>
			</td>
		</tr>
		<tr>
			<td>
				<button id="login_btn">로그인</button>
			</td>
		</tr>
		<tr>
			<td>
				<button id="join_btn" data-url="member/memberJoin">회원가입</button>
			</td>
		</tr>
				
	</table>











</body>
</html>