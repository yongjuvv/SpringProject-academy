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
<h2 class = "text-primary" align = "center">나의 펫 목록</h2>
<table class = "table table-striped">



		<tr>
			<td>사용자</td>
			<td>펫 넘버</td>
			<td>펫 이름</td>
			<td>펫 성별</td>
			<td>펫 유형</td>
			<td>펫 나이</td>
		</tr>
		<c:forEach var = "pet" items = "${petList }">
			<tr>
				<td>${pet.id }</td>
				<td><a href = "petInfo.do?petNumber=${pet.petNumber }" class = "btn btn-success btn-sm">${pet.petNumber }</a></td>
				<td>${pet.pet_name }</td>
				<td>${pet.pet_sex }</td>
				<td>${pet.pet_type }</td>
				<td>${pet.pet_age }</td>
			</tr>	
		</c:forEach>
		<%-- <c:forEach var = "pet" items = "${petList }">
		<tr><td>${pet.id }</td><td>${pet.petNumber }</td>
		<td>${pet.pet_name }</td><td>${pet.pet_sex }</td>
		<td>${pet.pet_type }</td><td>${pet.pet_age }</td>
		</tr>
	</c:forEach> --%>
</table>

</body>
</html>