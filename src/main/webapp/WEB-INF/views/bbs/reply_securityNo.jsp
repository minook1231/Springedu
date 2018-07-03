<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" flush="true" />
<style>
#reReplyDiv {
	width: 400px;
	height: 230px;
	background-color: gray;
	position: absolute;
	top: 20%;
	left: 30%;
	padding: 20px;
	z-index: 10;
}

#modifyDiv {
	width: 400px;
	height: 200px;
	background-color: gray;
	position: absolute;
	top: 20%;
	left: 30%;
	padding: 20px;
	z-index: 10;
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

var bnum = 1921;
//var bnum = ${view.bnum}
var reReqPage = 1;
$(function(){

	// 리댓글,댓글수정 양식 숨기기
	$("#modifyDiv").hide();
	$("#reReplyDiv").hide();
	
	// 전체댓글목록 가져오기
	//replyListAll();
	
	replyList(reReqPage);
	
	// 댓글작성 클릭시 수행로직
	$("#replyBtn").click(function(){
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
				rid  : "user@kh.com",
				rname: writer,
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
		var rcontent = $("#reContent").val();
			console.log(rnum);		
						console.log(writer);
									console.log(rcontent);
		rnum = parseInt(rnum);
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
				rid  : "user@kh.com",
				rname: "일반사용자",
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
		var reContent = li.text();
		
		//alert("댓글번호 : "+rnum+"  수정할 내용 : "+reContent);		
 		$(".title-dialog").html(rnum);
		$("#orgContent").val(reContent);
		$("#reReplyDiv").show("slow"); 
	});
	
				
	// 수정 클릭 이벤트
	$("#reply").on("click",".reList button#b1" ,function(){

		var li = $(this).parent();
		var rnum = li.attr("data-rnum");
		var reContent = li.text();
		
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
	
	// 댓글 삭제
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
	});	
	
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
	 				str	+= "<li data-rnum='"+rec.rnum+"' class='reList'>";
	 				for(var i=0; i<rec.rindent; i++) {
						str += "&nbsp;&nbsp;";
					}	 			
					str	+=	rec.rcdate 		+ "|"		 
						 	+ 	rec.rcontent 	+ "|"
						 	+		rec.rname 		+ "|"
						 	+		rec.rgood 		+ "|"
						 	+		rec.rbad 			+ "|"
							+ 	"<button id='b0'>댓글</button>"						 	
						 	+ 	"<button id='b1'>수정</button>"
						 	+ 	"<button id='b2'>삭제</button>"
						 	+ 	"<button id='b3'>좋아요</button>"
						 	+ 	"<button id='b4'>나빠요</button>"
						 	+ 	"</li></span>";
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
			str += "<li><a href='1'>◀</a></li>";
			// 이전
			str += "<li><a href='" + (pageCriteria.startPage-1) + "'>" + "◁</a></li>";	
		}
		
		for(var i=pageCriteria.startPage, end=pageCriteria.endPage; i<=end; i++){
			// 
			str += "<li><a href='" + i + "'>" + i + "</a></li>";
		}
		
		// 다음표시
		if(pageCriteria.next){
			// 다음
			str += "<li><a href='" + (pageCriteria.endPage+1) + "'>" + "▷</a></li>";
			// 마지막
			str += "<li><a href='" + (pageCriteria.finalEndPage) + "'>" + "▶</a></li>";	
		}	
		
		$("#pageNumList").html(str);	
	}
	
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
</script>
<title>Insert title here</title>
</head>
<body>

	<div id="reReplyDiv">
		<span class="title-dialog"></span>번 댓글 댓글달기
		<div>
			<textarea id="orgContent" cols="50" rows="2" readOnly="true"></textarea>
			<textarea id="reReplyContent" cols="50" rows="3"></textarea>
		</div>
		<div align="right">
			<button id="reReplyBtn">댓글</button>
			<button id="reReplyDiv_closeBtn">닫기</button>
		</div>
	</div>

	<div id="modifyDiv">
		<span class="title-dialog"></span>번 댓글 수정하기
		<div>
			<textarea id="reContent" cols="50" rows="3"></textarea>
		</div>
		<div align="right">
			<button id="reModifyBtn">수정</button>
			<button id="modifyDiv_closeBtn">닫기</button>
		</div>
	</div>

	<hr />
	작성자:
	<input type="text" id="writer" />
	<br> 댓글 :
	<textarea name="" id="replyContent" cols="50" rows="3"></textarea>
	<br>
	<button id="replyBtn">댓글작성</button>
	<hr />
	<h4>댓글리스트</h4>
	<ul id="reply">
	</ul>
	<ul id="pageNumList">

	</ul>
</body>
</html>
