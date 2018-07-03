<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:include page="/header.jsp" flush="true" /> --%>
<style>
.list-group-item {
	overflow: hidden;
	position: relative;
	display: block;
	padding: 5px 5px;
	margin-bottom: -1px;
	background-color: #fff;
	border: 0px solid #ddd;
}

#reReplyDiv {
	width: 430px;
	height: 230px;
	background-color: #ffffff;
	border-style: solid;
	border-color: blue;
	border-width: 1px;
	position: fixed;
	top: 50%;
	left: 50%;
	padding: 20px;
	z-index: 30;
}

#modifyDiv {
	width: 430px;
	height: 200px;
	background-color: #ffffff;
	border-style: solid;
	border-color: blue;
	border-width: 1px;
	position: fixed;
	top: 50%;
	left: 50%;
	padding: 20px;
	z-index: 30;
}

#pageNumList li {
	list-style: none;
	display: inline; //
	border: 1px solid gray;
	padding: 5px; //
	border-radius: 5px; //
	margin-right: -5px;
}
</style>
<script>

//var bnum = 1921;
var bnum = ${view.bnum};
var reReqPage = 1;

// 세션정보
var login_id   = "${user.username}";
var login_name = "${user.name}";
	
$(function(){

	// ajax실행시 마다 http header에 csrf토큰 추가-------------------------
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
	//--------------------------------------------------------------
	
	// 리댓글,댓글수정 양식 숨기기
	$("#modifyDiv").hide();
	$("#reReplyDiv").hide();
	
	// 전체댓글목록 가져오기
	//replyListAll();
	
	replyList(reReqPage);
	
	// 댓글작성 클릭시 수행로직
	$("#replyBtn").on("click",function(){
		var writer = $("#writer").val();
		var replyContent = $("#replyContent").val();
		
		$.ajax({
			type:"POST",
			url:"/rbbs/write",
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType:"text",
			data:JSON.stringify({
				bnum : bnum,
				rid  : login_id,
				rname: login_name,
				rcontent: replyContent				
			}),
			success:function(result){
				replyList(reReqPage);
			},
			error:function(e){
				console.log("실패"+e)
			}
		});
	});	
		
// 리댓글작성 
 	$("#reReplyBtn").click(function(){
		
		var rnum = $(".title-dialog").html();		
		var writer = $("#writer").val();	
		var rcontent = $("#reReplyContent").val();
 		$.ajax({
			type:"POST",
			url:"/rbbs/reReply",
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},			
			dataType:"text",
			data:JSON.stringify({
				rnum : rnum, 
				rid  : login_id,
				rname: login_name,
				rcontent: rcontent		
			}),
			success:function(result){
				replyList(reReqPage);
			},
			error:function(e){
				console.log("실패"+e)
			}
		}); 
	});	 
			
	// 리댓 클릭 이벤트
	$("#reply").on("click",".reList button#b0" ,function(){

		var li = $(this).parent();
		var rnum = li.attr("data-rnum");
		var reContent = li.find('#rcontent').html();

		//reContent = $("#rcontent").val();
		//alert("댓글번호 : "+rnum+"  수정할 내용 : "+reContent);		
 		$(".title-dialog").html(rnum);
		$("#orgContent").val(reContent);
		$("#reReplyDiv").show("slow"); 
	});
	
				
	// 수정 클릭 이벤트
	$("#reply").on("click",".reList button#b1" ,function(){

		var li = $(this).parent();
		var rnum = li.attr("data-rnum");
		var reContent = li.find('#rcontent').html();
		
		//alert("댓글번호 : "+rnum+"  수정할 내용 : "+reContent);		
 		$(".title-dialog").html(rnum);
		$("#reContent").val(reContent);
		$("#modifyDiv").show("slow"); 
	});
	
	// 삭제 클릭 이벤트
	$("#reply").on("click",".reList button#b2" ,function(){
		var li = $(this).parent();
		var rnum = li.attr("data-rnum");
		del(rnum);
	});	
	
	// 좋아요 클릭 이벤트
	$("#reply").on("click",".reList button#b3" ,function(){
		var li = $(this).parent();
		var rnum = li.attr("data-rnum");
		good(rnum);
	});	
	
	// 나빠요 클릭 이벤트
	$("#reply").on("click",".reList button#b4" ,function(){
		var li = $(this).parent();
		var rnum = li.attr("data-rnum");
		bad(rnum);
	});		
		
	// 댓글 수정
	$("#reModifyBtn").on("click",function(){
		var rnum = $(".title-dialog").html();
		var rcontent = $("#reContent").val();
		$.ajax({
			type:"PUT",
			url:"/rbbs/modify",
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},			
			dataType:"text",
			data:JSON.stringify({
				rnum : rnum,
				rcontent: rcontent				
			}),
			success:function(result){
				replyList(reReqPage);
			},
			error:function(e){
				console.log("실패"+e)
			}			
		});		
	});
	
