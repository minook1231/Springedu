<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/4.1.0/css/bootstrap.css">
<script src="/webjars/jquery/3.3.1/dist/jquery.js"></script>
<script src="/webjars/bootstrap/4.1.0/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- 헤더 시작 -->
<div class="container">
	<div class="py-1 text-center filter-dark">
	  	<div class="row">
	  		<div class="col-md-12">
	    	<h1 class="display-1">Spring FrameWork</h1>
			</div>
	  	</div>
	</div>
<!-- 헤더 끝 -->

<!-- 메뉴바 시작 -->
	<!-- 네비게이션에서 하나 찾아서 뭐 쓰면 될것 같아요  -->
	<!-- 점보트론 밑에 밑에보면...네비게이션...  -->
	<div class="container-dorder">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="#">Home</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item active">
		        <a class="nav-link" href='${pageContext.request.contextPath }/Login/LginIn'>Home <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">Link</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link disabled" href="#">Disabled</a>
		      </li>
		    </ul>
		    <form class="form-inline my-2 my-lg-0">
		      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		    </form>
		  </div>
		</nav>
	</div>
<!-- 메뉴바 끝 -->
		<div class="row">
			<div class="col-4 border"> cloumn</div>
			<div class="col-4 border"> cloumn</div>
			<div class="col-4 border"> cloumn</div>
		</div>


</div>

<div class="container-fluid border">
nav
</div>
container
</body>
</html>