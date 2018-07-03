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
<title>Insert title here</title>
<style>
#footer {
   position:fixed;
   bottom:0px;
   width:85%;
}
</style>
<script>
</script>
</head>
<body>
	<div class="container">
		<!-- 헤더 시작 -->
		<div class="py-1 text-center filter-dark">
			<div class="container py-1">
				<div class="row">
					<div class="col-md-12">
						<h1 class="display-1">Spring Framwork</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- 메뉴바 시작 -->
		<div class="border border-dark">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand" href="#">Navbar</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active">
							<a class="nav-link" href="#">로그인</a>
						</li>
						<li class="nav-item active"><a class="nav-link" href="#">로그아웃</a></li>
						<li class="nav-item active"><a class="nav-link" href="#">회원가입</a></li>
						</li>
					</ul>			
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</form>
				</div>
			</nav>
		</div>
		<!-- 컨텐츠 시작 -->
		<div class="border-dark" >cont</div>
		<!-- footer 시작 -->
		<div class="border-dark" id="footer">
			<div class="bg-dark text-white" >
				<div class="row">
			        <div class="col-md-12 mt-3">
			          <p class="text-center text-white">© Copyright 2018 KH 정보교육원 - All rights reserved. </p>
			        </div>
			  </div>	
			</div>	
		</div>
	</div>
</body>
</html>