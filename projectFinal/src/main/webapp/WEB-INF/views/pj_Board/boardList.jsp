<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 목록</h2>
<table class="table table-striped">
	<tr><td>번호</td><td>제목</td><td>작성자</td><td>조회수</td><td>작성일</td></tr>
<c:if test="${empty boardList }">
	<tr><td colspan="5">게시글이 없습니다</td></tr>
</c:if>
<c:if test="${not empty boardList }">
<c:forEach var="pj_board" items="${boardList }">
	<tr><td>${pj_board.b_num }</td>
	<c:if test="${pj_board.b_del == 'y' }">
		<td colspan="4">삭제된 글입니다</td>
	</c:if>
	<c:if test="${pj_board.b_del != 'y' }">
		<td title="${pj_board.b_content }">
			<c:if test="${pj_board.b_readcount > 50}">
				<img src="resources/images/hot.gif">
			</c:if>
			
			<%-- <!-- 답변글 -->
			<c:if test="${board.re_level > 0 }">
				<img alt="" src="resources/images/" height="5" width="${board.re_level * 10 }">
				<img alt="" src="resources/images/">
			</c:if> --%>
			
			<a href="boardView.do?b_num=${pj_board.b_num}&pageNum=${pb.currentPage}" class="btn btn-sm btn-info">${pj_board.b_subject}</a></td>
		<td>${pj_board.id }</td>
		<td>${pj_board.b_readcount }</td>
		<td>${pj_board.b_reg_date }</td>
	</c:if></tr>
</c:forEach></c:if>
</table>
<div align="center">
	<ul class="pagination">
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="boardList.do?pageNum=1&boardSearch=${pj_board.boardSearch}&boardKeyword=${pj_board.boardKeyword}">
				<span class="glyphicon glyphicon-backward"></span>
			</a></li>
			<li><a href="boardList.do?pageNum=${pb.startPage-1}&boardSearch=${pj_board.boardSearch}&boardKeyword=${pj_board.boardKeyword}">
				<span class="glyphicon glyphicon-triangle-left"></span>
			</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
			<c:if test="${i == pb.currentPage }">
				<li class="active"><a href="boardList.do?pageNum=${i}&boardSearch=${pj_board.boardSearch}&boardKeyword=${pj_board.boardKeyword}">${i}</a></li>
			</c:if>
			<c:if test="${i != pb.currentPage }">
				<li><a href="boardList.do?pageNum=${i}&boardSearch=${pj_board.boardSearch}&boardKeyword=${pj_board.boardKeyword}">${i}</a></li>
			</c:if>
		</c:forEach>
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="boardList.do?pageNum=${pb.endPage+1 }&boardSearch=${pj_board.boardSearch}&boardKeyword=${pj_board.boardKeyword}">
				<span class="glyphicon glyphicon-triangle-right"></span>
			</a></li>
			<li><a href="boardList.do?pageNum=${pb.totalPage}&boardSearch=${pj_board.boardSearch}&boardKeyword=${pj_board.boardKeyword}">
				<span class="glyphicon glyphicon-forward"></span>
			</a></li>
		</c:if>
	</ul>
</div>

<!-- 검색 -->
<form action="boardList.do">
	<input type="hidden" name="pageNum" value="1">
	<select name="boardSearch">
	<!-- c:forTokens items뒤에 있는 단어가 ,로 구분하여 차례로 4개 단어가 sh에 대입 -->
		<c:forTokens items="id,b_subject,b_content,subcon" delims="," var="sh" varStatus="i">
			 <c:if test="${sh==pj_board.boardSearch}">
			 	<option value="${sh }" selected="selected">${tit[i.index]}</option>
			 </c:if>
			<c:if test="${sh!=pj_board.boardSearch }">
			 	<option value="${sh }">${tit[i.index]}</option>
			 </c:if>
		</c:forTokens>
	</select>
	<input type="text" name="boardKeyword" value="${pj_board.boardKeyword }">
	<input type="submit" value="확인">
</form>
	<a class="btn btn-success" href="boardInsertForm.do?pageNum=1">게시글 입력</a>
</div>
</body>
</html>