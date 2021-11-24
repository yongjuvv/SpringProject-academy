<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<%@ include file="../sessionChk.jsp"%>
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
@import url("${path}/css/myReviewList.css");
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="AppMyPage">
		<div class="NavTapManager_NavContainer">
			<section class="NavTapManager_Main">
				<div class="UserPage">
					<div class="UserPage_Container">
						<div class="MaxWidthGrid">
							<div class="RoundedCornerBlock">
								<section class="UserPage_MyPage">
									<div class="UserPage_WallPaper">
										<div class="UserPage_WallPaperRow">
											<div class="UserPage_WallPaperTitle">
												<h2 class="myPointListTitle">내가 남긴 코멘트</h2>
											</div>
										</div>
									</div>
									<div class="UserPageGrid">
										<div class="UserPageRow">
											<div class="container" align="center">
												<table class="table" style="font-size: 14px;">
													<tr>
														<th align="center" width="15%">날짜</th>
														<th align="center" width="15%">이름</th>
														<th align="center" width="60%">리뷰</th>
														<th align="center" width="10%"></th>
													</tr>
													<c:if test="${empty list2 }">
														<tr>
															<td align="center" colspan="4">등록한 리뷰가 없어요 ༼☯﹏☯༽</td>
														</tr>
													</c:if>
													<c:forEach var="review" items="${list2 }">
														<c:if test="${review.reviewComm != null }">
															<tr>
																<td rowspan="2"><fmt:formatDate
																		value="${review.reviewDate}" pattern="M/d HH:mm" /></td>
																<td rowspan="2"><c:if test="${review.tvNum==0}">
																		<a href="movSearchResult.do?movNum=${review.movNum}">${review.movName}</a>
																	</c:if> <c:if test="${review.movNum==0}">
																		<a href="tvSearchResult.do?tvNum=${review.tvNum}">${review.tvName}</a>
																	</c:if></td>
																<td valign="middle"><c:if
																		test="${empty review.reviewComm}">
																		<span>남긴 코멘트는 없어요 (〃･ิ‿･ิ)ゞ </span>
																	</c:if> <a
																	href="reviewDetail.do?reviewNum=${review.reviewNum}">${review.reviewComm}</a>
																</td>
																<td rowspan="2"><c:if test="${review.tvNum==0}">
																		<a
																			href="commentForm.do?reviewNum=${review.reviewNum}&pageNum=${pageNum}">수정</a>/
							<a
																			href="commentDeleteChk.do?reviewNum=${review.reviewNum}&pageNum=${pageNum}">삭제</a>
																	</c:if> <c:if test="${review.movNum==0}">
																		<a
																			href="commentForm.do?reviewNum=${review.reviewNum}&pageNum=${pageNum}">수정</a>/
							<a
																			href="commentDeleteChk.do?reviewNum=${review.reviewNum}&pageNum=${pageNum}">삭제</a>
																	</c:if></td>
															</tr>
															<tr>
																<td><span>#${review.hashName1 }</span> <c:if
																		test="${review.hashName2!=null }">
																		<span>#${review.hashName2 }</span>
																	</c:if> <c:if test="${review.hashName3!=null }">
																		<span>#${review.hashName3 }</span>
																	</c:if></td>
															</tr>
														</c:if>
													</c:forEach>
												</table>
											</div>
											<div class="container pageList" align="center">
												<c:if test="${startPage > pagePerBlock }">
													<a href="myReviewList.do?pageNum=${startPage-1}">이전</a>
												</c:if>
												<c:forEach var="i" begin="${startPage}" end="${endPage }">
													<a href="myReviewList.do?pageNum=${i}">${i}</a>
												</c:forEach>
												<c:if test="${endPage < totPage }">
													<a href="myReviewList.do?pageNum=${endPage+1}">다음</a>
												</c:if>
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
									<li class="Footer_FrogramsInfoList">사업자 등록 번호 <span>(123-45-67890)</span>
									</li>
									<li class="Footer_FrogramsInfoList">고객센터 <span>cs@hash.tag</span>
									</li>
								</ul>
								<ul class="Footer_FrogramsInfoUnder">
									<span class="Footer_FooterLogo">HASHTAG</span>
									<li class="Footer_FrogramsInfoList">© 2018–2019 by
										Hashtag. Inc</li>
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