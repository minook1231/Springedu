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
<form:form modelAttribute="memberVO" action="/member/memberJoinOK" method="post">
<table>
	<tr>
		<th>아이디</th>
		<td>
			<form:input path="id" readOnly="true" />
		</td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<td><form:errors path="id" cssClass="errmsg" /></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<form:password path="passwd" />
		</td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<td><form:errors path="passwd" cssClass="errmsg"/></td>
	</tr>	
	<tr>
		<th>비밀번호확인</th>
		<td>
			<input type="password" name="password" />
		</td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<td><span class="passErr"></span></td>
	</tr>		
	<tr>
		<th>이름</th>
		<td>
			<form:input path="name" />		
		</td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<td>
			<form:errors path="name" cssClass="errmsg"/>
		</td>
	</tr>		
	<tr>
		<th>생일</th>
		<td>
			<form:input path="birth" />				
		</td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<td>
			<form:errors path="birth" cssClass="errmsg"/>
		</td>
	</tr>		
	<tr>
		<th>전화번호</th>
		<td>
			<form:input path="phone" />
		</td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<td>
			<form:errors path="phone" cssClass="errmsg"/>
		</td>
	</tr>		
	<tr>
		<th>성별</th>
		<td>
			남<form:radiobutton path="gender" value="M"/>
			여<form:radiobutton path="gender" value="W"/>
		</td>
	</tr>	
	<tr>
		<th>&nbsp;</th>
		<td>
			<form:errors path="gender" />			
		</td>
	</tr>		
	<tr align = left>
		<th></th>
		<td>
			<button id="joinBtn">가입</button>
			<button id="joinClearBtn">초기화</button>
			<button id="joinCancelBtn">가입취소</button>
		</td>
	</tr>	
</table>

</form:form>
</body>
</html>