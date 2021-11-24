<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${tv.tvName}</title>
<script>
function reviewComForm() {
	var reviewNum;
	reviewNum = $('#reviewNum').val();
	location.href = 'commentForm.do?reviewNum=' + reviewNum;
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
		$('#modal-title').text($('#tvName').val());
		var idx = $(this).index('#insertComm');
		var reNum = $('#reviewNum').eq(idx).val();
		var mNum = $('#movNum').eq(idx).val();
		var tNum = $('#tvNum').eq(idx).val();
		if(tNum=='')tNum=0;
		if(mNum=='')mNum=0;
		$('input[name="reviewNum"]').val(reNum);
		$('input[name="movNum"]').val(mNum);
		$('input[name="tvNum"]').val(tNum);
	});
});
	
function ch() {
	$('#button').removeClass('hidden');
	$('#firstEpChoice').hide();
	 var tvNum = $('#tvNum').val();
	 var tvEpNum = $('#chkep').val();
	$('#show').text('EPISODE'+$('#chkep').val()); 
	$.post("tvPayConfirm.do","tvNum="+tvNum+"&tvEpNum="+tvEpNum, function(data) {
		if(data == '1') {
				$('#playButton').show(); 
				$('#payButton').hide();				
		}
		else if(data == '0'){
			$('#playButton').hide(); 
			$('#payButton').show();				
		}
	});
}
	
function payFormClick() {
	if ("${email}" == "") {
		alert("로그인이 필요한 서비스예요");
	} else {
	var ten = $('#chkep').val();
	var tn = $('#tvNum').val();
	location.href='tvPayForm.do?tvNum='+tn+'&tvEpNum='+ten;
	}
}
	
