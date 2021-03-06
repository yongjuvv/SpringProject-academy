<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert('암호와 암호확인이 다르면 수정 못합니다');
			frm.password.focus(); frm.password.value = "";
			return false;
		}
	}
</script></head><body>
<div class="container">
<form action="update.html" method="post" name="frm"
	onsubmit="return chk()">
	<input type="hidden" name="num" value="${board.num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="password2" value="${board.password}">
<table class="table table-bordered">
	<caption>게시글 수정</caption> 
	<tr><td>제목</td><td><input type="text" name="subject"
		required="required" autofocus="autofocus" 
		value="${board.subject }"></td></tr>
	<!-- 회원 게시판일 경우에는 생략 시작 -->
	<tr><td>작성자</td><td><input type="text" name="writer"
		required="required" value="${board.writer }"></td></tr>
	<tr><td>이메일</td><td><input type="email" name="email"
		required="required" value="${board.email }"></td></tr>
	<tr><td>암호</td><td><input type="password" name="password"
		required="required"></td></tr>
	<!-- 회원 게시판일 경우에는 생략 끝 -->
	<tr><td>내용</td><td><pre><textarea rows="5" cols="40" name="content" 
		required="required">${board.content}</textarea></pre></td></tr>
	<tr><td colspan="2"><input type="submit"></td></tr>
</table>
</form>
</div>
</body>
</html>