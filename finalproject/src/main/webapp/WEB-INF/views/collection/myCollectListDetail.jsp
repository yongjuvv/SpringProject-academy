<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../taglib.jsp" %>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${collect.collNum}</title>
<script type="text/javascript">
$(function() {
	$('.TopNavTab').addClass('TopNavTabScroll');
	$('.loginButtonCss').addClass('loginButtonCssScroll');
	$('.NavLogoCss').addClass('NavLogoCssScroll');
	$('.NavBasicFormInput').addClass('NavBasicFormInputScroll');
	$('.InputFormSearch').addClass('InputFormSearchScroll');
});
/* function collReDelete(collReplyNum,collNum) {
	alert(collNum);
	var sendData = "collReplyNum="+collReplyNum+"&collNum="+collNum;
	$.post('collReDelete.do',sendData, function (data) {
		alert('삭제완료');
		$('#rbdListDisp').html(data);
	});
}
function collReUpdate(collReplyNum) {
	var txt =$('#td_'+collReplyNum).text();
	$('#td_'+rno).html(
		'<textarea rows="1" cols="30" id="rt">'+txt+'</textarea>');
	$('#btn_'+collReplyNum).html(
		'<button onclick="up('+collReplyNum+')" class="btn btn-sm btn-danger">확인</button>'+
		'<button onclick="lst('+collReplyNum+
			')" class="btn btn-sm btn-info">취소</button>'
	);
}
function up(collReplyNum) {
	var sendData ="replytext="+$('#rt').val()+
	"&collReplyNum="+collReplyNum;
	$.post('collReUpdate.do',sendData, function (data) {
		alert("댓글 수정 완료");
		$('#rbdListDisp').html(data);
	});
	
} */
/* function lst(bno) {
	$('#rbdListDisp').load('${path}/replyList/bno/'+bno);		
} */




/*  function collre1(cc,cn) {
	 alert('collReCont ='+ cc);
		 alert('collReplyNum ='+ cn);
		$.post("collReUpdate.do", "collReCont="+cc+"&collReplyNum="+cn, function(data) {
			alert('data='+data);
		});
}	
 function collre2(cc,cn) {
	 alert('collReCont ='+cc);
	 alert('collReplyNum ='+cn);
	 $.post("collReDelete.do", "collReCont="+cc+"&collReplyNum="+cn, function(data) {
		 alert('date='+data);	
	});
	
} */

	
</script>
<style type="text/css">
h1 {
	display: block;
	font-size: 19px;
	font-weight: 700;
	letter-spacing: -0.7px;
	line-height: 28px;
	margin: 16px 0 2px;
}

h2 {
	display: block;
	font-size: 1em;
	margin-block-start: 0.83em;
	margin-block-end: 0.83em;
}

.c {
	display: inline-block;
	color: #a0a0a0;
	font-size: 15px;
	font-weight: 400;
	-webkit-letter-spacing: -0.2px;
	-moz-letter-spacing: -0.2px;
	-ms-letter-spacing: -0.2px;
	letter-spacing: -0.2px;
	line-height: 20px;
	margin: 12px 0 12px 6px;
}

.video {
	margin: 15px;
	margin-left: 25;
	margin-right: 25px;
	margin-bottom: 70px;
	padding: 10px;
	padding-left: 15;
	height: 150px;
	float: left;
	font-size: 15px;
}

.BasicCommentItem__Comment {
	background-color: #f2f2f2;
	box-sizing: border-box;
	padding: 0 12px;
	margin-top: 15;
	border-radius: 6px;
	overflow: hidden;
	font-family: 'Noto Sans KR', sans-serif;
}

.CommentPage__CommentContainer {
	max-width: 640px;
	margin: 0 auto;
	box-sizing: border-box;
}

.bu {
	margin-left: 25px
}

div {
	display: block;
}

