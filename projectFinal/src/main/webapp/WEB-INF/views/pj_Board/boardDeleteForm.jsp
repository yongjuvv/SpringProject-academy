<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* 	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호 확인이 다릅니다.");
			frm.password.focus();
			frm.password.value = "";
			return false;
		}
	} */
</script>
</head>
<body>
<div class="container" align="center">
	<h2>게시글 삭제</h2>
<form action="boardDelete.do"> <!-- name="frm" onsubmit="return chk()"> -->
	<input type="text" name="b_num" value="${pj_board.b_num }">
	<%-- <input type="hidden" name="password2" value="${pj_board.password}"> --%>
	<input type="hidden" name="pageNum" value="${pageNum}">
<table class="table table-hover">
	<!-- <tr><td>암호</td><td><input type="password" name="password" required="required" autofocus="autofocus"></td></tr> -->
	<tr><td colspan="2"><input type="submit"></td></tr>
</table>
</form>
</div>
</body>
</html>