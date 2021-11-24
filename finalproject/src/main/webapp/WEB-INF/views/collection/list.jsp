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
function addCollect(mv) {
	var tvNum = 0;
	$.post("addToCart.do", "movNum="+mv+"&tvNum="+tvNum, function(data) {
		$('#addedCollectUl').append(data);
	});
}

/* $(function(){
	$('#addCollectButton').click(function() {
		var movNum = $('#movNum').val();
		var tvNum = 0;
		alert(movNum);
		$.post("addToCart.do", "movNum="+movNum+"&tvNum="+tvNum, function(data) {
			alert('선택되었습니다');
		});
	});
}); */
	
</script>
<style>
.cartListUl{
	list-style: none;
    padding: 0;
    margin: 0;
}
.HorizontalScrollerContainer{
	position: relative;
    -webkit-transform: translate3d(0,0,0);
    -ms-transform: translate3d(0,0,0);
    transform: translate3d(0,0,0);
}
.DividerSection{
	margin: 0 20px;
	border: 0;
    border-bottom: 1px solid #f0f0f0;
    box-sizing: content-box;
    height: 0;
    overflow: visible;
}
.SectionContainerGrid{
	
}
.HorizontalUlWithPosterList{
	margin: 14px 0 0;
	white-space: nowrap;
    margin-right: -5px !important;
    margin-left: -5px !important;
    list-style: none;
    padding: 0;
}
.ContentListItemWithPoster{
	width: 13%;
	display: inline-block;
    vertical-align: top;
    box-sizing: border-box;
    padding: 0 5px;
    margin: 0 0 24px;
    list-style: none;
}
.PostContainer{
	display: inline-block;
    text-decoration: none;
    width: 100%;
    background-color: transparent;
}
.ContentListItemWithPosterBlock{
	position: relative;
    width: 100%;
    height: 0;
    padding-bottom: 144.76190476190476%;
}
.LoadingImage{
	position: relative;
	background: #f8f8f8;
    overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    box-sizing: border-box;
    width: 100%;
    height: 100%;
    border: solid 1px rgba(0,0,0,0.08);
    border-radius: 3px;
}
.LoadingImage_Image{
	vertical-align: top;
    width: 100%;
    height: 100%;
    opacity: 1;
    object-fit: cover;
    border-style: none;
}
.ContentListItemWithPosterContentInfo{
	text-align: center;
    margin: 8px 0 0;
}
.SearchResultSection_Title{
	font-size: 15px;
    font-weight: 400;
    -webkit-letter-spacing: -0.5px;
    -moz-letter-spacing: -0.5px;
    -ms-letter-spacing: -0.5px;
    letter-spacing: -0.5px;
    line-height: 20px;
    color: #1f1f1f;
    overflow: hidden;
    text-overflow: ellipsis;
    text-align: center;
}
.SearchResultSection_ExtraInfo{
	font-size: 13px;
    font-weight: 400;
    -webkit-letter-spacing: -0.2px;
    -moz-letter-spacing: -0.2px;
    -ms-letter-spacing: -0.2px;
    letter-spacing: -0.2px;
    line-height: 18px;
    color: #a0a0a0;
    overflow: hidden;
    text-overflow: ellipsis;
    text-align: left;
}
.SearchResultSection_Genre{
	font-size: 12px;
    font-weight: 400;
    -webkit-letter-spacing: -0.2px;
    -moz-letter-spacing: -0.2px;
    -ms-letter-spacing: -0.2px;
    letter-spacing: -0.2px;
    line-height: 16px;
    color: #a0a0a0;
    overflow: hidden;
    text-overflow: ellipsis;
    text-align: left;
}
.sectionNoSearchResult{
	text-align: center;
	font-size: 15px;
	margin: 50px;
}
.buttonContainer{

}
</style>
</head>
<body>
	<input type="hidden" name="email" value="${email}">
	<c:if test="${not empty searchMovieList || not empty searchTvList }">
	<c:if test="${not empty searchMovieList }">
	<div class="HorizontalScrollerContainer">
		<div class="SectionContainerGrid">
			<div class="sectionRow">
				<ul class="HorizontalUlWithPosterList">
					<c:forEach var="movie" items="${searchMovieList}">
						<input type="hidden" id="movNum" value="${movie.movNum}">
						<input type="hidden" id="movName" value="${movie.movName}">
						<input type="hidden" id="movPic" value="${movie.movPic}">
						<li class="ContentListItemWithPoster">
								<div class="ContentListItemWithPosterBlock">
									<div class="LoadingImage">
										<img alt="${movie.movName}" class="LoadingImage_Image"
											src="<%=request.getContextPath()%>/images/${movie.movPic}">
									</div>
								</div>
								<div class="ContentListItemWithPosterContentInfo">
									<div class="SearchResultSection_Title">${movie.movName}</div>
									<%-- <div class="SearchResultSection_ExtraInfo">
										<fmt:formatDate value="${movie.movDate}" pattern="yyyy" />
										· ${movie.prod}
									</div> --%>
								</div>
								<div class="buttonContainer">
									<button id="addCollectButton" class="searchButtonCss" onclick="addCollect(${movie.movNum})">선택</button>
								</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	</c:if>
	</c:if>
	<c:if test="${empty searchMovieList && empty searchTvList}">
			<p align="center">검색결과가 없습니다. 다른 검색어를 입력해보세요.
	</c:if>
	




	<%-- <div class="container">
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
	</div> --%>
</body>
</html>