/* 	// 댓글 삭제
	$("#reDelBtn").on("click",function(){
		var rnum = $(".title-dialog").html();
		
		$.ajax({
			type:"DELETE",
			url:"/rbbs/delete/"+rnum,
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},			
			dataType:"text",

			success:function(result){
				replyList(reReqPage);
			},
			error:function(e){
				console.log("실패"+e)
			}			
		});
	});
	
	// 좋아요
	$("#goodBtn").on("click",function(){
		var rnum = $(".title-dialog").html();
		$.ajax({
			type:"PUT",
			url:"/rbbs/good/"+rnum,
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},			
			dataType:"text",
			data:JSON.stringify({
				rnum : rnum,
				goodOrBad : "good"			
			}),
			success:function(result){
				replyList(reReqPage);
			},
			error:function(e){
				console.log("실패"+e)
			}			
		});
	});
	
	// 나빠요
	$("#badBtn").on("click",function(){
		var rnum = $(".title-dialog").html();
		
		$.ajax({
			type:"PUT",
			url:"/rbbs/bad/"+rnum,
			dataType:"text",
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},			
			data:JSON.stringify({		
				goodOrBad : "bad"		
			}),
			success:function(result){
				replyList(reReqPage);
			},
			error:function(e){
				console.log("실패"+e)
			}			
		});
	});	 */
	
	//페이지번호 클릭시 이벤트 처리
	$("#pageNumList").on("click","a", function(evt){
		
		evt.preventDefault();
		reqPage = $(this).attr("href");
		replyList(reqPage);
		
	});
				
 	// 리댓글창 닫기
	$("#reReplyDiv_closeBtn").click(function(){
		$("#reReplyDiv").hide();
	}); 
						
	// 댓글창 수정 닫기
	$("#modifyDiv_closeBtn").click(function(){
		$("#modifyDiv").hide();
	});
	
});


	// 댓글 삭제
	function del(rnum){
		//var rnum = $(".title-dialog").html();
		
		$.ajax({
			type:"DELETE",
			url:"/rbbs/delete/"+rnum,
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},			
			dataType:"text",
	
			success:function(result){
				replyList(reReqPage);
			},
			error:function(e){
				console.log("실패"+e)
			}			
		});
	}
	
	// 좋아요
	function good(rnum){
		//var rnum = $(".title-dialog").html();
		$.ajax({
			type:"PUT",
			url:"/rbbs/good/"+rnum,
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},			
			dataType:"text",
			data:JSON.stringify({
				rnum : rnum,
				goodOrBad : "good"			
			}),
			success:function(result){
				replyList(reReqPage);
			},
			error:function(e){
				console.log("실패"+e)
			}			
		});
	}
	
	// 나빠요
	function bad(rnum){
		$.ajax({
			type:"PUT",
			url:"/rbbs/bad/"+rnum,
			dataType:"text",
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},			
			data:JSON.stringify({		
				goodOrBad : "bad"		
			}),
			success:function(result){
				replyList(reReqPage);
			},
			error:function(e){
				console.log("실패"+e)
			}			
		});
	}
		
	//요청페이지 댓글목록 가져오기
	function replyList(reReqPage){
		
		var str = "";
		
		$.ajax({
			type:"GET",
			url:"/rbbs/map/"+bnum+"/"+reReqPage,
			dataType: "JSON",
			success: function(data){
				$.each(data.item, function(idx,rec){
					str += "<span>";
	 				str	+= "<li data-rnum='"+rec.rnum+"' class='reList list-group-item'>";
	 				for(var i=0; i<rec.rindent; i++) {
						str += "&nbsp;&nbsp;";
					}	 			
					if(rec.rindent>0){
						str +=	"<img alt='' src='/images/icon_reply.gif'>"
					}	
					str	+=	"<span class='text-primary'>" + rec.rcdate + "</span>&nbsp;"
						 	+		"<span>(" + rec.rname 		+ ")</span>"								 
 							+		"<span>&nbsp;&nbsp;</span>"
						 	+ 	"<span id='rcontent'>" + rec.rcontent 	+ "</span>"
							+		"<span>&nbsp;&nbsp;</span>";						 								 	
					if(rec.rid == login_id){
						str	+= 	"<button id='b0' class='btn btn-outline-primary btn-sm'>댓글</button>"						 	
						 	+ 	"<button id='b1' class='btn btn-outline-secondary btn-sm'>수정</button>"
						 	+ 	"<button id='b2' class='btn btn-outline-success btn-sm'>삭제</button>"
 						 	+ 	"<button id='b3' class='btn btn-outline-danger btn-sm'>좋아요"
						 	+		"<span class='badge badge-pill badge-primary'>" + rec.rgood + "</span></button>" 						 	
						 	+ 	"<button id='b4' class='btn btn-outline-warning btn-sm'>나빠요"
						 	+		"<span class='badge badge-pill badge-primary'>" + rec.rbad + "</button>"						 	
						 	+ 	"</li></span>";
					}else{
						str	+= 	"<button id='b0' class='btn btn-outline-primary btn-sm'>댓글</button>"						 	
 						 	+ 	"<button id='b3' class='btn btn-outline-danger btn-sm'>좋아요</button>"
						 	+ 	"<button id='b4' class='btn btn-outline-warning btn-sm'>나빠요</button>" 
						 	+ 	"</li></span>";					
					}
				});
				
				$("#reply").html(str);		
				//페이지 리스트 호출
				showPageList(data.pageCriteria);
			},
			error: function(error){
				console.log("실패"+error);
			}
		});
	}	
	
	// 페이지 리스트
	function showPageList(pageCriteria){
		console.log(pageCriteria);
		var str = "";
		
		// 이전표시
		if(pageCriteria.prev){
			// 처음
			str += "<li class='page-item'><a href='1'>◀</a></li>";
			// 이전
			str += "<li class='page-item'><a href='" + (pageCriteria.startPage-1) + "'>" + "◁</a></li>";	
		}
		
		for(var i=pageCriteria.startPage, end=pageCriteria.endPage; i<=end; i++){
			// 
			str += "<li class='page-item'><a class='page-item' href='" + i + "'>" + i + "</a></li>";
		}
		
		// 다음표시
		if(pageCriteria.next){
			// 다음
			str += "<li class='page-item'><a href='" + (pageCriteria.endPage+1) + "'>" + "▷</a></li>";
			// 마지막
			str += "<li class='page-item'><a href='" + (pageCriteria.finalEndPage) + "'>" + "▶</a></li>";	
		}	
		
		$("#pageNumList").html(str);	
	}
