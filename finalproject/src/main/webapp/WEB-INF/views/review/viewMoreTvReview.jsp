<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
// 좋아요 기능
function like(num) {	
	if ("${email}" == "") {
		alert("로그인이 필요한 서비스예요");
		location.href = 'loginForm.do';
	} else {
		$.post("reviewLike.do", "reviewNum="+num, function(data) {
			$('#rl_'+num).html(data);
			$('#like_'+num).toggleClass('clickLike');
		});
	}
}
$(function() {
	$('.TopNavTab').addClass('TopNavTabScroll');
	$('.loginButtonCss').addClass('loginButtonCssScroll');
	$('.NavLogoCss').addClass('NavLogoCssScroll');
	$('.NavBasicFormInput').addClass('NavBasicFormInputScroll');
	$('.InputFormSearch').addClass('InputFormSearchScroll');
});
</script>
<style>
@import url("${path}/css/viewMoreTvReview.css");
</style>
<body>
<div class="root">
	<div class="navTabManager_navContainer">
		<%@ include file="../tvHeader.jsp"%>
		<section class="navTabManager_Main">
			<section class="SectionWithShrinkHeaderBar">
				<header class="ShrinkHeaderBar">
					<div class="ShrinkHeaderBar_Button">
						<div class="ShrinkHeaderBar_LeftButton">
							<button class="HeaderBackButton_TopLeftButton">
								<span class=" glyphicon glyphicon-arrow-left"></span>
							</button>
						</div>
					</div>
					<div class="ShrinkHeaderBar_LargeTitleBlock">
						<div class="ShrinkHeaderBar_LargeTitle">코멘트</div>
					</div>
					<div class="ShrinkHeaderBar_SmallTitle">코멘트</div>
				</header>
				<div class="Grid">
					<div class="Row">
						<div class="ContentCommentsPage_CommentList">
							<ul class="VisualUl">
							<c:forEach var="review" items="${tvReviewList}">
								<div class="BasicCommentItem_Comment">
									<div class="BasicCommentItem_TitleContainer">
										<div class="BasicCommentItem_ProfileBlock">
											<a class="ProfileBlockA" href="otherReviewList.do?email=${review.email}">
												<div class="ProfilePhoto_RoundedImageBlock">
													<div class="ProfilePhoto_ProfilePhotoImg"></div>
													<div class="ProfilePhoto_ProfilePhotoDefault">
														<img class="defaultImage_ProfileImage" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" alt="김태훈의 사진">
													</div>
												</div>
												<div class="UserName">${review.nickName}</div>
											</a>
										</div>
										<div class="BasicCommentItem_UserActionContainer">
											<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM0QTRBNEEiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyIDE3Ljk4bC02LjAxNSA0LjM5MmMtLjUwOC4zNzItMS4xOTQtLjEyNi0uOTk4LS43MjVsMi4zMTctNy4wODEtNi4wMzUtNC4zNjdjLS41MS0uMzY5LS4yNDctMS4xNzUuMzgyLTEuMTc0bDcuNDQ3LjAxNiAyLjI4Ni03LjA5MWMuMTkyLS42IDEuMDQtLjYgMS4yMzMgMGwyLjI4NiA3LjA5IDcuNDQ3LS4wMTVjLjYyOS0uMDAxLjg5LjgwNS4zOCAxLjE3NGwtNi4wMzMgNC4zNjcgMi4zMTYgNy4wOGMuMTk2LjYtLjQ5IDEuMDk4LS45OTkuNzI2TDEyIDE3Ljk4eiIvPgo8L3N2Zz4K" width="16px" height="16px" class="userStar" alt="star">
											<span>${review.reviewRate*0.5}</span>
										</div>
									</div>
									<div class="BasicCommentItem_TextBlock">
										<div class="CommentItem_Text">${review.reviewComm}</div>
										<div class="ReviewHashtag">#${review.hashName1 }<c:if test="${review.hashName2!=null }">#${review.hashName2 }</c:if><c:if test="${review.hashName3!=null }">#${review.hashName3 }</c:if></div>
									</div>
									<div class="CommentItem_LikeReplyBlock">
										<span class="CommentItem_LikeImage">
											<img
												src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzc4Nzg3OCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02Ljc1IDkuNDg1aC0zYTEgMSAwIDAgMC0xIDF2MTBhMSAxIDAgMCAwIDEgMWgzYTEgMSAwIDAgMCAxLTF2LTEwYTEgMSAwIDAgMC0xLTFNMjAuNjU3IDguNTY2YTIuMzYzIDIuMzYzIDAgMCAwLTEuNzc5LS44MTNIMTYuNjJsLjE2NC0uNjI3Yy4xMzctLjUyOC4yMDEtMS4xMi4yMDEtMS44NjMgMC0xLjkxOS0xLjM3NS0yLjc3OC0yLjczOC0yLjc3OC0uNDQ0IDAtLjc2Ni4xMjMtLjk4Ni4zNzYtLjIuMjI3LS4yODIuNTMtLjI0My45MzVsLjAzIDEuMjMtMi45MDMgMi45NGMtLjU5My42LS44OTQgMS4yMy0uODk0IDEuODcydjkuNjQ3YS41LjUgMCAwIDAgLjUuNWg3LjY4N2EyLjM4OCAyLjM4OCAwIDAgMCAyLjM0OC0yLjA3bDEuNDQ1LTcuNDUyYTIuNDQgMi40NCAwIDAgMC0uNTc0LTEuODk3Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
												width="18px" height="18px"></span>
										<em id="rl_${review.reviewNum }">${review.reviewLike}</em>
										<span class="CommentItem_ReplyImage">
											<img
												src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM3ODc4NzgiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTkuODU3IDE3Ljc4Nkw2IDIxdi00LjkxYy0xLjg0MS0xLjM3My0zLTMuMzY5LTMtNS41OUMzIDYuMzU4IDcuMDMgMyAxMiAzczkgMy4zNTggOSA3LjVjMCA0LjE0Mi00LjAzIDcuNS05IDcuNS0uNzM5IDAtMS40NTYtLjA3NC0yLjE0My0uMjE0eiIvPgo8L3N2Zz4K"
												width="18px" height="18px"></span>
										<em>${replycount}</em>
									</div>
									<div class="CommentItem_UserActionBlock">
										<button class="likebtn" onclick="like(${review.reviewNum})">
											<c:choose>
												<c:when test="${review.likeChk == 0}">
													<span id="like_${review.reviewNum}" class="like">좋아요</span>
												</c:when>
												<c:when test="${review.likeChk == 1}">
													<span id="like_${review.reviewNum}" class="clickLike like">좋아요</span>
												</c:when>
											</c:choose>
										</button>
									</div>
								</div>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</section>
		</section>
	</div>
</div>
</body>
</html>