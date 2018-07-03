<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/header.jsp"/>
<%-- <jsp:include page="/header.jsp"/> --%>
<title>Insert title here</title>
<script>
	$(function() {
	
		//회원가입 페이지로 이동
		$("#joinBtn").on("click",function(e){
			e.preventDefault();		
			$(location).attr("href",$(this).attr("data-url"));			
		});	 
		
		//로그인
	 	$("#loginBtn").on("click",function(e){
			e.preventDefault();
			$("form").submit();
			
		});
	 	
			
		var
		w       = 500,
		h       = 400,
		l       = (screen.availWidth - w) / 2,
		t       = (screen.availHeight - h) / 2;
		$(".popup").on('click',function(event){
			window.open(this.href,"window","width= "+w+",height="+h+",left="+l+",top="+t+
					",scrollbars=no, location=no, toolbar=no, menubar=no, status=no");
			 return false;
		});
		
/* 		$("form").submit(function(){
			if($("#id").val() == "") {
				alert("아이디를 입력해주세요!");
				$("#id").focus();
				return false;
			}else if($("#passwd").val() == ""){
				alert("비밀번호를 입력해주세요!");
				$("#passwd").focus();	
				return false;
			}
		}); */
	});	
</script>
<style>
	#errMsg{ color:red; }


</style>
</head>
<%-- <jsp:include page="/navbar.jsp"/> --%>
<body>
<c:url value="login" var="loginUrl"/>
<div class="container mx-auto">
	<div class="row" style="margin-top: 20px">
		<div
			class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form  action="${pageContext.request.contextPath}/${loginUrl}"	method="post">
					<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
				<fieldset>
					<h2 class="text-center">로그인</h2>
					<hr class="colorgraph">
					<c:if test="${param.fail !=null }">	<div class="text-center" id="errMsg">로그인 실패!!</div>	</c:if>
					<hr class="colorgraph">					
					<div class="form-group">
						<input type="text" name="username" class="form-control input-lg"
							placeholder="이메일주소를 입력하세요!" />

					</div>
					<div class="form-group">
						<input type="password" name="password" class="form-control input-lg"
							placeholder="비밀번호를 입력하세요!" />

					</div>
					<span class="button-checkbox">
						<button type="button" class="btn btn-sm btn-info" data-color="info">로그인
							상태유지</button> <input type="checkbox" name="remember_me" id="remember_me"
						checked="checked" class="hidden"> <a href="/member/findId" class="btn btn-link pull-right popup">아이디</a>/
 						<a href="/member/findPasswd" class="btn btn-link pull-right popup">비밀번호 찾기</a>						
					</span>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
							<button type="button" class="btn btn-sm btn-success btn-block" id="loginBtn">로그인</button>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6">
							<button type="button" class="btn btn-sm btn-primary btn-block" id="joinBtn"
								data-url="/member/memberJoin">회원가입</button>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>	
<%-- <jsp:include page="/footer.jsp"/> --%>