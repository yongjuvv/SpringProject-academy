<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* function chk() {
		if (frm.password.value != frm.password2.value) {
			alert('암호가 다르면 수정 못합니다');	frm.password.focus();
			frm.password.value = "";		return false;
		}
	} */
</script></head><body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 수정</h2>	
<form action="helpUpdate.do" method="post" name="frm"
	onsubmit="return chk()">
	<input type="hidden" name="hb_number" value="${board.hb_number}">
	<input type="hidden" name="pageNum" value="${pageNum}">
<table class="table table-bordered">
	<tr><td>제목</td><td><input type="text" name="hb_subject" 
		required="required" autofocus="autofocus"
		value="${board.hb_subject }"></td></tr>
	<tr><td>작성자</td><td><input type="text" name="hb_writer" 
		required="required" value="${board.hb_writer }"></td></tr>
	<tr><td>내용</td><td><pre><textarea rows="5" cols="40" 
		required="required" name="hb_content">${board.hb_content }</textarea> </pre></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" class="btn btn-success"></td></tr>
</table>
</form>
	<a href="helplist.do?pageNum=${pageNum}">게시글 목록</a>
</div>
</body>
</html>