<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container" align="center">
<c:set var="num" value="${no }"></c:set>
<table class="table table-striped">
	<caption class="text-primary">게시글 목록</caption>
	<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th>
		<th>작성일</th></tr>	
<c:if test="${empty list }">
	<tr><th colspan="5">데이터가 없습니다 </th></tr>
</c:if>
<c:if test="${not empty list}">
<c:forEach var="board" items="${list }">
	<tr><td><%-- ${board.num} --%>${num}
		<c:set var="num" value="${num - 1}"></c:set></td>
		<c:if test="${board.del == 'y' }">
			<td colspan="4">삭제된 글입니다</td>
		</c:if>			
			<c:if test="${board.del != 'y' }">
			<td title="${board.content}">
			<!-- 답변글이면 -->
			<c:if test="${board.re_level > 0}">
				<img src="${path}/images/level.gif" height="5" 
					width="${board.re_level * 10}"> <!-- 들여쓰기 -->
				<img src="${path}/images/re.gif">					
			</c:if>
			<c:if test="${board.readcount > 30 }">
				<img alt="" src="${path}/images/hot.gif">
			</c:if>
				<a href="${path}/view/num/${board.num}/pageNum/${pb.currentPage}"
					class="btn btn-info btn-sm">
				${board.subject}</a></td>
			<td>${board.writer }</td>
			<td>${board.readcount }</td>
			<td>${board.reg_date }</td>
		</c:if></tr>
</c:forEach></c:if></table>
<div align="center">
	<ul class="pagination">
		<c:if test="${pb.startPage > pb.pagePerBlock}">
			<li><a href="${path}/list/pageNum/1?search=${board.search}&keyword=${board.keyword}">
					<span class="glyphicon glyphicon-backward"></span>
				</a></li>
			<li><a href="${path}/list/pageNum/${pb.startPage - 1}?search=${board.search}&keyword=${board.keyword}">
					<span class="glyphicon glyphicon-triangle-left"></span>
				</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
			<c:if test="${i==pb.currentPage}">
				<li class="active"><a href="${path}/list/pageNum/${i}?search=${board.search}&keyword=${board.keyword}">${i}</a></li>
			</c:if>
			<c:if test="${i!=pb.currentPage}">
				<li><a href="${path}/list/pageNum/${i}?search=${board.search}&keyword=${board.keyword}">${i}</a></li>
			</c:if>		
		</c:forEach>
		<c:if test="${pb.endPage < pb.totalPage}">
			<li><a href="${path}/list/pageNum/${pb.endPage + 1}?search=${board.search}&keyword=${board.keyword}">
					<span class="glyphicon glyphicon-triangle-right"></span>
				</a></li>
			<li><a href="${path}/list/pageNum/${pb.totalPage}?search=${board.search}&keyword=${board.keyword}">
					<span class="glyphicon glyphicon-forward"></span>
				</a></li>
		</c:if>
	</ul>
</div>
<form action="${path}/list/pageNum/1">
<!-- 	<input  type="hidden" name="pageNum" value="1"> -->
<%-- <select name="search">
		<c:if test="${board.search=='writer'}">
			<option value="writer" selected="selected">작성자</option>
		</c:if>
		<c:if test="${board.search=='subject'}">
			<option value="subject" selected="selected">제목</option>
		</c:if>
		<c:if test="${board.search=='content'}">
			<option value="content" selected="selected">내용</option>
		</c:if>
		<option value="writer">작성자</option>
		<option value="subject">제목</option>
		<option value="content">내용</option>
	</select> --%>
	<select name="search">
		<c:forTokens var="sh" items="writer,subject,content,subcon" 
			delims="," varStatus="i">
			<c:if test="${sh==board.search}">
				<option value="${sh}"
					selected="selected">${tit[i.index] }</option>
			</c:if>
			<c:if test="${sh!=board.search}">
				<option value="${sh}">${tit[i.index] }</option>
			</c:if>
		</c:forTokens>
	</select>
	<input type="text" name="keyword" value="${board.keyword}">
	<input type="submit" value="확인">
</form>
<a href="${path}/insertForm/nm/null/pageNum/1" class="btn btn-info">게시글 입력</a>
</div>
</body>
</html>



