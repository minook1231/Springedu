<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/header.jsp" flush="true"/>    
<title>게시글 보기</title>
<script>
$(function(){
	$("#myLink_1").css({"display":""});
	$("#myLink_2").css({"display":"none"});

	// 편집모드변환
	$("#mybtn1").click(function(){
		var status = $("#myLink_2").css("display");
		if(status == "none") {
			$("#myLink_1").css({"display":"none"});
			$("#myLink_2").css({"display":""});
			$("#myinput1, #myinput3").removeAttr("readonly"); 
 			/* $("[id^='myinput']").removeAttr("readonly");  */
 			return false;
		}	
		
	});
	// 읽기모드변환
	$("#mybtn2").click(function(){
		var status = $("#myLink_1").css("display");
		if(status == "none") {
			$("#myLink_1").css({"display":""});
			$("#myLink_2").css({"display":"none"});
 			$("#myinput1, #myinput3").attr("readonly","readonly");  
 			/* $("[id^='myinput']").attr("readonly","readonly");  */
		}	
		
   	$("#myfrm1").attr("action","modify?bnum=${view.bnum}").submit(); 

	});	
});
</script>
</head>
<jsp:include page="/navbar.jsp" flush="true"/>
<body>
<div class="container">
<p class="h2" align="center"> 글내용보기 </p>
<table class="table table-hover">
	<form:form action="" name="frm_1" id="myfrm1" method="post">
		<input type="hidden" name="bid" value=${user.username }>				
		<input type="hidden" name="reqPage" value="${recordCriteria.reqPage }" />
		<tr>
			<th scope="col" class="w-25 p-3" width="30%">조회수</th>
			<td scope="col" width="70%"><input type="text" name="bhit" readonly="true" class="form-control" id="" value="${view.bhit }" ></td>
		</tr>		
		<tr>
			<th scope="col" class="w-25 p-3">작성일</th>
			<td scope="col"><input type="text" name="cDate" readonly="true" class="form-control" id="" value="${view.bcdate }"></td>
		</tr>				
		<tr>
			<th scope="col" class="w-25 p-3">제목</th>
			<td scope="col"><input type="text" name="btitle" readonly="true" class="form-control" id="myinput1" value="${view.btitle }"></td>
		</tr>
		<tr>
			<th scope="col">작성자</th>
			<td scope="col"> <input type="text" name="bname" readonly="true" class="form-control" id="myinput2" value="${view.bname }"></td>
		</tr>
		<tr>
			<th scope="col">내용</th>
			<td scope="col"><textarea name="bcontent" readonly="true" class="form-control" id="myinput3" rows="5">${view.bcontent }</textarea></td>
		</tr>	
		<tr id="myLink_1">			
			<td colspan=2 align="right">
			<a href="replyView?reqPage=${recordCriteria.reqPage }&bnum=${view.bnum}" class="btn btn-primary" role="button" aria-pressed="true">답글</a>

			<!-- 작성자만 수정 삭제가능 시작-->
			<c:if test="${user.username eq view.bid }">
				<button class="btn btn-primary" id="mybtn1" role="button" aria-pressed="true">수정하기</button>
				<a href="delete?reqPage=${recordCriteria.reqPage }&bnum=${view.bnum}" class="btn btn-primary" role="button" aria-pressed="true">삭제하기</a>
			</c:if>
			<!-- 작성자만 수정 삭제가능 끝-->
			
			<a href="list?reqPage=${recordCriteria.reqPage }" class="btn btn-primary" role="button" aria-pressed="true">목록으로</a>
			</td>
		</tr>	
		<tr id="myLink_2">			
			<td colspan=2 align="right">
			<button class="btn btn-primary" id="mybtn2" role="button" aria-pressed="true">수정완료</button>
			<a href="list?reqPage=${recordCriteria.reqPage }" class="btn btn-primary" role="button" aria-pressed="true">목록으로</a>
			</td>
		</tr>	
	</form:form>
</table>
<jsp:include page="reply.jsp" />
</div>
</body>
<jsp:include page="/footer.jsp" flush="true"/>
</html>