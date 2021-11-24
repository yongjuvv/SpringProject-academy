<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function pbrDelete(pNumber, pbrno) {
		var sendData = 'pNumber='+pNumber+'&pbrno='+pbrno;
		$.post('${path}/pbrDelete',sendData, function(data) {
			alert("댓글이 삭제 되었습니다");
			$('#pbrbdListDisp').html(data);
		});
	}
	function pbrUpdate(pNumber, pbrno) {
/* 		input, textarea을 읽을 때는 val()
		td을 읽을 때는 text() */
		var txt = $('#td_'+pbrno).text();
		// 읽은 글을 편집할 수 있도록 textarea에 입력
		$('#td_'+pbrno).html("<textarea rows='3' colos='30' id='rt'>"+
				txt+"</textarea>");
		$('#btn_'+pbrno).html("<button onclick='up("+pNumber+","+pbrno+
				")' class='btn btn-sm btn-danger'>확인</button> "+
				"<button onclick='lst("+pNumber+
				")' class='btn btn-sm btn-info'>취소</button>");
	}
	function up(pNumber,pbrno) {
		var sendData = "pbr_content="+$('#rt').val()+
			"&pNumber="+pNumber+"&pbrno="+pbrno;
		$.post('${path}/pbrUpdate',sendData, function(data) {
			alert('수정 되었습니다');
			$('#pbrbdListDisp').html(data);
		});
	}
	function lst(pNumber) {
		$('#pbrbdListDisp').load('${path}/PBreplyList/pNumber/'+pNumber);
	}
</script>

</head>
<body>
<c:if test="${not empty pbList}">
	<table class="table table-striped">
 <tr><td>작성자</td><td>내용</td><td>수정일</td><td></td></tr>
<c:forEach var="rpdboard" items="${pbList}">
	<c:if test="${rpdboard.del == 'y' }">
		<tr><td colspan="4">삭제된 댓글입니다</td></tr>
	</c:if>
	<c:if test="${rpdboard.pbr_del != 'y' }">
		<tr>
			<td>${member.id}</td>
			<td id="td_${rpdboard.pbrno }">${rpdboard.pbr_content }</td>
			<td>${rpdboard.pbr_updatedate}</td>
			<td id="btn_${rpdboard.pbrno}">
<!-- 원래는 댓글 작성자와 로그인한 사람과 비교  회원 게시판이 아니라 임시로 게시작성자 비교 -->
				<c:if test="${member.id==rpdboard.pbr_writer}">
					<button class="btn btn-warning btn-sm"
						onclick="pbrUpdate(${rpdboard.pNumber},${rpdboard.pbrno})">수정</button>
					<button class="btn btn-danger btn-sm"
						onclick="pbrDelete(${rpdboard.pNumber},${rpdboard.pbrno})">삭제</button>
				</c:if>
			</td>
	</c:if>
</c:forEach>	
</c:if>
</body>
</html>