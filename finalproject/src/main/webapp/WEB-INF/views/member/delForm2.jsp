<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<%@ include file="../header.jsp" %>
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
	function passChk() {
		var pass = $('#pass').val();
		var rtn = "";
		$.ajax({
			data : {
				pass : pass
			},
			url : "passChk.do",
			async : false,
			success : function(data) {
				if (data == '0') {
					$('#passCk').text("올바른 비밀번호를 입력해 주세요");
					rtn = false;
				} else if (data == '1') {
					rtn = true;
				}
			},
			error : function(data) {
				$('#passCk').text("error");
			}
		});
		return rtn;
	}
function myPage() {
	location.href="myPage.do";
}
</script>
<style>
@import url("${path}/css/delForm.css");
</style>
</head>
<body>
<div class="AppMyPage">
	<div class="NavTapManager_NavContainer">
	<%@include file="../header.jsp" %>
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
													<br> <span class="myPointListTitle_Title">탈퇴하기</span>
											</h2>
										</div>
									</div>
								</div>
								<div class="UserPageGrid">
										<div class="UserPageRow">
											<div class="container" align="center">
												<form action="memDel.do">
													<table class="table">
														<tr>
															<td>
																<p>
																	<span class="memDelTitleQuestion">정말 탈퇴하시겠어요?</span><br><br> 
																	1. 한 번 탈퇴한 이메일 주소는 재가입이 불가능합니다.<br>
																	2. 등록한 리뷰와 해시태그는 자동으로 삭제되지 않습니다.
																</p>
															</td>
														</tr>
														<tr>
															<td style="border-top: none;" class="textAlign"><input type="button"
																onclick="myPage()" value="안 할래요"
																class="NextButtonCss"> <input type="submit"
																value="네 탈퇴할래요" class="btn btn-danger"></td>
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