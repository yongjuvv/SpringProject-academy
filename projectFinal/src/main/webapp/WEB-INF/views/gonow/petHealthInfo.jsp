<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
<%@ include file = "gonow.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<h2 class = "text-primary" align = "center">나의 펫 건강</h2>
<table class = "table table-hover">

	<tr><td colspan = "2" align = "center">사용자 : </td><td>${pet.id }</td></tr>
	<tr><td colspan = "2" align = "center">펫 넘버 : </td><td>${pet.petNumber }</td></tr>
	<tr><td colspan = "2" align = "center">펫  건강 : </td><td>${petHealth.petHealth }</td></tr>
	<tr><td colspan = "2" align = "center">펫 심장 박동 : </td><td>${petHealth.petHeartBeat }</td></tr>
	<tr><td colspan = "2" align = "center">펫 온도 : </td><td>${petHealth.petTemp }</td></tr>
	
</table>

</body>
</html>