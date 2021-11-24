<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
@import url("${path}/css/myHashtag.css");
</style>
</head>
<body>
<div class="MyPreference">
	<div class="NavTabManager_NavContainer">
		<%@ include file="../header.jsp" %>
		<section class="NavTabManager_Main">
			<div class="UserAnalysisPage">
				<div class="UserAnalysisPage_Background"></div>
				<div class="UserAnalysisPage_MaxGrid">
					<div class="UserAnalysisPage_RoundedCornerBlock">
						<div class="UserAnalysisPage_AnalysisHeaderBackground"></div>
						<header class="UserAnalysisPage_AnalysisHeader">
							<div class="UserAnalysisPage_AnalysisHeaderGrid">
								<div class="AnalysisHeaderRow">
									<div class="UserAnalysisPage_LogoContainer">
										<span class="UserAnalysisPage_Logo">HASHTAG</span>
									</div>
									<h1 class="UserAnalysisPage_AnalysisTitle">
										<span class="UserAnalysisPage_AnalysisWord">취향분석</span>
										<div class="ProfilePhotoBlock">
											<div class="ProfilePhoto_ProfilePhotoImage"></div>
											<div class="ProfilePhoto_DefaultImageContainer">
												<img class="defaultImage__ProfileImg" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" alt="">
											</div>
										</div>
										<div class="UserAnalysisPage_UserName">${pmember.nickName}</div>
									</h1>
								</div>
							</div>
						</header>
					</div>
					<div class="UserAnalysisPage_AnalysisRoundedCornerBlock">
						<section class="AnalysisSectionWithHeader">
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<header class="AnalysisSectionWithHeader_Header">
										<h2 class="AnalysisSectionWithHeaderTitle">평가한 해시태그 수</h2>
									</header>
								</div>
							</div>
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<div class="UserAnalysisPage_CategorySumContainer">
										<ul class="UserAnalysisPage_StatSumUl">
											<li class="StatSumList" style="float: left">
												<div class="StatSumList_Title">#${countMovie}</div>
												<div class="StatSumList_SubTitle">영화</div>
											</li>
											<li class="StatSumList">
												<div class="StatSumList_Title">#${countTv}</div>
												<div class="StatSumList_SubTitle">TV</div>
											</li>
										</ul>
										<hr class="AnalysisSection_Divider">
									</div>
								</div>
							</div>
						</section>
						<section class="AnalysisSectionWithHeader_Rating">
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<header class="AnalysisSectionWithHeader_Header">
										<h2 class="AnalysisSectionWithHeaderTitle">별점 분포</h2>
									</header>
								</div>
							</div>
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<div class="RatingStat">
										<div class="RatingStat_BarContainer">
											<img alt="" class="ProfilePhoto_Image"
												src="<%=request.getContextPath()%>/image/${email}RateGraph.png">
										</div>
									</div>
									<div class="RatintStat_SumContainer">
										<ul class="UserAnalysisPage_StatSumUl">
											<li class="StatSumListThree" style="float: left">
												<div class="StatSumList_Title">${rateAvg }</div>
												<div class="StatSumList_SubTitle">별점 평균</div>
											</li>
											<li class="StatSumListThree" style="float: left">
												<c:if test=""></c:if>
												<div class="StatSumList_Title">${rateCnt }</div>
												<div class="StatSumList_SubTitle">별점 개수</div>
											</li>
											<li class="StatSumListThree">
												<div class="StatSumList_Title">${mostRating }</div>
												<div class="StatSumList_SubTitle">많이 준 별점</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</section>
					</div>
					<div class="UserAnalysisPage_AnalysisRoundedCornerBlock">
						<section class="AnalysisSectionWithHeader">
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<header class="AnalysisSectionWithHeader_Header">
										<h2 class="AnalysisSectionWithHeaderTitle">기여한 해시태그 비율</h2>
									</header>
								</div>
							</div>
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<c:if test="${preHashPercent != null}">
									<h3 class="UserAnalysisPage_HashTagRate">${preHashPercent} %</h3>
									</c:if>
									<c:if test="${preHashPercent == null}">
									<h3 class="UserAnalysisPage_HashTagRate">아직 해시태그를 남긴 적이 없어요</h3>
									</c:if>
									<hr class="AnalysisSection_Divider">
								</div>
							</div>
						</section>
						<section class="AnalysisSectionWithHeader_Rating">
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<header class="AnalysisSectionWithHeader_Header">
										<h2 class="AnalysisSectionWithHeaderTitle">선호 해시태그</h2>
									</header>
								</div>
							</div>
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<div class="HashTagCloud">
										<div style="color: rgba(0, 0, 0, 1); width: 500px; height: 250px;">
											<img alt="" class="wordCloudImage"
												src="<%=request.getContextPath()%>/image/${email}Wordcloud.png">
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
					<div class="UserAnalysisPage_AnalysisRoundedCornerBlock">
						<section class="AnalysisSectionWithHeader">
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<header class="AnalysisSectionWithHeader_Header">
										<h2 class="AnalysisSectionWithHeaderTitle">영화 선호장르</h2>
									</header>
								</div>
							</div>
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<div class="UserAnalysisPage_CategorySumContainer">
										<ul class="UserAnalysisPage_StatSumUl">
											<!-- <li class="StatSumListThree" style="float: left">
												<div class="StatSumList_Title">드라마</div>
											</li>
											<li class="StatSumListThree" style="float: left">
												<div class="StatSumList_Title">가족</div>
											</li>
											<li class="StatSumListThree">
												<div class="StatSumList_Title">액션</div>
											</li> -->
											<c:forEach var="review" items="${preGenre}" end="2">
											<li class="StatSumListThree">
												<div class="StatSumList_Title">${review.movGenre1}</div>
											</li>
											</c:forEach>
										</ul>
										<hr class="AnalysisSection_Divider">
									</div>
								</div>
							</div>
						</section>
						<section class="AnalysisSectionWithHeader">
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<header class="AnalysisSectionWithHeader_Header">
										<h2 class="AnalysisSectionWithHeaderTitle">영화 감상시간</h2>
									</header>
								</div>
							</div>
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<h3 class="UserAnalysisPage_HashTagRate">${totTime} 시간</h3>
									<hr class="AnalysisSection_Divider">
								</div>
							</div>
						</section>
						<section class="AnalysisSectionWithHeader">
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<header class="AnalysisSectionWithHeader_Header">
										<h2 class="AnalysisSectionWithHeaderTitle">선호배우</h2>
									</header>
								</div>
							</div>
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<div class="UserAnalysisPage_CategorySumContainer">
										<ul class="UserAnalysisPage_StatSumUl">
											<c:forEach var="movie" items="${preAct}" end="2">
											<li class="StatSumListThree">
												<div class="StatSumList_Title">
														<a href="searchResult.do?search=${movie.personName}"
															class="InnerPartOfListWithImage_A">
															<div class="InnerPartOfListWithImage_ImageBlock">
																<div class="ProfilePhoto">
																	<div class="ProfilePhoto_Img"></div>
																	<div class="ProfilePhoto_Default">
																		<img class="defaultImage_Profile"
																			src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																			alt="">
																	</div>
																</div>
															</div>
															<div class="InnerPartOfListWithImage_Info">
																<div class="InnerPartOfListWithImage_Title">
																	<div class="ListItemWithProfilePhoto_Title">${movie.personName}</div>
																	<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																</div>
																<div></div>
															</div>
														</a>
													</div>
												</li>
												</c:forEach>
										</ul>
										<hr class="AnalysisSection_Divider">
									</div>
								</div>
							</div>
						</section>
						<section class="AnalysisSectionWithHeader">
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<header class="AnalysisSectionWithHeader_Header">
										<h2 class="AnalysisSectionWithHeaderTitle">선호감독</h2>
									</header>
								</div>
							</div>
							<div class="AnalysisSectionWithHeaderGrid">
								<div class="AnalysisSectionWithHeaderRow">
									<div class="UserAnalysisPage_CategorySumContainer">
										<ul class="UserAnalysisPage_StatSumUl">
											<c:forEach var="movie" items="${preDic}" end="2">
											<li class="StatSumListThree">
												<div class="StatSumList_Title">
														<a href="searchResult.do?search=${movie.personName}"
															class="InnerPartOfListWithImage_A">
															<div class="InnerPartOfListWithImage_ImageBlock">
																<div class="ProfilePhoto">
																	<div class="ProfilePhoto_Img"></div>
																	<div class="ProfilePhoto_Default">
																		<img class="defaultImage_Profile"
																			src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																			alt="">
																	</div>
																</div>
															</div>
															<div class="InnerPartOfListWithImage_Info">
																<div class="InnerPartOfListWithImage_Title">
																	<div class="ListItemWithProfilePhoto_Title">${movie.personName}</div>
																	<div class="ListItemWithProfilePhoto_Subtitle">감독</div>
																</div>
																<div></div>
															</div>
														</a>
													</div>
												</li>
												</c:forEach>
										</ul>
										<hr class="AnalysisSection_Divider">
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
</body>
</html>