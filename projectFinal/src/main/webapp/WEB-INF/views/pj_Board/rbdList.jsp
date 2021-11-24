<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rDelete(b_num, rno) {
		var sendData = 'b_num='+b_num+'&rno='+rno;
		$.post('rDelete.do', sendData, function(data) {
			alert('댓글이 삭제되었습니다');
			$('#rbdListDisp').html(data);
			frm1.r_content.value="";
		});
	}
	function rUpdate(b_num, rno) {
 		// input, text의 데이터를 읽을 때는 val()
		// td의 데이터를 읽을 때는 text()
		var txt = $('#td_'+rno).text();
		// 읽을 글을 편집할 수 있도록 textarea에 입력
		$('#td_'+rno).html("<textarea rows='3' cols='30' id='rt'>"+txt+"</textarea>");
		$('#btn_'+rno).html("<input type='button' onclick='up("+b_num+","+rno+")' class='btn btn-sm btn-danger' value='확인'>"
			+ " <input type='button' onclick='lst("+b_num+")' class='btn btn-sm btn-info' value='취소'>");
		$('#rt').focus();
	}
	function lst(b_num) {
		$('#rbdListDisp').load("/rbdList.do?b_num="+b_num);
	}
	function up(b_num, rno) {
		var sendData="r_content="+$('#rt').val()+'&b_num='+b_num+'&rno='+rno;
		$.post('rUpdate.do', sendData, function(data) {
			alert('댓글이 수정되었습니다');
			$('#rbdListDisp').html(data);
		});
	}
</script>
</head>
<body>
<div class="container" align="center">
<h3 class="text-primary">댓글 목록</h3>
<c:if test="${not empty rbdList }">
<table class="table table-striped">
	<tr><td>작성자</td><td>내용</td><td>수정일</td><td></td></tr>
<c:forEach var="rbd" items="${rbdList }">
		<tr><td>${rbd.id }</td>
			<td id="td_${rbd.rno}">${rbd.r_content }</td>
			<td>${rbd.r_updatedate }</td>
 		<!-- 회원 게시판은 로그인 한 사람과 댓글 작성자가 같으면 수정/삭제 -->
			<td id="btn_${rbd.rno}">
		<c:if test="${rbd.id==member.id }">
			<input type="button" class="btn btn-sm btn-warning" onclick="rUpdate(${rbd.b_num},${rbd.rno })" value="수정">
			<input type="button" class="btn btn-sm btn-danger" onclick="rDelete(${rbd.b_num},${rbd.rno })" value="삭제">
		</c:if>
		</td></tr>
</c:forEach>		
</table>
</c:if>
</div>
</body>
</html>