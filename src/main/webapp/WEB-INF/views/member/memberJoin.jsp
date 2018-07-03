<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<jsp:include page="/header.jsp" flush="true"/>
<title>회원가입</title>
<script>
$(function(){
	
	$("input[name=password]").on("keyup",function(){
 		if($("input[name=password]").val() != $("input[name=passwd]").val()){
 			$(".passErr").text('비밀번호가 틀립니다.');
			$(this).focus();
		}else{
			$(".passErr").text('');
		}
	});
	
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
			location.href="/member/memberList";
	});	 
	
});
</script>
<style>
	.errmsg{color:red;}
	.passErr{color:red;}	
</style>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/navbar.jsp" flush="true"/>

<div class="container">
<div class="row">&nbsp;</div>
<div class="row">
<form:form modelAttribute="memberVO" action="/member/memberJoinOK" method="post">

<div class="table-responsive-sm">
<div class="form-group mb-3">
<table class="table-sm table-border">
	<tr>
		<th class="table-primary">아이디</th>
		<td>
			<form:input path="id" />
		</td>
		<td><form:errors path="id" cssClass="errmsg" /></td>
	</tr>
	<tr>
		<th class="table-primary">비밀번호</th>
		<td>
			<form:password path="passwd" />
		</td>

		<td><form:errors path="passwd" cssClass="errmsg"/></td>

	<tr>
		<th class="table-primary">비밀번호확인</th>
		<td>
			<input type="password" name="password" />
		</td>
		<td><span class="passErr"></span></td>
	</tr>		
	<tr>
		<th class="table-primary">이름</th>
		<td>
			<form:input path="name" />		
		</td>
		<td>
			<form:errors path="name" cssClass="errmsg"/>
		</td>
	</tr>		
	<tr>
		<th class="table-primary">생일</th>
		<td>
			<form:input path="birth" />				
		</td>
		<td>
			<form:errors path="birth" cssClass="errmsg"/>
		</td>
	</tr>		
	<tr>
		<th class="table-primary">전화번호</th>
		<td>
			<form:input path="phone" />
		</td>
		<td>
			<form:errors path="phone" cssClass="errmsg"/>
		</td>
	</tr>		
	<tr>
		<th class="table-primary">성별</th>
		<td>
			남<form:radiobutton path="gender" value="M"/>
			여<form:radiobutton path="gender" value="W"/>
		</td>
		<td>
			<form:errors path="gender" />			
		</td>
	</tr>		
	<tr align = left>
		<th></th>
		<td>
			<button id="joinBtn" class="btn btn-outline-primary btn-sm">가입</button>
			<button id="joinClearBtn" class="btn btn-outline-primary btn-sm">초기화</button>
			<button id="joinCancelBtn" class="btn btn-outline-primary btn-sm">가입취소</button>
		</td>
	</tr>
</table>
</form:form>
</div>
<div class="col-md-2">&nbsp;</div>
</div>
</div>
</body>
<jsp:include page="/footer.jsp" flush="true"/> 