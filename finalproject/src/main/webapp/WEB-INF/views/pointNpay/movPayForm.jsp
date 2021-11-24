<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<%@include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HASHTAG::MyPage</title>
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
@import url("${path}/css/movPayForm.css");
</style>
</head>
<body>
<div class="AppMyPage">
	<div class="NavTapManager_NavContainer">
		<%@ include file="../header.jsp"%>
		<section class="NavTapManager_Main">
			<div class="UserPage">
				<div class="UserPage_Container">
					<div class="MaxWidthGrid">
						<div class="RoundedCornerBlock">
							<section class="UserPage_MyPage">
								<div class="UserPage_WallPaper">
									<div class="UserPage_WallPaperRow">
										<div class="UserPage_WallPaperTitle">
											<h2 class="myPointListTitle">
													영화<br> <span class="myPointListTitle_Title">결제 확인</span>
											</h2>
										</div>
									</div>
								</div>
								<div class="UserPageGrid">
										<div class="UserPageRow">
											<div class="container" align="center">
												<form action="movPay.do?movNum='${movie.movNum}'">
													<input type="hidden" name="movNum" value="${movie.movNum }">
													<input type="hidden" name="balance" value="${balance }">
													<table class="table">
														<tr>
															<th>영화 이름</th>
															<td>${movie.movName}</td>
														</tr>
														<tr>
															<th>영화 가격</th>
															<td>${movie.movPrice}원</td>
														</tr>
														<tr>
															<th>나의 현재 포인트</th>
															<td>${pmember.memPoint}p</td>
														</tr>
														<c:if test="${balance < 0}">
														<tr>
															<th>결제 후 포인트 잔액</th>
															<td>${balance}p</td>
														</tr>
														
															<tr>
																<td colspan="2">
																	<h3 class="ment_hello">
																		포인트 잔액이 부족하여 충전이 필요해요<br> 충전은 <a
																			href="pChargeForm.do?movNum=${movie.movNum}&tvNum=0"><span
																			class="ment_emphasis">여기</span></a>를 눌러주세요
																	</h3>
																</td>
															</tr>
														</c:if>
														<c:if test="${balance >= 0 }">
															<tr>
																<td colspan="2" class="textAlign"><input type="submit"
																	value="영화 결제하기" class="NextButtonCss"></td>
															</tr>
														</c:if>
													</table>
												</form>
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
							<%-- <div class="Footer_RatingSummery">
								지금까지 <em class="HashCount">${count}개의 #해시태그가 </em>쌓였어요.
							</div> --%>
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