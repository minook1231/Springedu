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
<title>회원 비밀번호 찾기</title>
</head>
<body>
<form:form action="/member/findPasswd" method="post">
   아이디<form:input path="id" />
	이름<form:input path="name" />
	전화번호<form:input path="phone" />
	비밀번호<input readyOnly="true">${passwd }</input>	
	<button type="submit">아이디 찾기</button>
</form:form>
</body>
</html>