<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<script type="text/javascript">
	// 댓글 삭제
	function replyDelete(reviewNum, coReplyNum) {
		var sendData = "reviewNum"+reviewNum+"&coReplyNum="+coReplyNum;
		$.post('reviewReplyDelete.do', sendData, function(data) {
			alert("댓글이 삭제되었어요");
			$('#replyList').load('reviewReplyList.do?reviewNum=${review.reviewNum}');
		});
	}
	
	// 댓글 수정 form
	function replyUpdate(reviewNum, coReplyNum) {
		var txt = $('#td_'+coReplyNum).text();
		$('#td_'+coReplyNum).html('<textarea rows="1" cols="40" id="rt">'+txt+'</textarea>');
		$('#btn_'+coReplyNum).html(
			'<button onclick="up('+reviewNum+','+coReplyNum+')" class="btn btn-sm btn-default">수정완료</button> '+
			'<button onclick="lst('+reviewNum+')" class="btn btn-sm btn-default">취소</button>'
		);
	}
	
	// 댓글 수정
	function up(reviewNum, coReplyNum) {
		var sendData = "coReCont="+$('#rt').val()+"&reviewNum="+reviewNum+"&coReplyNum="+coReplyNum;
		$.post('reviewReplyUpdate.do', sendData, function() {
			$('#replyList').load('reviewReplyList.do?reviewNum=${review.reviewNum}');
		});
	}
	
	// 댓글 수정 취소
	function lst(reviewNum) {
		$('#replyList').load('reviewReplyList.do?reviewNum=${review.reviewNum}');
	}
</script>
</head>
<body>
	<div>
		<table class="table">
			<c:if test="${empty coList}">
				<tr>
					<td colspan="4" class="textcenter bordernone">
						<span class="fs14 fsgray">아직 등록된 댓글이 없어요</span></td>
				</tr>
			</c:if>
			<c:if test="${not empty coList}">
				<c:forEach var="coreply" items="${coList}">
					<tr>
						<c:if test="${coreply.coReDel=='y'}">
							<td colspan="4" style="text-align: left; background-color: ">
							<span class="fs14">삭제된 댓글입니다</span>
							</td>
						</c:if>
						<c:if test="${coreply.coReDel!='y'}">
							<td width="30%">
								<span class="fs14">${coreply.nickName}</span>
							</td>
							<td width="50%" style="text-align: left;" id="td_${coreply.coReplyNum}"><span class="fs14">${coreply.coReCont}</span></td>							
							<td width="40%" align="right" id="btn_${coreply.coReplyNum}">
								<c:if test="${coreply.coReEmail == email}">
									<button class="btn btn-sm btn-default" onclick="replyUpdate(${coreply.reviewNum}, ${coreply.coReplyNum})">수정</button>
									<button class="btn btn-sm btn-default" onclick="replyDelete(${coreply.reviewNum}, ${coreply.coReplyNum})">삭제</button>
								</c:if>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
</html>