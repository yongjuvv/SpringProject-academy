<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${movie.movName}</title>
<script>
function reviewComForm() {
	var reviewNum;
	reviewNum = $('#reviewNum').val();
	location.href = 'commentForm.do?reviewNum='+reviewNum;
}

function sessionChk(num) {
	if ("${email}" == "") {
		alert("로그인이 필요한 서비스예요");
	} else {
		location.href='movPayForm.do?movNum='+num;
	}
}

// 좋아요 기능
function like(num) {	
	if ("${email}" == "") {
		alert("로그인이 필요한 서비스예요");
	} else {
		$.post("reviewLike.do", "reviewNum="+num, function(data) {
			$('#rl_'+num).html(data);
			$('#like_'+num).toggleClass('clickLike');
		});
	}
}

$(function() {
	var bodyOffset = jQuery('body').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > bodyOffset.top) {
			$('.TopNavTab').addClass('TopNavTabScroll');
			$('.loginButtonCss').addClass('loginButtonCssScroll');
			$('.NavLogoCss').addClass('NavLogoCssScroll');
			$('.NavBasicFormInput').addClass('NavBasicFormInputScroll');
			$('.InputFormSearch').addClass('InputFormSearchScroll');
		} else {
			$('.TopNavTab').removeClass('TopNavTabScroll');
			$('.loginButtonCss').removeClass('loginButtonCssScroll');
			$('.NavLogoCss').removeClass('NavLogoCssScroll');
			$('.NavBasicFormInput').removeClass('NavBasicFormInputScroll');
			$('.InputFormSearch').removeClass('InputFormSearchScroll');
		}
	});
	
	$('#insertComm').click(function() {
		$('#modal-title').text($('#movName').val());
		var idx = $(this).index('#insertComm');
		var reNum = $('#reviewNum').eq(idx).val();
		var mNum = $('#movNum').eq(idx).val();
		var tNum = $('#tvNum').eq(idx).val();
		if(tNum=='') tNum=0;
		if(mNum=='') mNum=0;
		$('input[name="reviewNum"]').val(reNum);
		$('input[name="movNum"]').val(mNum);
		$('input[name="tvNum"]').val(tNum);
	});
});
</script>
<style type="text/css">
@import url("${path}/css/movSearchResult.css");
</style>
</head>
<body>
	<!-- HIDDEN -->
	<input type="hidden" id="reviewRate" value="${review.reviewRate}">
	<input type="hidden" name="email" value="${email}">
	<input type="hidden" id="tvNum" value="${tv.tvNum}">
	<input type="hidden" id="movNum" value="${movie.movNum}">
	<input type="hidden" id="movName" value="${movie.movName}">
	<input type="hidden" id="exReviewRate" value="${exReviewRate}">
	<input type="hidden" id="reviewNum" value="${review.reviewNum}">
	<input type="hidden" id="reviewFirstChk" value="${review.reviewFirstChk}">
	
	<div class="root">
		<div class="navTabManager_navContainer">
			<%@ include file="../movieHeader.jsp"%>
			<section class="navTabManager_Main">
				<div class="ContentPage_Content">
					<div class="ContentPage_BackGround">
						<section class="ContentJombotron jumbotron">
							<div class="ContentJombotron_PosterContainer">
								<div class="ContentJombotron_BlurPosterBlock">
									<div class="ContentJombotron_LeftBackGround"></div>
									<div class="ContentJombotron_BlurPoster">
										<div class="ContentJombotron_LeftGradient"></div>
										<div class="ContentJombotron_RightGradient"></div>
									</div>
									<div class="ContentJombotron_RightBackGround"></div>
									<div class="ContentJombotron_DimmedLayer"></div>
								</div>
								<div class="MaxWidthGrid_Poster">
									<div class="ContentJombotron_PosterInfoBlock">
										<div class="LoadingImg">
											<img class="LazyLoadingImg__Image" alt="메가마인드의 포스터"
												data-image-id="154"
												src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_400,q_80,w_280/v1466065454/k671uxwvcbl6dfxsierp.jpg">
										</div>
									</div>
								</div>
							</div>
							<div class="ContentJombotron_Panel">
								<div class="MaxWidthGrid_Panel">
									<div class="MaxWidthGrid_PanelCol">
										<div class="ContentJombotron_PanelInner">
											<span class="ContentJombotron_Title">${movie.movName}</span>
											<div class="ContentJombotron_Detail">
												<fmt:formatDate value="${movie.movDate}" pattern="yyyy" />
												· ${movie.prod} · ${movie.movGrade}
											</div>
											<c:if test="${totRate != null}">
											<div class="ContentJombotron_ContentRating">평점 ★${totRate*0.5}(${everRateCountMovie}명)</div>
											</c:if>
											<div class="ContentJombotron_ButtonBlock">
												<c:if test="${empty pay.payState}">
													<div class="ContentActionButton">
														<input type="button" value="결제하기 (${movie.movPrice}원)"
															onclick="sessionChk(${movie.movNum})"
															class="ContentActionButton_ActionButton">
													</div>
												</c:if>
												<c:if test="${pay.payState == 'y'}">
													<div class="ContentActionButton">
														<input type="button" value="감상하기"
															onclick="location.href='viewMovie.do?movNum=${movie.movNum}'"
															class="ContentActionButton_ActionButton">
													</div>
												</c:if>
											</div>
											<div class="ContentJombotron_RatingControl">
												<div class="ContentJombotron_RatingControl_Title">
													<div class="RatingText">평가하기</div>
												</div>
												<div class="RatingControl">
													<%@ include file="../star.jsp"%>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						<div class="ContentPage_ContentSection">
							<div class="MaxWidthGrid_ContentSection">
								<div class="MaxWidthRow">
									<div class="MaxWidthCol">
										<c:if test="${not empty email}">
											<div class="hiddenComm" id="comm">
												<c:if test="${review.reviewComm==null}">
													<div class="ContentMyCommentSection">
														<div class="RoundedCornerCommentBlock">
															<section class="LeaveCommentSection">
																<div>
																	<div class="LeaveCommentRow">
																		<div class="LeaveCommentBlock">
																			<h3 class="ContentMyCommentSection_Title">이 작품에 대한 ${pmember.nickName} 님의 평가를 글로 남겨보세요.</h3>
																			<div class="ContentMyCommentSection_ButtonBlock">
																				<%@ include file="../review/modalCommentForm.jsp"%>
																				<button type="button"
																					class="ContentMyCommentSection_Button"
																					data-toggle="modal"
																					data-target=".bd-example-modal-lg"
																					style="float: left;" id="insertComm">
																					코멘트 남기기</button>
																			</div>
																		</div>
																	</div>
																</div>
															</section>
														</div>
													</div>
												</c:if>
											</div>
										</c:if>
										<div class="ContentPage_ContentSectionBlock">
											<div class="RoundedCornerContentBlock">
												<section class="SectionWithHeader">
													<div class="SectionWithHeader_Div">
														<div class="SectionWithHeaderRow">
															<header class="SectionWithHeader_Header">
																<h2 class="SectionWithHeader_Title">다른 사용자들이 선택한 해시태그</h2>
															</header>
														</div>
													</div>
													<div class="SectionWithHeader_HashtagGrid">
														<div class="SectionWithHeaderRow">
															<article class="ContentHashtagSection">
																<div class="ContentHashtagSection_List">
																<c:forEach var="hashtagList" items="${hashtagList }">#${hashtagList.hashName}</c:forEach>
																</div>
															</article>
															<hr class="Divider">
														</div>
													</div>
												</section>
												<section class="SectionWithHeader">
													<div class="SectionWithHeader_Div">
														<div class="SectionWithHeaderRow">
															<header class="SectionWithHeader_Header">
																<h2 class="SectionWithHeader_Title">기본 정보</h2>
															</header>
														</div>
													</div>
													<div class="SectionWithHeader_Grid">
														<div class="SectionWithHeaderRow">
															<article class="ContentOverviewSection">
																<div class="ContentOverviewSection_Summery">${movie.movName}<br>
																	<span class="ContentOverviewSection_Meta"><fmt:formatDate
																			value="${movie.movDate}" pattern="yyyy" /> ·
																		${movie.prod} · ${movie.movGrade} · ${movie.movTime}분</span><br>
																	<span class="ContentOverviewSection_Meta">${movie.movGenre1}<c:if
																			test="${movie.movGenre2 != null}"> · ${movie.movGenre2 }</c:if></span>
																</div>
																<div class="TextTruncate">
																	<div class="TextTruncate_Text">${movie.movDesc}</div>
																</div>
															</article>
															<hr class="Divider">
														</div>
													</div>

												</section>
												<section class="SectionWithHeader">
													<div class="SectionWithHeader_Div">
														<div class="SectionWithHeaderRow">
															<header class="SectionWithHeader_Header">
																<h2 class="SectionWithHeader_Title">출연/제작</h2>
															</header>
														</div>
													</div>
													<div class="HorizontalScrollable_ScrollbarContainer">
														<div class="HorizontalScrollable_Scrollbar">
															<div class="HorizontalScrollable_Scrollbar_Inner">
																<div>
																	<div class="SectionWithHeaderRow">
																		<ul class="ContentPeopleSection">
																			<li class="ListItemWithProfilePhoto"><a
																				href="searchResult.do?search=${movie.movDirName}"
																				class="InnerPartOfListWithImage_A">
																					<div class="InnerPartOfListWithImage_ImageBlock">
																						<div class="ProfilePhoto_Movie">
																						<c:if test="${not empty movie.movDirPic}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${movie.movDirPic}">
																							</div>
																						</c:if>
																							<div class="ProfilePhoto_Default">
																								<img class="defaultImage_Profile"
																									src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																									alt="">
																							</div>
																						</div>
																					</div>
																					<div class="InnerPartOfListWithImage_Info">
																						<div class="InnerPartOfListWithImage_Title">
																							<div class="ListItemWithProfilePhoto_Title">${movie.movDirName}</div>
																							<div class="ListItemWithProfilePhoto_Subtitle">감독</div>
																						</div>
																						<div></div>
																					</div>
																			</a></li>
																			<li class="ListItemWithProfilePhoto"><a
																				href="searchResult.do?search=${movie.actName1}"
																				class="InnerPartOfListWithImage_A">
																					<div class="InnerPartOfListWithImage_ImageBlock">
																						<div class="ProfilePhoto_Movie">
																							<c:if test="${not empty movie.actPic1}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${movie.actPic1}">
																							</div>
																							</c:if>
																							<div class="ProfilePhoto_Default">
																								<img class="defaultImage_Profile"
																									src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																									alt="">
																							</div>
																						</div>
																					</div>
																					<div class="InnerPartOfListWithImage_Info">
																						<div class="InnerPartOfListWithImage_Title">
																							<div class="ListItemWithProfilePhoto_Title">${movie.actName1}</div>
																							<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																						</div>
																						<div></div>
																					</div>
																			</a></li>
																			<c:if test="${movie.actName2 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${movie.actName2}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto_Movie">
																								<c:if test="${not empty movie.actPic2}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${movie.actPic2}">
																							</div>
																						</c:if>
																								<div class="ProfilePhoto_Default">
																									<img class="defaultImage_Profile"
																										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																										alt="">
																								</div>
																							</div>
																						</div>
																						<div class="InnerPartOfListWithImage_Info_NoLine">
																							<div class="InnerPartOfListWithImage_Title">
																								<div class="ListItemWithProfilePhoto_Title">${movie.actName2}</div>
																								<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																							</div>
																							<div></div>
																						</div>
																				</a></li>
																			</c:if>
																			<c:if test="${movie.actName3 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${movie.actName3}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto_Movie">
																								<c:if test="${not empty movie.actPic3}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${movie.actPic3}">
																							</div>
																						</c:if>
																								<div class="ProfilePhoto_Default">
																									<img class="defaultImage_Profile"
																										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																										alt="">
																								</div>
																							</div>
																						</div>
																						<div class="InnerPartOfListWithImage_Info">
																							<div class="InnerPartOfListWithImage_Title">
																								<div class="ListItemWithProfilePhoto_Title">${movie.actName3}</div>
																								<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																							</div>
																							<div></div>
																						</div>
																				</a></li>
																			</c:if>
																			<c:if test="${movie.actName4 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${movie.actName4}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto_Movie">
																								<c:if test="${not empty movie.actPic4}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${movie.actPic4}">
																							</div>
																						</c:if>
																								<div class="ProfilePhoto_Default">
																									<img class="defaultImage_Profile"
																										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																										alt="">
																								</div>
																							</div>
																						</div>
																						<div class="InnerPartOfListWithImage_Info">
																							<div class="InnerPartOfListWithImage_Title">
																								<div class="ListItemWithProfilePhoto_Title">${movie.actName4}</div>
																								<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																							</div>
																							<div></div>
																						</div>
																				</a></li>
																			</c:if>
																			<c:if test="${movie.actName5 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${movie.actName5}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto_Movie">
																								<c:if test="${not empty movie.actPic5}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${movie.actPic5}">
																							</div>
																						</c:if>
																								<div class="ProfilePhoto_Default">
																									<img class="defaultImage_Profile"
																										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																										alt="">
																								</div>
																							</div>
																						</div>
																						<div class="InnerPartOfListWithImage_Info_NoLine">
																							<div class="InnerPartOfListWithImage_Title">
																								<div class="ListItemWithProfilePhoto_Title">${movie.actName5}</div>
																								<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																							</div>
																							<div></div>
																						</div>
																				</a></li>
																			</c:if>
																			<c:if test="${movie.actName6 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${movie.actName6}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto_Movie">
																								<c:if test="${not empty movie.actPic6}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${movie.actPic6}">
																							</div>
																						</c:if>
																								<div class="ProfilePhoto_Default">
																									<img class="defaultImage_Profile"
																										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																										alt="">
																								</div>
																							</div>
																						</div>
																						<div class="InnerPartOfListWithImage_Info">
																							<div class="InnerPartOfListWithImage_Title">
																								<div class="ListItemWithProfilePhoto_Title">${movie.actName6}</div>
																								<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																							</div>
																							<div></div>
																						</div>
																				</a></li>
																			</c:if>
																			<c:if test="${movie.actName7 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${movie.actName7}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto_Movie">
																								<c:if test="${not empty movie.actPic7}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${movie.actPic7}">
																							</div>
																						</c:if>
																								<div class="ProfilePhoto_Default">
																									<img class="defaultImage_Profile"
																										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																										alt="">
																								</div>
																							</div>
																						</div>
																						<div class="InnerPartOfListWithImage_Info">
																							<div class="InnerPartOfListWithImage_Title">
																								<div class="ListItemWithProfilePhoto_Title">${movie.actName7}</div>
																								<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																							</div>
																							<div></div>
																						</div>
																				</a></li>
																			</c:if>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
														<div class="arrowButtonA">
															<div class="BackWardButton"></div>
														</div>
														<div class="arrowButtonB">
															<div class="ForwardButton"></div>
														</div>
													</div>
													<div class="SectionLine">
														<div class="SectionWithHeaderRow">
															<hr class="Divider">
														</div>
													</div>
												</section>
												<section class="SectionWithHeader">
													<div class="SectionWithHeader_Div">
														<div class="SectionWithHeaderRow">
															<header class="SectionWithHeader_Header">
																<h2 class="SectionWithHeader_Title">코멘트</h2>
																<span class="TitleForNumber">300+</span>
																<div class="SectionWithHeader_TopRight">
																	<div class="SectionWithViewMore">
																		<a href="viewMoreMovReview.do?movNum=${movie.movNum}">더보기</a>
																	</div>
																</div>
															</header>
														</div>
													</div>
													<div class="HorizontalScrollable_ScrollbarContainer_Comm">
														<div class="HorizontalScrollable_Scrollbar_Comm">
															<div class="HorizontalScrollable_Scrollbar_Inner">
																<div>
																	<div class="SectionWithHeaderRow">
																		<ul class="ContentCommentSection">
																			<c:forEach var="review" items="${movieReviewList}">
																			<input type="hidden" id="likeChk" value="${review.likeChk}">
																			<input type="hidden" name="hashName1" value="${review.hashName1}">
																			<input type="hidden" name="hashName2" value="${review.hashName2}">
																			<input type="hidden" name="hashName3" value="${review.hashName3}">
																				<c:if test="${review.reviewComm != null}">
																				<li class="HorizontalListItem">
																					<div class="BasicCommentItem_Comment">
																						<div class="BasicCommentItem_TitleContainer">
																							<div class="BasicCommentItem_ProfileBlock">
																								<a class="ProfileBlockA" href="otherReviewList.do?email=${review.email}">
																									<div class="ProfilePhoto_RoundedImageBlock">
																										<div class="ProfilePhoto_ProfilePhotoImg"></div>
																										<div class="ProfilePhoto_ProfilePhotoDefault">
																											<img class="defaultImage_ProfileImage"
																												src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																												alt="${review.nickName}의 사진">
																										</div>
																									</div>
																									<div class="UserName">${review.nickName}</div>
																								</a>
																							</div>
																							<div class="BasicCommentItem_UserActionContainer">
																								<img
																									src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM0QTRBNEEiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyIDE3Ljk4bC02LjAxNSA0LjM5MmMtLjUwOC4zNzItMS4xOTQtLjEyNi0uOTk4LS43MjVsMi4zMTctNy4wODEtNi4wMzUtNC4zNjdjLS41MS0uMzY5LS4yNDctMS4xNzUuMzgyLTEuMTc0bDcuNDQ3LjAxNiAyLjI4Ni03LjA5MWMuMTkyLS42IDEuMDQtLjYgMS4yMzMgMGwyLjI4NiA3LjA5IDcuNDQ3LS4wMTVjLjYyOS0uMDAxLjg5LjgwNS4zOCAxLjE3NGwtNi4wMzMgNC4zNjcgMi4zMTYgNy4wOGMuMTk2LjYtLjQ5IDEuMDk4LS45OTkuNzI2TDEyIDE3Ljk4eiIvPgo8L3N2Zz4K"
																									width="16px" height="16px" class="userStar"
																									alt="star"> <span>${review.reviewRate*0.5}</span>
																							</div>
																						</div>
																						<div class="BasicCommentItem_TextBlock">
																							<c:url var="url" value="reviewDetail.do?reviewNum=${review.reviewNum}"></c:url>
																							<a href="${url}" style="color: #000;">
																								<div class="TextTruncate_Comm">
																									<div class="TextTruncate_Comm_Text">${review.reviewComm}</div>
																								<div class="ReviewHashtag">
																									#${review.hashName1 }<br>
																									<c:if test="${review.hashName2!=null }">
																									#${review.hashName2 }<br>
																									</c:if>
																									<c:if test="${review.hashName3!=null }">
																									#${review.hashName3 }
																									</c:if>
																								</div>
																								</div>
																							</a>
																						</div>
																						<div class="CommentItem_LikeReplyBlock">
																							<span class="CommentItem_LikeImage">
																							<img
																								src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzc4Nzg3OCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02Ljc1IDkuNDg1aC0zYTEgMSAwIDAgMC0xIDF2MTBhMSAxIDAgMCAwIDEgMWgzYTEgMSAwIDAgMCAxLTF2LTEwYTEgMSAwIDAgMC0xLTFNMjAuNjU3IDguNTY2YTIuMzYzIDIuMzYzIDAgMCAwLTEuNzc5LS44MTNIMTYuNjJsLjE2NC0uNjI3Yy4xMzctLjUyOC4yMDEtMS4xMi4yMDEtMS44NjMgMC0xLjkxOS0xLjM3NS0yLjc3OC0yLjczOC0yLjc3OC0uNDQ0IDAtLjc2Ni4xMjMtLjk4Ni4zNzYtLjIuMjI3LS4yODIuNTMtLjI0My45MzVsLjAzIDEuMjMtMi45MDMgMi45NGMtLjU5My42LS44OTQgMS4yMy0uODk0IDEuODcydjkuNjQ3YS41LjUgMCAwIDAgLjUuNWg3LjY4N2EyLjM4OCAyLjM4OCAwIDAgMCAyLjM0OC0yLjA3bDEuNDQ1LTcuNDUyYTIuNDQgMi40NCAwIDAgMC0uNTc0LTEuODk3Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																								width="18px" height="18px"></span> <em id="rl_${review.reviewNum }">${review.reviewLike}</em>
																							<span class="CommentItem_ReplyImage">
																							<img
																								src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM3ODc4NzgiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTkuODU3IDE3Ljc4Nkw2IDIxdi00LjkxYy0xLjg0MS0xLjM3My0zLTMuMzY5LTMtNS41OUMzIDYuMzU4IDcuMDMgMyAxMiAzczkgMy4zNTggOSA3LjVjMCA0LjE0Mi00LjAzIDcuNS05IDcuNS0uNzM5IDAtMS40NTYtLjA3NC0yLjE0My0uMjE0eiIvPgo8L3N2Zz4K"
																								width="18px" height="18px"></span> <em>${replycount}</em>
																						</div>
																						<div class="CommentItem_UserActionBlock">
																							<button class="likebtn" onclick="like(${review.reviewNum})">
																								<c:choose>
																								<c:when test = "${review.likeChk == 0}">
																								<span id="like_${review.reviewNum}" class="like">좋아요</span>
																								</c:when>
																								<c:when test = "${review.likeChk == 1}">
																								<span id="like_${review.reviewNum}" class="clickLike like">좋아요</span>
																								</c:when>
																								</c:choose>
																							</button>
																						</div>
																					</div>
																					</li>
																				</c:if>
																			</c:forEach>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
														<div class="arrowButtonA" direction="left">
															<div class="BackWardButton"></div>
														</div>
														<div class="arrowButtonB" direction="right">
															<div class="ForwardButton"></div>
														</div>
													</div>
													<div class="SectionLine">
														<div class="SectionWithHeaderRow">
															<hr class="Divider">
														</div>
													</div>
												</section>
											</div>
										</div>
									</div>
								</div>
								<div class="MaxWidthColRight">
										<section class="ContentChartSection">
											<div class="ChartCard">
												<h3 class="ChartCard_Title">[추천] Hot 해시태그</h3>
												<section class="ChartCard_ContentSection">
													<c:if test="${not empty recomHashList}">
															<div class="tableRow">
															<table class="table">
																	<tr>
																		<th>#</th>
																		<th>누적클릭횟수</th>
																	</tr>
																	<c:forEach var="hashtag" items="${recomHashList}">
																		<p>
																		<tr>
																			<td class="bd1"><a
																				href="hashtagResult.do?hashNum=${hashtag.hashNum}">${hashtag.hashName}</a></td>
																			<td class="bd1"><a
																				href="hashtagResult.do?hashNum=${hashtag.hashNum}">${hashtag.clickCount}</a></td>
																		</tr>
																	</c:forEach>
																</table>
															</div>
															</c:if>
													
												</section>
											</div>
										</section>
										<section class="ContentChartSection">
											<div class="ChartCard">
												<h3 class="ChartCard_Title">[추천] Hot 영화리스트</h3>
												<section class="ChartCard_ContentSection">
												
														<c:if test="${not empty recomMovList}">
															<table class="table">
																<tr>
																	<th>제목</th>
																	<th>장르</th>
																</tr>
																<c:forEach var="movie" items="${recomMovList}">
																	<p>
																	<tr>
																		<td><a
																			href="movSearchResult.do?movNum=${movie.movNum}">${movie.movName}</a></td>
																		<td><a
																			href="movSearchResult.do?movNum=${movie.movNum}">${movie.movGenre1}</a></td>
																	</tr>
																</c:forEach>
															</table>
														</c:if>
												
												</section>
											</div>
										</section>
										<section class="ContentChartSection">
											<div class="ChartCard">
												<h3 class="ChartCard_Title">[추천] Hot 영상리스트</h3>
												<section class="ChartCard_ContentSection">
													
														<c:if test="${not empty recomTvList}">
															<table class="table">
																<tr>
																	<th>제목</th>
																	<th>장르</th>
																</tr>
																<c:forEach var="tv" items="${recomTvList}">
																	<p>
																	<tr>
																		<td><a href="tvSearchResult.do?tvNum=${tv.tvNum}">${tv.tvName}</a></td>
																		<td><a href="tvSearchResult.do?tvNum=${tv.tvNum}">${tv.tvGenre}</a></td>
																	</tr>
																</c:forEach>
															</table>
														</c:if>
											
												</section>
											</div>
										</section>
									</div>
								
							
						
							</div>
						</div>

					</div>
					
			<footer class="Footer">
				<div class="MaxWidthGridFooter">
					<section class="FooterSection">
						<div class="FooterContainer">
							<div class="Footer_RatingSummery">
								지금까지 <em class="HashCount">${count}개의 #해시태그가 </em>쌓였어요.
							</div>
							<ul class="Footer_FrogramsInfo">
								<li class="Footer_FrogramsInfoList">
									사업자 등록 번호 <span>(123-45-67890)</span>
								</li>
								<li class="Footer_FrogramsInfoList">
									고객센터 <span>cs@hash.tag</span>
								</li>
							</ul>
							<ul class="Footer_FrogramsInfoUnder">
								<span class="Footer_FooterLogo">HASHTAG</span>
								<li class="Footer_FrogramsInfoList">
									© 2018–2019 by Hashtag. Inc
								</li>
							</ul>
						</div>
					</section>
				</div>
			</footer>
				</div>
			</section>
		</div>
	</div>
</body>
</html>