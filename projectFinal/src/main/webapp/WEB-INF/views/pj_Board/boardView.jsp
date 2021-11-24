<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#pj_boardDisp').load('boardList1.do',"pageNum=${pageNum}");
		$('#rbdListDisp').load('rbdList.do',"b_num=${pj_board.b_num}");
		$('#rInsert').click(function() {
//			var sendData = 'b_num='+frm.b_num.value+'&id='+frm.id.value+'&r_content='+frm.r_content.value;
			var sendData = $('#frm1').serialize();
			$.post('rInsert.do', sendData, function(data) {
				alert('댓글이 작성되었습니다');
				$('#rbdListDisp').html(data);
				frm1.r_content.value=""; // 입력한 댓글 삭제 
			});
		});
	});
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 상세 내역</h2>
<table class="table table-hover">
	<tr><td>제목</td><td>${pj_board.b_subject}</td></tr>
	<tr><td>작성자</td><td>${pj_board.id}</td></tr>
	<tr><td>조회수</td><td>${pj_board.b_readcount}</td></tr>
	<tr><td>작성일</td><td>${pj_board.b_reg_date}</td></tr>
	<tr><td>내용</td><td>${pj_board.b_content}</td></tr>
	<tr><td colspan="2" align="center">
		<a class="btn btn-info" href="boardList.do?pageNum=${pageNum}" style="background: sky;">게시글 목록</a>
		<!-- 로그인한 아이디와 작성자가 맞을 때에만 삭제, 수정 보여줌 -->
		<c:choose>
			<c:when test="${not empty member.id }">
				<c:choose>
					<c:when test="${pj_board.id == member.id }">
						<a class="btn btn-warning" href="boardUpdateForm.do?b_num=${pj_board.b_num}&pageNum=${pageNum}" style="background: orange;">수정</a>
						<a class="btn btn-danger" href="boardDelete.do?b_num=${pj_board.b_num}&pageNum=${pageNum}">삭제</a>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
<!-- 	<a class="btn btn-success" href="insertForm.do?nm=${board.num}&pageNum=${pageNum}">답글</a> -->
	</td></tr>
</table>

<!-- 로그인했을 때에만 댓글 작성 보여줌 -->
<c:choose>
	<c:when test="${not empty member.id }">
		<form action="" name="frm1" id="frm1">
			<h3 class="text-primary">댓글 작성</h3>
			<input type="hidden" name="b_num" value="${pj_board.b_num }">
		<table class="table table-hover">
			<!-- 회원게시판은 로그인 한 사람의 이름 또는 아이디 -->
			<tr><td>작성자</td><td><input type="text" name="id" value="${member.id }" size="4"></td>
			<td>댓글</td><td><textarea rows="3" cols="30" name="r_content"></textarea></td>
			<td><input type="submit" value="댓글 입력" id="rInsert"></td></tr>
		</table>
		</form>
	</c:when>
</c:choose>
	<!-- 댓글 목록 -->
    <!-- 댓글이 등록이 되면 rbdList에 댓글이 쌓이게 된다. -->
	<div id="rbdListDisp"></div>
	<div id="pj_boardDisp"></div>
</div>
</body>
</html>