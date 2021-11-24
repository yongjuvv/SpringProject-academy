<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../newHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">

<table class="table">
	<tr>
		<th align="center" width="15%">날짜</th>
		<th align="center" width="15%">제목</th>
		<th align="center" width="60%">내용</th>
		<th align="center" width="10%"></th>
	</tr>
	<c:if test="${empty collectList }">
	<tr>
		<td align="center" colspan="4">등록한 컬렉션이 없어요 ༼☯﹏☯༽ </td>
	</tr>
	</c:if>
	<c:forEach var="collect" items="${collectList}">
	<tr>
		<td>
		<fmt:formatDate value="${collect.collDate}" pattern="M/d HH:mm" />
		</td>
	
		<td>${collect.collName}</td>
	
		<td>${collect.collDesc}</td>
	
		<td>수정/삭제</td>
	</tr>
	</c:forEach>
</table>
<button onclick="location.href='newCollection.do'">새 컬렉션</button>
</div>
</body>
</html>