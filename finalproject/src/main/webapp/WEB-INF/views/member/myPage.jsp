<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
@import url("${path}/css/myPage.css");
</style>
</head>
<body>
<div class="AppMyPage">
	<div class="NavTapManager_NavContainer">
		<section class="NavTapManager_Main">
			<div class="UserPage">
				<div class="UserPage_Container">
					<div class="MaxWidthGrid">
						<div class="RoundedCornerBlock">
							<section class="UserPage_MyPage">
								<div class="UserPage_WallPaper">
									<div class="myPoint">보유 포인트 <span class="myPointLarge">${pmember.memPoint}</span>POINT
									</div>
									<!-- <button class="UserPage_WallPaperTopRightButton" data-toggle="modal" data-target="#modalConfig" id="modalConfig" aria-lable="setting"></button> -->
									<button type="button" class="UserPage_WallPaperTopRightButton" data-toggle="modal" data-target="#modalConfig" aria-lable="setting"><span class="ConfigButton glyphicon glyphicon-cog"></span></button>
									<!-- Modal -->
										<div class="modal fade" id="modalConfig" tabindex="-1"
											role="dialog" aria-labelledby="setting" aria-hidden="true">
											<div class="modal-dialog settingModalDialog" role="document">
												<div class="modal-content settinModalContent">
													<div class="modal-header settingModalHeader">
														<div class="ShrinkHeaderBar_Button">
															<div class="ShrinkHeaderBar_LeftButton">
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																<span class="glyphicon glyphicon-remove"></span>
																</button>
															</div>
														</div>
														<div class="ShrinkHeaderBar_LargeTitleBlock">
															<div class="ShrinkHeaderBar_LargeTitle">설정</div>
														</div>
													</div>
													<div class="ModalWithShrinkHeaderBar_ChildrenContainer">
														<div class="settingModalGrid">
															<div class="settingModalRow">
																<section class="SettingModal_SettingSection">
																	<div class="SubCategoryTitle">사용자 설정</div>
																	<ul class="settingModalVisualUl">
																		<li class="settingModalBasicList">
																			<div class="settingModalBasicList_Inner">
																				<div class="settingModalBasicList_Title"><a href="view.do">내 정보 조회</a></div>
																			</div>
																		</li>
																		<li class="settingModalBasicList">
																			<div class="settingModalBasicList_Inner">
																				<div class="settingModalBasicList_Title"><a href="passChkForm.do">비밀번호 변경</a></div>
																			</div>
																		</li>
																		<li class="settingModalBasicList">
																			<div class="settingModalBasicList_Inner">
																				<div class="settingModalBasicList_Title"><a href="memDelForm.do">탈퇴하기</a></div>
																			</div>
																		</li>
																	</ul>
																</section>
																<section class="SettingModal_SettingSection">
																	<div class="SubCategoryTitle">결제 관리</div>
																	<ul class="settingModalVisualUl">
																		<li class="settingModalBasicList">
																			<div class="settingModalBasicList_Inner">
																				<div class="settingModalBasicList_Title"><a href="pChargeList.do">충전 및 사용내역</a></div>
																			</div>
																		</li>
																		<li class="settingModalBasicList">
																			<div class="settingModalBasicList_Inner">
																				<div class="settingModalBasicList_Title"><a href="pChargeForm.do">포인트 충전</a></div>
																			</div>
																		</li>
																	</ul>
																</section>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>


										<a class="UserPage_PhotoButtonContainer">사진 설정<span class="UserPage_PhotoIcon glyphicon glyphicon-camera"></span>
									</a>
								</div>
								<div class="UserPageGrid">
									<div class="UserPageRow">
										<header class="UserPage_ProfileHeader">
											<div class="ProfilePhoto_my">
												<div class="ProfilePhoto_ProfilePhotoImage"></div>
												<div class="ProfilePhoto_DefaultImageContainer">
													<img class="defaultImage_ProfileImg"
														src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
														alt="${pmember.nickName}의 사진">
												</div>
											</div>
											<div class="UserPage_NameBlock">
												<h1 class="UserPage_Name">${pmember.nickName}</h1>
											</div>
										</header>
										<ul class="VisualUl">
											<li class="UserPage_AnalysisListItem">
												<a class="AnalysisListItemA" href="myReviewList.do">
													<span class="glyphicon glyphicon-heart UserPage_TasteImage"></span><span class="UserPage_AnalysisListItemTitleFirst">코멘트 보고서</span>
												</a>
											</li>
											<li class="UserPage_AnalysisListItem">
												<a class="AnalysisListItemA" href="myHashtag.do">
													<span class="glyphicon glyphicon-heart UserPage_TasteImage"></span><span class="UserPage_AnalysisListItemTitleSecond">취향 분석</span>
												</a>
											</li>
											<li class="UserPage_AnalysisListItem">
												<a class="AnalysisListItemA" href="myCollectionList.do">
													<span class="glyphicon glyphicon-heart UserPage_TasteImage"></span><span class="UserPage_AnalysisListItemTitleSecond">컬렉션</span>
												</a>
											</li>
										</ul>
									</div>
									<div class="HorizontalScrollbarContainer">
										<div class="ScrollingInner">
											<div class="ScrollRow">
												<ul class="UserPage_CategoryUl">
													<li class="UserPage_CategoryList">
														<a class="UserPage_CategoryLinkMovie">
															<ul class="UserPage_CategoryArchivesMovie">
																<li class="UserPage_CategoryArchivesName">MOVIE</li>
																<li class="UserPage_CategoryArchivesRatedCount">#${countMovie}</li>
															</ul>
														</a>
													</li>
													<li class="UserPage_CategoryList">
														<a class="UserPage_CategoryLinkTv">
															<ul class="UserPage_CategoryArchivesTv">
																<li class="UserPage_CategoryArchivesName">TV</li>
																<li class="UserPage_CategoryArchivesRatedCount">#${countTv}</li>
															</ul>
														</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
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
		</section>
	</div>
</div>
</body>
</html>