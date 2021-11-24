<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${hashtag1.hashName}</title>
<style type="text/css">
.movie{
	margin : 15px;
	margin-left: 25;
	margin-right: 25px;
	padding : 10px;
 	padding-left : 15;
	height: 150px; 
	float: left;
	font-size: 15px;
}
.tv{
	margin : 15px;
	margin-left: 25;
	margin-right: 25px;
	padding : 10px;
 	padding-left : 15;
	height: 150px; 
	float: left;
	font-size: 15px;
}
.hashtag{
	margin : 15px; 
	margin-left: 25;
	margin-right: 25px;
	padding : 10px; 
 	padding-left : 15;
	height: 150px;
	float: left;
	font-size: 15px;
}
.pTitle{
	font-size: 25px;
	padding-left : 15;
	font-weight: bold;
}
.lTitle{
	font-size: 15px;
	padding-left : 15;
	font-weight: bold;
}

.th.td{
	background-color: white;
	padding: 15px;
	text-align: left;
	border-right: none;
	border-bottom: 1px solid #e4e4e4;
}

.hashname {
	padding-left: 40;
}
</style>
</head>
<body>
<div class="row">
	<section class="hashName">
		<table>
			<tr>
				<th>
					<p>
					다른 사용자들이 선택한<br>
					<span id="selectedhash">#${hashtag1.hashName}</span><br>
					상위 검색 결과
					</p>
				</th>
			</tr>
		</table>
	</section>
<c:if test="${not empty hashMoList }">
 	<p class="pTitle">영화</p>
 
 		<c:forEach var="review" items="${hashMoList}">
 		<div class="movie">
 		<p>
 		<a href="movSearchResult.do?movNum=${review.movNum}">
 				<img
						alt="이미지"
						src="<%=request.getContextPath()%>/images/${review.movPic}"
						width="120" height="160"></a></p>
		<p><a href="movSearchResult.do?movNum=${review.movNum}"><span id="movName">
						${review.movName}
						</span></a><br>
 			<a href="movSearchResult.do?movNum=${review.movNum}">${review.movDate}</a>
 		 </div>
 		</c:forEach>
 </c:if>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
 <c:if test="${not empty hashTvList}">
	 	<p class="pTitle">TV</p>
 		<c:forEach var="review" items="${hashTvList}">
 		 <div class="tv">
 		<p><a href="tvSearchResult.do?tvNum=${review.tvNum}"><img
							alt="이미지"
							src="<%=request.getContextPath()%>>/images/${review.tvPic}"
								width="120" height="160"></a></p>
 			<a href="tvSearchResult.do?tvNum=${review.tvNum}">${review.tvName}</a><br>
 			<a href="tvSearchResult.do?tvNum=${review.tvNum}">${review.tvDate}</a>
 		  </div>
 		 </c:forEach>
 </c:if>
 <c:if test="${empty hashMoList && empty hashTvList}">
	<p align="center"> 검색결과가 없습니다. 다른 검색어를 입력해보세요.<p>
 </c:if>
</div>
<hr>
<hr>
<%@ include file="../commList.jsp"%>
<hr>
<hr>
<%@ include file="../footer.jsp"%>	