th {
	size: 0;
	margin-bottom: 0;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
	<input type="hidden" name="collNum" value="${collNum}">
	<div class="container" style="margin-top: 100;" align="center">
		<div align="left">
			<a href="myCollect.do?collNum=${collNum}"> <img alt=""
				src="https://2.bp.blogspot.com/-G0w5y_ViMG4/XDwpVaZBTCI/AAAAAAAAAAM/HtJC_DWav9cT1r0Hch87X0Xmy9YoymLsACLcBGAs/s1600/user.png"
				width="60px"></a> <a title="${pmember.memName}">${pmember.memName}</a>
			<%-- <input type="button" value="수정" class="btn btn-danger"
				onclick="location.href='collUpdateForm.do?collNum=${collect.collNum}'">
			<input type="button" value="삭제" class="btn btn-danger"
				onclick="location.href='collDeleteChk.do?collNum=${collect.collNum}'"> --%>
			<h1>${collect.collName}</h1>${collect.collDesc}
		</div>
		<hr>
		<%-- <div align="left" class="ContentlessCommentItem__LikeReplyBlock">
			<img
				src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzc4Nzg3OCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02Ljc1IDkuNDg1aC0zYTEgMSAwIDAgMC0xIDF2MTBhMSAxIDAgMCAwIDEgMWgzYTEgMSAwIDAgMCAxLTF2LTEwYTEgMSAwIDAgMC0xLTFNMjAuNjU3IDguNTY2YTIuMzYzIDIuMzYzIDAgMCAwLTEuNzc5LS44MTNIMTYuNjJsLjE2NC0uNjI3Yy4xMzctLjUyOC4yMDEtMS4xMi4yMDEtMS44NjMgMC0xLjkxOS0xLjM3NS0yLjc3OC0yLjczOC0yLjc3OC0uNDQ0IDAtLjc2Ni4xMjMtLjk4Ni4zNzYtLjIuMjI3LS4yODIuNTMtLjI0My45MzVsLjAzIDEuMjMtMi45MDMgMi45NGMtLjU5My42LS44OTQgMS4yMy0uODk0IDEuODcydjkuNjQ3YS41LjUgMCAwIDAgLjUuNWg3LjY4N2EyLjM4OCAyLjM4OCAwIDAgMCAyLjM0OC0yLjA3bDEuNDQ1LTcuNDUyYTIuNDQgMi40NCAwIDAgMC0uNTc0LTEuODk3Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
				width="18px" height="18px"><span id="rl">${collect.collLike}</span>
			<img class="ContentlessCommentItem__ReplyImage"
				src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM3ODc4NzgiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTkuODU3IDE3Ljc4Nkw2IDIxdi00LjkxYy0xLjg0MS0xLjM3My0zLTMuMzY5LTMtNS41OUMzIDYuMzU4IDcuMDMgMyAxMiAzczkgMy4zNTggOSA3LjVjMCA0LjE0Mi00LjAzIDcuNS05IDcuNS0uNzM5IDAtMS40NTYtLjA3NC0yLjE0My0uMjE0eiIvPgo8L3N2Zz4K"
				width="18px" height="18px">${collReplycount}개
		</div> --%>

		<div align="left">
			<input type="button" value="👍좋아요" class="btn btn-info"> <input
				type="button" value="댓글" class="btn btn-info"
				onclick="location.href='collReplyForm.do?collNum=${collect.collNum}'">

		</div>
		<div align="left">
			<h2 class="c">작품들</h2>
			<span class="c">${collReplycount}</span>
			<p>
		</div>
		<c:if test="${not empty CollVideoList}">
			<c:forEach var="collVideo" items="${CollVideoList}">
				<div class="video">
					<p>
						<a href="movSearchResult.do?movNum=${collVideo.movNum}"><img
							alt="이미지"
							src="<%=request.getContextPath()%>/images/${collVideo.movPic}"
							width="120" height="160"></a>
					<p>
					<p>${collVideo.movName}<br> ${collVideo.movGenre1}
				</div>
			</c:forEach>
		</c:if>
	</div>
	<%-- <p>
		<!-- 댓글 목록 -->
	<div class="container">

		<div class="BasicCommentItem__Comment">
			<div align="left">
				<table class="table">
					<h2 class="c">댓글</h2>
					<span class="c">5</span>
					<c:if test="${empty collReplyList }">
						<tr>
							<td colspan="4" class="textcenter bordernone"><span
								class="fs14 fsgray">아직 등록된 댓글이 없어요</span></td>
						</tr>
					</c:if>
					<c:if test="${not empty collReplyList }">
						<c:forEach var="collReply" items="${collReplyList}">
								<c:if test="${collreply.collReDel =='y'}">
								<tr>
								
									<td colspan="4" style="text-align: left; background-color:">
										<span class="fs14">삭제된 댓글입니다</span>
									</td>
								
								</tr>
								</c:if>
								<c:if test="${collreply.collReDel !='y'}">
								<input type="hidden" id="collReplyNum" value="${collReply.collReplyNum}">
								<tr>
								<td>작성자<a href="myPage.do?email=${collReply.email}"> <img alt=""
									src="https://2.bp.blogspot.com/-G0w5y_ViMG4/XDwpVaZBTCI/AAAAAAAAAAM/HtJC_DWav9cT1r0Hch87X0Xmy9YoymLsACLcBGAs/s1600/user.png"
									width="60px"></a>
								</td>
								<td id="rt">${collReply.collReCont}</td>
								<td>
								<td id="btn_${collReply.collReplyNum}">
								<a class="btn btn-sm btn-warning" onclick="collReUpdate(${collReply.collReplyNum},${collReply.collReplyNum})">수정</a>
								<a class="btn btn-sm btn-danger" onclick="collReDelete(${collReply.collReplyNum},${collReply.collNum})">삭제</a>
								</td></tr></c:if>
							</c:forEach>
					</c:if>
							 --%>	
								
								
							<%-- 	<input type="button" class="btn" value="수정" id="collReUp_${collReply.collReplyNum}"
									onclick="readonlyFal(${collReply.collReplyNum})" >
								<button type="button" class="btn" id="collReUp"
									onclick="collre1('${collReply.collReCont}',${collReply.collReplyNum})">수정</button>
								</td>
								<td>
								<button type="button" class="btn" id="collReDe"
									onclick="collre2('${collReply.collReCont}',${collReply.collReplyNum})">삭제</button>
								</td> --%>
								 	
		<!-- 				
				</table>
			</div>
		</div>
	</div>
	<div id="rbdListDisp"></div> -->
</body>
</html>