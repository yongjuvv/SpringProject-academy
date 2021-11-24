<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* 	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert('암호와 암호 확인이 다릅니다');
			frm.password.focus();    // 커서를 암호에 위치
			frm.password.value = ""; // 입력한 암호를 삭제
			return false; // insert.do를 하지 마라
		}
	} */
</script></head><body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 입력</h2>
<form action="helpInsert.do" method="post" name="frm" >
	<!-- onsubmit="return chk()" -->
	<input type="hidden" name="id" value="${member.id}">
	<input type="hidden" name="hb_writer" value="${member.name}">
	<input type="hidden" name="hb_number" value="${hb_number}">
	<input type="hidden" name="hb_ref" value="${hb_ref}">
	<input type="hidden" name="hb_re_level" value="${hb_re_level}">
	<input type="hidden" name="hb_re_step" value="${hb_re_step}">
	<input type="hidden" name="pageNum" value="${pageNum}">
<table class="table table-hover table-bordered">
<c:if test="${member.id != 'master' }">
	<tr><td>제목</td><td><input type="text" name="hb_subject" 
		required="required" autofocus="autofocus"></td></tr>
</c:if>
<c:if test="${member.id == 'master' }">
	<tr><td>제목</td><td><input type="text" name="hb_subject" 
		required="required" autofocus="autofocus"
		value="관리자 답변입니다."></td></tr>
</c:if>	
		<!-- 회원 게시판인 경우는 생략 시작 -->
		<tr><td>아이디</td><td>${member.id}</td></tr>
	<tr><td>작성자</td><td>${member.name }</td></tr>
		<!-- 회원 게시판인 경우는 생략 끝 -->
	<tr><td>내용</td><td><textarea rows="8" cols="45" 
		name="hb_content" required="required"></textarea></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" class="btn btn-success"></td></tr>
</table>
</form>
</div>
</body>
</html>