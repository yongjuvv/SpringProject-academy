<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* function chk() {
		if (frm.password.value != frm.password2.value) {
			alert('암호가 다르면 수정을 할 수 없습니다.');
			frm.password.focus();
			frm.password.value = "";
			return false;
		}
	} */
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 수정</h2>	
<form action="boardUpdate.do" method="post"> <!-- name="frm" onsubmit="return chk()"> -->
	<input type="hidden" name="b_num" value="${pj_board.b_num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<%-- <input type="hidden" name="password2" value="${pj_board.password}"> --%>
<table class="table table-bordered">
	<tr><td>제목</td><td><input type="text" name="b_subject" required="required" autofocus="autofocus" value="${pj_board.b_subject }"></td></tr>
	<tr><td>작성자</td><td><input type="text" name="id" required="required" value="${pj_board.id }"></td></tr>
	<tr><td>내용</td><td><pre><textarea rows="5" cols="40" required="required" name="b_content">${pj_board.b_content }</textarea></pre></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" class="btn btn-success"></td></tr>
</table>
</form>
	<a href="boardList.do?pageNum=${pageNum}">게시글 목록</a>
</div>
</body>
</html>