<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>helplist</title>
</head>
<body>
<script type="text/javascript">
/*  function insertClick() {
	 alert("버튼을 눌렀습니다.");
	 
 } */
</script>
<div class="container" align="center">
	<h2 class="text-body">고객센터 게시판</h2>
<table class="table table-bordered">
	<tr><td>번호</td><td>제목</td><td>작성자</td><td>조회수</td><td>작성일</td></tr>
<c:if test="${empty list }">
	<tr><td colspan="5">게시글이 없습니다</td></tr>
</c:if>
<c:if test="${not empty list }">
<c:forEach var="board" items="${list }">
	<tr><td>${board.hb_number }</td>
	<c:if test="${board.hb_del == 'y' }">
		<td colspan="4">삭제된 글입니다</td>
	</c:if>
	<c:if test="${board.hb_del != 'y' }">
		<td title="${board.hb_content }">
			<c:if test="${board.hb_readcount > 50}">
				<img src="resources/images/hot.gif">
			</c:if>
			<!-- 답변글 -->
			<c:if test="${board.hb_re_level > 0 }">
				<img alt="" src="resources/images/level.gif"
					height="5" width="${board.hb_re_level * 10 }">
				<img alt="" src="resources/images/re.gif">
			</c:if>
			<a href="helpView.do?num=${board.hb_number}&pageNum=${pb.currentPage}" 
				>${board.hb_subject}</a></td>
		<td>${board.hb_writer }</td>
		<td>${board.hb_readcount }</td>
		<td>${board.hb_reg_date }</td>
	</c:if></tr>
</c:forEach></c:if>
</table>
<div align="center">
	<ul class="pagination">
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="helplist.do?pageNum=1&search=${board.search}&keyword=${board.keyword}">
				<span class="glyphicon glyphicon-backward"></span>
			</a></li>
			<li><a href="helplist.do?pageNum=${pb.startPage-1}&search=${board.search}&keyword=${board.keyword}">
				<span class="glyphicon glyphicon-triangle-left"></span>
			</a></li>			
		</c:if>
		<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
			<c:if test="${i == pb.currentPage }">
				<li class="active"><a href="helplist.do?pageNum=${i}&search=${board.search}&keyword=${board.keyword}">${i}</a></li>
			</c:if>
			<c:if test="${i != pb.currentPage }">
				<li><a href="helplist.do?pageNum=${i}&search=${board.search}&keyword=${board.keyword}">${i}</a></li>
			</c:if>
		</c:forEach>
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="helplist.do?pageNum=${pb.endPage+1 }&search=${board.search}&keyword=${board.keyword}">
				<span class="glyphicon glyphicon-triangle-right"></span>
			</a></li>
			<li><a href="helplist.do?pageNum=${pb.totalPage}&search=${board.search}&keyword=${board.keyword}">
				<span class="glyphicon glyphicon-forward"></span>
			</a></li>
		</c:if>
	</ul>
</div>
<!-- 검색 -->
<form action="helplist.do">
	<input type="hidden" name="pageNum" value="1">
	<select name="search">
	<!-- c:forTokens items뒤에 있는 단어가 ,로 구분하여 차례로 4개 단어가 sh에 대입 -->
		<c:forTokens items="hb_writer,hb_subject,hb_content,hb_subcon"
			 delims="," var="sh" varStatus="i">
			 <c:if test="${sh==board.search}">
			 	<option value="${sh }" selected="selected">
			 		${tit[i.index]}</option>
			 </c:if>
			<c:if test="${sh!=board.search }">
			 	<option value="${sh }">${tit[i.index]}</option>
			 </c:if>
		</c:forTokens>
	</select>
	<input type="text" name="keyword" value="${board.keyword }">
	<input type="submit" value="확인">
</form>
<a class="btn btn-success" href="helpInsertForm.do?pageNum=1" onclick="insertClick()">게시글 입력</a>
</div>
</body>
</html>