<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/4.1.0/css/bootstrap.css">
<script src="/webjars/jquery/3.3.1/dist/jquery.js"></script>
<script src="/webjars/bootstrap/4.1.0/js/bootstrap.js"></script>
<title>회원 아이디 찾기</title>
<script>
$(function(){
	$("#findId").on("click",function(e){
		e.preventDefault();
		$("form").submit();
		
	});
});

</script>
</head>
<body>
<form:form modelAttribute="idpwdchk" action="/member/findIdOK" method="post">
	이름<form:input path="name" /><form:errors path="name"/><br>
	전화번호<form:input path="phone" /><form:errors path="phone"/><br>
	아이디<input readyOnly="true">${idpwdchk.id }</input>
	<button type="button" id="findId">아이디 찾기</button>
</form:form>
</body>
</html>

                