<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 class = "text-primary" align = "center">${pet.petNumber }의 건강 정보</h2>
<div class = "container" align = "center">
<table class = "table table-striped">
	<tr><td colspan = "2" align = "center">사용자  : ${petHealth.id }</td></tr>
	<tr><td colspan = "2" align = "center">펫 넘버 : ${petHealth.petNumber }</td></tr>
	<tr><td colspan = "2" align = "center">펫 건강 : ${petHealth.petHealth }</td></tr>
	<tr><td colspan = "2" align = "center">펫 심장박동 : ${petHealth.petHeartBeat }</td></tr>
	<tr><td colspan = "2" align = "center">펫 온도 : ${petHealth.petTemp }</td></tr>

<%-- <c:forEach var = "petHealth" items = "${petHealth }"> --%>
<%-- <tr><td>${petHealth.id }</td><td>${petHealth.petNumber }</td>
<td>${petHealth.petHealth }</td><td>${petHealth.petHeartBeat }</td>
<td>${petHealth.petTemp }</td>
</tr>
 --%>
<%-- </c:forEach> --%>
</table>
<a href = "myPetList.do" class = "btn btn-success">나의펫 목록</a>
</div>


</body>
</html>