function viewTvClick() {
	if ("${email}" == "") {
		alert("로그인이 필요한 서비스예요");
	} else {
	var ten = $('#chkep').val();
	var tn = $('#tvNum').val();
	location.href='viewTv.do?tvNum='+tn+'&tvEpNum='+ten;
	}
}
</script>
<style type="text/css">
@import url("${path}/css/tvSearchResult.css");
</style>
</head>
<body>
	<!-- HIDDEN -->
	<input type="hidden" id="reviewRate" value="${review.reviewRate}">
	<input type="hidden" name="email" value="${email}">
	<input type="hidden" id="tvNum" value="${tv.tvNum}">
	<input type="hidden" id="movNum" value="${movie.movNum}">
	<input type="hidden" id="tvName" value="${tv.tvName}">
	<input type="hidden" id="exReviewRate" value="${exReviewRate}">
	<input type="hidden" id="reviewNum" value="${review.reviewNum}">
	<input type="hidden" id="reviewFirstChk" value="${review.reviewFirstChk}">
	
	<div class="root">
		<div class="navTabManager_navContainer">
			<%@ include file="../header.jsp"%>
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
											<img class="LazyLoadingImg__Image" alt="윤식당의 포스터" data-image-id="5" src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_400,q_80,w_280/v1507076943/fyepvg0iikry39niotjw.jpg">
										</div>
									</div>
								</div>
							</div>
							<div class="ContentJombotron_Panel">
								<div class="MaxWidthGrid_Panel">
									<div class="MaxWidthGrid_PanelCol">
										<div class="ContentJombotron_PanelInner">
											<span class="ContentJombotron_Title">${tv.tvName} <span id="show" style="font-size: 20px;"></span></span>
											<div class="ContentJombotron_Detail">
												<fmt:formatDate value="${tv.tvDate}" pattern="yyyy" />
												· ${tv.channel} · ${tv.tvGrade}
											</div>
											<div class="ContentJombotron_ContentRating">평점 ★${totRate*0.5}(${everRateCountTv}명)</div>
											<div class="ContentJombotron_ButtonBlock">
												<%-- <c:if test="${empty pay.payState}"> --%>
													<div class="ContentActionButton" id="firstEpChoice">
														<button type="button" class="ContentActionButton_ActionButton" data-toggle="modal" data-target=".bd-example-modal-sm" style="float: left;">
															에피소드 선택하기
														</button>
														<button type="button" class="ContentActionButton_ActionDropDownButton" data-toggle="modal" data-target=".bd-example-modal-sm" style="float: left;">
															<svg class="ArrowDropDown__ArrowDropDownSvg-s1q43qr1-0" width="24" height="24" viewBox="0 0 24 24"><path fill="#FFF" fill-rule="evenodd" d="M12 16l6-6H6z"></path></svg>
														</button>
													</div>
													<div id="button" class="hidden">
													<div class="ContentActionButton">
														<input type="button" value="결제하기" id="payButton"
															onclick="payFormClick()"
															class="ContentActionButton_ActionButton">
														<input type="button" value="감상하기" id="playButton"
															onclick="viewTvClick()"
															class="ContentActionButton_ActionButton">
											
														<button type="button" class="ContentActionButton_ActionDropDownButton" data-toggle="modal" data-target=".bd-example-modal-sm" style="float: left;">
															<svg class="ArrowDropDown__ArrowDropDownSvg-s1q43qr1-0" width="24" height="24" viewBox="0 0 24 24"><path fill="#FFF" fill-rule="evenodd" d="M12 16l6-6H6z"></path></svg>
														</button>
													</div>
													</div>
														<div class="modal fade bd-example-modal-sm" tabindex="-1"
															role="dialog" aria-labelledby="mySmallModalLabel"
															aria-hidden="true">
															<div class="modal-dialog modal-sm">
																<div class="modal-content">
																	<div class="modal-header" id="epModalBorderLine">
																		<h5 class="modal-title" style="font-size: 20px;">에피소드 선택</h5>
																	</div>
																	<div class="modal-body">
																		<select name="tvEpNum" id="chkep" class="EpSelectBox">
																			<c:forEach var="tvep" items="${tvEpList}">
																				<option value="${tvep.tvEpNum}">EPISODE
																					${tvep.tvEpNum} (${tvep.tvEpPrice}원)</option>
																			</c:forEach>
																		</select>
																	</div>
																	<div class="modal-footer" id="epModalFooterBorderLine">
																		<button type="button" class="EpChoiceButton" id="ep"
																			onclick="ch()" data-dismiss="modal">선택</button>
																		<button type="button" class="EpChoiceButton"
																			data-dismiss="modal">닫기</button>
																	</div>
																</div>
															</div>
														</div>
													
												<%-- </c:if> --%>
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
																			<h3 class="ContentMyCommentSection_Title">이 작품에
																				대한 ${pmember.nickName} 님의 평가를 글로 남겨보세요.</h3>
																			<div class="ContentMyCommentSection_ButtonBlock">
																				<%@ include file="../review/modalCommentForm.jsp"%>
																				<button type="button"
																					class="ContentMyCommentSection_Button"
																					data-toggle="modal"
																					data-target=".bd-example-modal-lg"
																					style="float: left;" id="insertComm">코멘트
																					남기기</button>
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
																<c:forEach var="hashtagList" items="${hashtagList}">#${hashtagList.hashName}</c:forEach>
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
																<div class="ContentOverviewSection_Summery">${tv.tvName}<br>
																	<span class="ContentOverviewSection_Meta"><fmt:formatDate
																			value="${tv.tvDate}" pattern="yyyy" /> ·
																		${tv.channel} · ${tv.tvGrade} · 에피소드 ${tv.totEp}개</span><br>
																	<span class="ContentOverviewSection_Meta">${tv.tvGenre}</span>
																</div>
																<div class="TextTruncate">
																	<div class="TextTruncate_Text">${tv.tvDesc}</div>
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
																				href="searchResult.do?search=${tv.tvDirName}"
																				class="InnerPartOfListWithImage_A">
																					<div class="InnerPartOfListWithImage_ImageBlock">
																						<div class="ProfilePhoto">
																							<c:if test="${not empty tv.tvDirPic}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${tv.tvDirPic}">
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
																							<div class="ListItemWithProfilePhoto_Title">${tv.tvDirName}</div>
																							<div class="ListItemWithProfilePhoto_Subtitle">감독</div>
																						</div>
																						<div></div>
																					</div>
																			</a></li>
																			<li class="ListItemWithProfilePhoto"><a
																				href="searchResult.do?search=${tv.actName1}"
																				class="InnerPartOfListWithImage_A">
																					<div class="InnerPartOfListWithImage_ImageBlock">
																						<div class="ProfilePhoto">
																							<c:if test="${not empty tv.actPic1}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${tv.actPic1}">
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
																							<div class="ListItemWithProfilePhoto_Title">${tv.actName1}</div>
																							<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																						</div>
																						<div></div>
																					</div>
																			</a></li>
																			<c:if test="${tv.actName2 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${tv.actName2}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto">
																								<c:if test="${not empty tv.actPic2}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${tv.actPic2}">
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
																								<div class="ListItemWithProfilePhoto_Title">${tv.actName2}</div>
																								<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																							</div>
																							<div></div>
																						</div>
																				</a></li>
																			</c:if>
																			<c:if test="${tv.actName3 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${tv.actName3}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto">
																								<c:if test="${not empty tv.actPic3}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${tv.actPic3}">
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
																								<div class="ListItemWithProfilePhoto_Title">${tv.actName3}</div>
																								<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																							</div>
																							<div></div>
																						</div>
																				</a></li>
																			</c:if>
																			<c:if test="${tv.actName4 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${tv.actName4}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto">
																								<c:if test="${not empty tv.actPic4}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${tv.actPic4}">
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
																								<div class="ListItemWithProfilePhoto_Title">${tv.actName4}</div>
																								<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																							</div>
																							<div></div>
																						</div>
																				</a></li>
																			</c:if>
																			<c:if test="${tv.actName5 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${tv.actName5}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto">
																								<c:if test="${not empty tv.actPic5}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${tv.actPic5}">
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
																								<div class="ListItemWithProfilePhoto_Title">${tv.actName5}</div>
																								<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																							</div>
																							<div></div>
																						</div>
																				</a></li>
																			</c:if>
																			<c:if test="${tv.actName6 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${tv.actName6}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto">
																								<c:if test="${not empty tv.actPic6}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${tv.actPic6}">
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
																								<div class="ListItemWithProfilePhoto_Title">${tv.actName6}</div>
																								<div class="ListItemWithProfilePhoto_Subtitle">배우</div>
																							</div>
																							<div></div>
																						</div>
																				</a></li>
																			</c:if>
																			<c:if test="${tv.actName7 != null}">
																				<li class="ListItemWithProfilePhoto"><a
																					href="searchResult.do?search=${tv.actName7}"
																					class="InnerPartOfListWithImage_A">
																						<div class="InnerPartOfListWithImage_ImageBlock">
																							<div class="ProfilePhoto">
																								<c:if test="${not empty tv.actPic7}">
																							<div class="ProfilePhoto_Img">
																								<img alt="" class="ProfilePhoto_Image"
																									src="<%=request.getContextPath()%>/person/${tv.actPic7}">
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
																								<div class="ListItemWithProfilePhoto_Title">${tv.actName7}</div>
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
																		<a href="viewMoreTvReview.do?tvNum=${tv.tvNum}" 
																			style="color: #BD24A9;">더보기</a>
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
																			<c:forEach var="review" items="${tvReviewList}">
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
																							<c:url var="url"
																								value="reviewDetail.do?reviewNum=${review.reviewNum}"></c:url>
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
																							<span class="CommentItem_LikeImage"> <img
																								src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzc4Nzg3OCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02Ljc1IDkuNDg1aC0zYTEgMSAwIDAgMC0xIDF2MTBhMSAxIDAgMCAwIDEgMWgzYTEgMSAwIDAgMCAxLTF2LTEwYTEgMSAwIDAgMC0xLTFNMjAuNjU3IDguNTY2YTIuMzYzIDIuMzYzIDAgMCAwLTEuNzc5LS44MTNIMTYuNjJsLjE2NC0uNjI3Yy4xMzctLjUyOC4yMDEtMS4xMi4yMDEtMS44NjMgMC0xLjkxOS0xLjM3NS0yLjc3OC0yLjczOC0yLjc3OC0uNDQ0IDAtLjc2Ni4xMjMtLjk4Ni4zNzYtLjIuMjI3LS4yODIuNTMtLjI0My45MzVsLjAzIDEuMjMtMi45MDMgMi45NGMtLjU5My42LS44OTQgMS4yMy0uODk0IDEuODcydjkuNjQ3YS41LjUgMCAwIDAgLjUuNWg3LjY4N2EyLjM4OCAyLjM4OCAwIDAgMCAyLjM0OC0yLjA3bDEuNDQ1LTcuNDUyYTIuNDQgMi40NCAwIDAgMC0uNTc0LTEuODk3Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																								width="18px" height="18px"></span> <em id="rl_${review.reviewNum }">${review.reviewLike}</em>
																							<span class="CommentItem_ReplyImage"> <img
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