/* 	
	//전체댓글목록 가져오기
	function replyListAll(){
		
		var str = "";
		$.ajax({
			type:"GET",
			url:"/webedu/rbbs/list?bnum="+bnum,
			dataType: "json",
			success: function(data){
				console.log(data);
				console.log(data.result);
				console.log(data.pageCriteria);
				$.each(data.result, function(idx,rec){
					console.log(rec);
					console.log(rec.rnum);
					str += "<span><li data-rnum='"+rec.rnum+"' class='reList'>"
						 	+	rec.cdate 	+ "|"		 
						 	+ rec.content + "|"
						 	+	rec.name 		+ "|"
						 	+	rec.good 		+ "|"
						 	+	rec.bad 		+ "|"
						 	+ "<button id='b1'>수정</button>"							 
						 	+ "</li></span>";
				});
				
				$("#reply").html(str);
			},
			error: function(error){
				console.log("실패"+error);
			}
		});
	}	 
	 */
	function closeLayer( obj ) {
		$(obj).parent().parent().hide();
	}

</script>
<title>Insert title here</title>
</head>
<%-- <jsp:include page="/navbar.jsp" flush="true"/> --%>
<body>

	<div id="reReplyDiv">
		<span class="title-dialog"></span>번 댓글 댓글달기
		<div>
			<textarea id="orgContent" cols="50" rows="2" readOnly="true"></textarea>
			<textarea id="reReplyContent" cols="50" rows="3"></textarea>
		</div>
		<div align="right">
			<button id="reReplyBtn" class="btn btn-info btn-sm">댓글</button>
			<button id="reReplyDiv_closeBtn" class="btn btn-info btn-sm">닫기</button>
		</div>
	</div>

	<div id="modifyDiv">
		<span class="title-dialog"></span>번 댓글 수정하기
		<div>
			<textarea id="reContent" cols="50" rows="3"></textarea>
		</div>
		<div align="right">
			<button id="reModifyBtn" class="btn btn-info btn-sm">수정</button>
			<button id="modifyDiv_closeBtn" class="btn btn-info btn-sm">닫기</button>
		</div>
	</div>

	<div class="table-responsive-sm">
		<table class="table table-sm">
			<tr class="table-primary">
				<td class="align-middle" style='width: 120px;'>${user.name } <input
					type="hidden" id="writer" value="${user.name }"> <input
					type="hidden" name="rid" value="${user.username }">
				</td>
				<td><textarea name="" id="replyContent" cols="120" rows="3"></textarea></td>
				<td class="align-middle" style='width: 120px;'><button
						id="replyBtn" class="btn btn-info btn-sm">댓글작성</button></td>
			</tr>

		</table>
	</div>

	<h4>댓글리스트</h4>
	<ul id="reply" class="list-group">
	</ul>

	<div class="container">
		<div class="row justify-content-center">
			<nav aria-label="Page navigation example">
				<ul id="pageNumList" class="pagination">

				</ul>
			</nav>
		</div>
	</div>
</body>
</html>
