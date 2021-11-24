<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해시태그로 찾는 인생영화</title>
<script type="text/javascript">
$(function() {
	$('.TopNavTab').addClass('TopNavTabScroll');
	$('.loginButtonCss').addClass('loginButtonCssScroll');
	$('.NavLogoCss').addClass('NavLogoCssScroll');
	$('.NavBasicFormInput').addClass('NavBasicFormInputScroll');
	$('.InputFormSearch').addClass('InputFormSearchScroll');
});
</script>
<style>
@import url("${path}/css/searchResult.css");
</style>
</head>
<body>
<div class="searchResultPage">
	<div class="NavTapManager_NavContainer">
		<%@include file="../header.jsp" %>
		<section class="NavTapManager_Main">
			<section class="searchResultSection">
				<c:if test="${not empty movieList || not empty tvList }">
				<c:if test="${not empty movieList}">
				<section class="SectionWithHeader">
					<div class="sectionHeaderGrid">
						<div class="sectionRow">
							<header class="SectionWithHeader">
								<h2 class="SectionWithHeader_Title">MOVIE</h2>
								<div class="SectionWithHeader_TopRight">
									<div class="SectionWithViewMore">
										<a class="ViewMoreA">더보기</a>
									</div>
								</div>
							</header>
						</div>
					</div>
					<div class="HorizontalScrollerContainer">
						<div class="SectionContainerGrid">
							<div class="sectionRow">
								<ul class="HorizontalUlWithPosterList">
								<c:forEach var="movie" items="${movieList}">
									<li class="ContentListItemWithPoster">
										<a class="PostContainer" href="movSearchResult.do?movNum=${movie.movNum}">
											<div class="ContentListItemWithPosterBlock">
												<div class="LoadingImage">
													<img
														alt="${movie.movName}" class="LoadingImage_Image"
															src="<%=request.getContextPath()%>/images/${movie.movPic}">
												</div>
											</div>
											<div class="ContentListItemWithPosterContentInfo">
												<div class="SearchResultSection_Title">${movie.movName}</div>
												<div class="SearchResultSection_ExtraInfo">
													<fmt:formatDate	value="${movie.movDate}" pattern="yyyy" /> · ${movie.prod}
												</div>
												<div class="SearchResultSection_Genre">
													${movie.movGenre1}<c:if
																		test="${movie.movGenre2 != null}"> · ${movie.movGenre2 }</c:if>
												</div>
											</div>
										</a>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<hr class="DividerSection">
				</section>
				</c:if>
				<c:if test="${not empty tvList}">
				<section class="SectionWithHeader">
					<div class="sectionHeaderGrid">
						<div class="sectionRow">
							<header class="SectionWithHeader">
								<h2 class="SectionWithHeader_Title">TV</h2>
								<div class="SectionWithHeader_TopRight">
									<div class="SectionWithViewMore">
										<a class="ViewMoreA">더보기</a>
									</div>
								</div>
							</header>
						</div>
					</div>
					<div class="HorizontalScrollerContainer">
						<div class="SectionContainerGrid">
							<div class="sectionRow">
								<ul class="HorizontalUlWithPosterList">
								<c:forEach var="tv" items="${tvList}">
									<li class="ContentListItemWithPoster">
										<a class="PostContainer" href="tvSearchResult.do?tvNum=${tv.tvNum}">
											<div class="ContentListItemWithPosterBlock">
												<div class="LoadingImage">
													<img
														alt="${tv.tvName}" class="LoadingImage_Image"
															src="<%=request.getContextPath()%>/images/${tv.tvPic}">
												</div>
											</div>
											<div class="ContentListItemWithPosterContentInfo">
												<div class="SearchResultSection_Title">${tv.tvName}</div>
												<div class="SearchResultSection_ExtraInfo">
													<fmt:formatDate	value="${tv.tvDate}" pattern="yyyy" /> · ${tv.channel}
												</div>
												<div class="SearchResultSection_Genre">
													${tv.tvGenre}
												</div>
											</div>
										</a>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<hr class="DividerSection">
				</section>
				</c:if>
				</c:if>
				<c:if test="${empty movieList && empty tvList}">
				<section class="SectionWithHeader">
					<div class="sectionHeaderGrid">
						<div class="sectionRow">
							<p class="sectionNoSearchResult">검색결과가 없습니다. 다른 검색어를 입력해보세요.</p>
						</div>
					</div>
					<hr class="DividerSection">
				</section>
				</c:if>
			</section>
		</section>
	</div>
</div>
</body>
</html>