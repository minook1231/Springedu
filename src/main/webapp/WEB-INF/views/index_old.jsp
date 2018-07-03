<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webedu/public/bootstrap/dist/css/bootstrap.css">
<script src="/webedu/public/jquery/jquery-3.3.1.js"></script>
<script src="/webedu/public/bootstrap/dist/js/bootstrap.js"></script>
<title>Insert title here</title>
<style>	
* {margin:auto;text-aling:center;}
html,body {margin:0;padding:0;height:100%}
#header {height:10%;background:rgb(148, 29, 196);}
#nav{height:10%;background-color:#ff0055;}
#content{height:70%;background-color:#ff3300;}
#footer{height:10%;background-color:#ff00ff;} 
</style>
</head>
<body>
<header id="header">&nbsp;</header>
<nav id="nav">&nbsp;</nav>
<section id="content">
${login.id}님!! 환영합니다.<br>
<a href="/login/loginIn">로그인</a><br>
<a href="/login/logOut">로그아웃</a><br>
<a href="/member/memberJoin">회원가입</a>
</section>
<footer id="footer">&nbsp;	</footer>


</body>
</html>