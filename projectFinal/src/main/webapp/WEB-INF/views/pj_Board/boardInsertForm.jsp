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
			alert('암호와 암호 확인이 다릅니다');
			frm.password.focus();    // 커서를 암호에 위치
			frm.password.value = ""; // 입력한 암호를 삭제
			return false; // insert.do를 하지 마라
		}
	} */
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 입력</h2>
<form action="boardInsert.do" method="post" name="boardInsert"> <!-- name="frm" onsubmit="return chk()"> -->
	<input type="hidden" name="b_num" value="${b_num}">
	<input type="hidden" name="id" value="${member.id}">
	<input type="hidden" name="pageNum" value="${pageNum}">
<table class="table table-hover table-bordered">
	<tr><td>제목</td><td><input type="text" name="b_subject" required="required" autofocus="autofocus"></td></tr>

		<!-- 회원 게시판인 경우는 생략 시작 -->
	<tr><td>작성자</td><td>${member.id }</td></tr>
	
		<!-- 회원 게시판인 경우는 생략 끝 -->
	<tr><td>내용</td><td><textarea rows="5" cols="40" name="b_content" required="required"></textarea></td></tr>
	<tr><td colspan="2" align="center">
		<c:choose>
			<c:when test="${not empty member.id }">
					<input type="submit" class="btn btn-success">
			</c:when>
		</c:choose>
		<%-- <c:if test="${member.id != pj_board.id }">
			<input type="text" class="" value="로그인을 해야 게시글을 입력할 수 있습니다.">
		</c:if> --%>
	</td></tr>
</table>
</form>
</div>
</body>
</html>