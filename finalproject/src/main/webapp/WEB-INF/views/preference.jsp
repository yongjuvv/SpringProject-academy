<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<input type="hidden" value="${review.movNum}">
<input type="hidden" value="${review.movGenre1}">
<input type="hidden" value="${review.movGenre2}">
		<h2>${pmember.memName} 님의  취향분석 ▼</h2>
		<table class="table">
			<h1>1. 평점</h1>
			<tr>
				<th>TV평균</th>
				<th>영화평균</th>
				<th>컬렉트</th></tr><p>
			<tr><td><span id=""></span></td>
			<td><span id=""></span></td>
			<td><span id=""></span></td></tr><p>
		</table>

		<table class="table">
			<h1>2. 리뷰</h1>
			<tr>
				<th>리뷰수</th>
				<th>내가 좋아하는 해쉬태그</th>
				<th>기여한 해시태그 비율</th></tr>
			<tr><td><span id="">${preRevieCount} 개</span></td>
				<td><span id=""> </span></td>
				<td><span id="">${preHashPercent} %</span></td></tr><p>
		</table>
		<table class="table">
			<h1>3. 영화</h1>
			<tr>
				<th>선호 장르</th>
				<th>감상 시간</th>
				<th>선호 배우</th>
				<th>선호 감독</th></tr>	
				<tr><td rowspan="1">			
				<c:forEach var="review" items="${preGenre}" end="2">
				<span id="">
				${review.movGenre1}</span>
				</c:forEach>
				</td>
				<td><span id="">${totTime} 시간</span></td>
				<td rowspan="1">			
				<c:forEach var="movie" items="${preAct}" end="2">
				<span id="">
				${movie.personName}</span>
				</c:forEach>
				</td>
				<td rowspan="1">			
				<c:forEach var="movie" items="${preDic}" end="2">
				<span id="">
				${movie.personName}</span>
				</c:forEach>
				</td></tr><p>
				
		</table>
		<p>
</p>
</div>
</body>
</html>