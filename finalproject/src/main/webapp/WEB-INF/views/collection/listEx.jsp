<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../taglib.jsp" %>
<%@ include file="../sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* $(function() {
	$('#addCollectButton').click(function() {
		alert($('#movNum').val());
		var movNum = $('#movNum').val();
		var tvNum = 0;
		$.post("addCollect.do", "movNum="+movNum+"&tvNum="+tvNum, function(data) {
		
		});
	});
}); */
$(function(){
	$('#addCollectButton').click(function() {
		var movNum = $('#movNum').val();
		var tvNum = 0;
		$.post("addToCart.do", "movNum="+movNum+"&tvNum="+tvNum, function(data) {
			alert(data);
		});
	});
});
	
</script>
</head>
<body>
<div class="container">
		<div class="row">
		<input type="text" name="email" value="${email}">
			<c:if test="${not empty searchMovieList || not empty searchTvList }">
				<c:if test="${not empty searchMovieList }">
					<p class="pTitle">영화</p>

					<c:forEach var="movie" items="${searchMovieList}">
						<div class="movie">
							<p>
								<input type="text" id="movNum" value="${movie.movNum}">
								<img alt="이미지"
									src="<%=request.getContextPath()%>/images/${movie.movPic}" width="60" height="120">
								<p>${movie.movName}<br> 
								<button id="addCollectButton">선택</button>
								<button id="deleteCollectButton">삭제</button>
								<!-- onclick="location.href='collect.do'" -->
						</div>

					</c:forEach>
				</c:if>
				<hr>
				<hr>
				
				<hr>
				<hr>
				<c:if test="${not empty searchTvList}">
					<p class="pTitle">TV</p>
					<c:forEach var="tv" items="${searchTvList}">
						<div class="movie">
							<p>
								<img alt="이미지"
									src="<%=request.getContextPath()%>/images/${tv.tvPic}"
									width="120" height="160" onclick="t22(${tv.tvNum})">
							</p>
							${tv.tvName}<br> 
						</div>
					</c:forEach>
				</c:if>
			</c:if>
			<c:if test="${empty searchMovieList && empty searchTvList}">
				<p align="center">검색결과가 없습니다. 다른 검색어를 입력해보세요.
				<p>
			</c:if>
		</div>
	</div>
</body>
</html>