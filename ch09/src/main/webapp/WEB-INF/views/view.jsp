<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#boardListDisp').load('list.html','pageNum=${pageNum}');
	});
</script>
</head><body>
<div class="container" align="center">
<table class="table table-hover">
	<caption class="text-primary">게시글 상세 내역</caption>
	<tr><td>제목</td><td>${board.subject }</td></tr>
	<tr><td>작성자</td><td>${board.writer }</td></tr>
	<tr><td>내용</td><td>${board.content }</td></tr>
	<tr><td>이메일</td><td>${board.email }</td></tr>
	<tr><td>조회수</td><td>${board.readcount }</td></tr>
	<tr><td>작성일</td><td>${board.reg_date }</td></tr>
	<tr><td colspan="2">
		<a href="list.html?pageNum=${pageNum}" 
			class="btn btn-info" >게시글 목록</a>
		<a href="updateForm.html?num=${board.num}&pageNum=${pageNum}" 
			class="btn btn-warning" >수정</a>
		<a href="deleteForm.html?num=${board.num}&pageNum=${pageNum}" 
			class="btn btn-danger" >삭제</a>
		<a href="insertForm.html?nm=${board.num}&pageNum=${pageNum}" 
			class="btn btn-success" >답글</a>
	</td>
</table>
<div id="boardListDisp"></div>
</div>
</body>
</html>