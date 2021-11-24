<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#boardDisp').load('helplist1.do',"pageNum=${pageNum}");
	});
	function chk() {
		if(frm.id.value != 'master') {
			alert('관리자만 답글을 달 수 있습니다');
			return false;
		}
	}
</script></head><body>
<div class="container" align="center">
	<h2 class="text-body">게시글 상세 내역</h2>
	<form name="frm">
	<input type="hidden" name = "id" value="${member.id }">
<table class="table table-hover" >

	<tr><td>제목</td><td>${board.hb_subject }</td></tr>
	<tr><td>아이디</td><td>${board.id }</td></tr>
	<tr><td>작성자</td><td>${board.hb_writer}</td></tr>
	<tr><td>조회수</td><td>${board.hb_readcount}</td></tr>
	<tr><td>작성일</td><td>${board.hb_reg_date}</td></tr>
	<tr><td>내용</td><td>${board.hb_content}</td></tr>
	<tr><td colspan="2" align="center">
		<a class="btn btn-info" href="helplist.do?pageNum=${pageNum}">게시글 목록</a>
		<!-- 로그인한 아이디와 작성자가 맞을 때에만 삭제, 수정 보여줌 -->
		<c:choose>
			<c:when test="${not empty board.id }">
				<c:choose>
					<c:when test="${board.id == member.id }">
						<a class="btn btn-warning" 
			href="helpUpdateForm.do?num=${board.hb_number}&pageNum=${pageNum}">수정</a>
		<a class="btn btn-danger" 
			href="helpDelete.do?num=${board.hb_number}&pageNum=${pageNum}">삭제</a>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${member.id == 'master' }">
						<a class="btn btn-success" onclick = chk()
			href="helpInsertForm.do?nm=${board.hb_number}&pageNum=${pageNum}">답글</a>
			</c:when>
		</c:choose>
	</td></tr>
</table>
</form>
<div id="boardDisp"></div>
</div>
</body>
</html>