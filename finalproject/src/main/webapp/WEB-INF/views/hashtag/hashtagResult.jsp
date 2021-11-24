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
@import url("${path}/css/hashtagResult.css");
</style>
</head>
<body>
<div class="searchResultPage">
	<div class="NavTapManager_NavContainer">
		<%@ include file="../header.jsp" %>
		<section class="NavTapManager_Main">
			<section class="searchResultSection">
				<section class="SectionWithHeader">
					<div class="sectionHeaderGrid">
						<div class="sectionRow">
							<header class="SectionWithHeader">
									<h2 class="SectionWithHeader_TitleHeader">
										<span class="SectionWithHeader_SmallTitleHeader">
										다른 사용자들이 선택한</span> #${hashtag1.hashName} <span
											class="SectionWithHeader_SmallTitleHeader">상위 검색 결과입니다.</span>
									</h2>
							</header>
						</div>
					</div>
				</section>
				<c:if test="${not empty hashMoList || not empty tvList }">
				<c:if test="${not empty hashMoList }">
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
								<c:forEach var="review" items="${hashMoList}">
									<li class="ContentListItemWithPoster">
										<a class="PostContainer" href="movSearchResult.do?movNum=${review.movNum}">
											<div class="ContentListItemWithPosterBlock">
												<div class="LoadingImage">
													<img
														alt="이미지" class="LoadingImage_Image"
															src="<%=request.getContextPath()%>/images/${review.movPic}">
												</div>
											</div>
											<div class="ContentListItemWithPosterContentInfo">
												<div class="SearchResultSection_Title">${review.movName}</div>
												<div class="SearchResultSection_ExtraInfo">
													<fmt:formatDate	value="${review.movDate}" pattern="yyyy" />
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
				<c:if test="${not empty hashTvList}">
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
								<c:forEach var="review" items="${hashTvList}">
									<li class="ContentListItemWithPoster">
										<a class="PostContainer" href="tvSearchResult.do?tvNum=${review.tvNum}">
											<div class="ContentListItemWithPosterBlock">
												<div class="LoadingImage">
													<img
														alt="이미지" class="LoadingImage_Image"
															src="<%=request.getContextPath()%>>/images/${review.tvPic}">
												</div>
											</div>
											<div class="ContentListItemWithPosterContentInfo">
												<div class="SearchResultSection_Title">${review.tvName}</div>
												<div class="SearchResultSection_ExtraInfo">
													<fmt:formatDate	value="${review.tvDate}" pattern="yyyy" />
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
				<c:if test="${empty hashMoList && empty hashTvList}">
				<section class="SectionWithHeader">
					<div class="sectionHeaderGrid">
						<div class="sectionRow">
							<p class="sectionNoSearchResult"><span class="sectionNoSearchResultHash">#${hashtag1.hashName}</span>가 태그된 영상이 아직 없습니다.</p>
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