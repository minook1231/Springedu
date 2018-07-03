<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</div>
<!-- 헤더 끝 -->
<!-- 메뉴바 시작 -->
<div class="container">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href='${pageContext.request.contextPath}/'>Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href='${pageContext.request.contextPath}/login/loginIn'>로그인 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href='${pageContext.request.contextPath}/login/logOut'>로그아웃</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href='${pageContext.request.contextPath}/member/memberJoin'>회원가입</a>
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