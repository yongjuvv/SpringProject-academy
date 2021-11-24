<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>

<script type="text/javascript">
$(function() {
	// 빈 댓글 입력 시 경고
	$('#replyList').load('reviewReplyList.do?reviewNum=${review.reviewNum}');
	$('#replyInsert').click(function() {
		if (!frm.coReCont.value) {
			alert("댓글 내용이 없어요");
			frm.coReCont.focus();
			return false;
		}
		if ("${email}" != "") {
			var sendData = $('#frm').serialize();
			$.post('reviewReplyInsert.do', sendData, function(data) {
				$('#replyList').html(data);
				$('#rc').html($(replycount));
				frm.coReCont.value = "";
			});
		}
	});
	
	// 좋아요 기능
	$('#like').click(function() {
		if ("${email}" == "") {
			alert("로그인이 필요한 서비스예요");
		} else {
			$.post("reviewLike.do", "reviewNum=${review.reviewNum}", function(data) {
				$('#rl').html(data);
			});
			$('.like').toggleClass('clickLike');
		}
	});
		
	// 이전에 좋아요를 누른 경우 좋아요 눌러진 상태로 저장
	var likeChk = $('#likeChk').val();
	if (likeChk == 1) {
		$('.like').addClass("clickLike");
	}
		
	$('#coReCont').click(function() {
		if ("${email}" == "") {
			alert("로그인이 필요한 서비스예요");
		}
	});
});
</script>
<style>
@import url("${path}/css/review.css");
</style>
</head>

	<section class="SectionWithShrinkHeaderBar">
		<header class="ShrinkHeaderBar">
			<div class="ShrinkHeaderBar__Buttons">
				<div class="ShrinkHeaderBar__LeftButtons">
					<button class="HeaderBackButton">
						<img
							src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA0OTIgNDkyIiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA0OTIgNDkyOyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjMycHgiIGhlaWdodD0iMzJweCI+CjxnPgoJPGc+CgkJPHBhdGggZD0iTTQ2NC4zNDQsMjA3LjQxOGwwLjc2OCwwLjE2OEgxMzUuODg4bDEwMy40OTYtMTAzLjcyNGM1LjA2OC01LjA2NCw3Ljg0OC0xMS45MjQsNy44NDgtMTkuMTI0ICAgIGMwLTcuMi0yLjc4LTE0LjAxMi03Ljg0OC0xOS4wODhMMjIzLjI4LDQ5LjUzOGMtNS4wNjQtNS4wNjQtMTEuODEyLTcuODY0LTE5LjAwOC03Ljg2NGMtNy4yLDAtMTMuOTUyLDIuNzgtMTkuMDE2LDcuODQ0ICAgIEw3Ljg0NCwyMjYuOTE0QzIuNzYsMjMxLjk5OC0wLjAyLDIzOC43NywwLDI0NS45NzRjLTAuMDIsNy4yNDQsMi43NiwxNC4wMiw3Ljg0NCwxOS4wOTZsMTc3LjQxMiwxNzcuNDEyICAgIGM1LjA2NCw1LjA2LDExLjgxMiw3Ljg0NCwxOS4wMTYsNy44NDRjNy4xOTYsMCwxMy45NDQtMi43ODgsMTkuMDA4LTcuODQ0bDE2LjEwNC0xNi4xMTJjNS4wNjgtNS4wNTYsNy44NDgtMTEuODA4LDcuODQ4LTE5LjAwOCAgICBjMC03LjE5Ni0yLjc4LTEzLjU5Mi03Ljg0OC0xOC42NTJMMTM0LjcyLDI4NC40MDZoMzI5Ljk5MmMxNC44MjgsMCwyNy4yODgtMTIuNzgsMjcuMjg4LTI3LjZ2LTIyLjc4OCAgICBDNDkyLDIxOS4xOTgsNDc5LjE3MiwyMDcuNDE4LDQ2NC4zNDQsMjA3LjQxOHoiIGZpbGw9IiNmZjJmNmUiLz4KCTwvZz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K"
							width="16px" height="16px" alt="back">
					</button>
				</div>
				<div class="ShrinkHeaderBar__RightButtons"></div>
			</div>
			<div class="ShrinkHeaderBar__LargeTitleBlock">
				<div class="ShrinkHeaderBar__LargeTitle">코멘트</div>
			</div>
			<div class="ShrinkHeaderBar__SmallTitle"></div>
		</header>
		<div class="CommentPage">
			<div class="Grid">
				<div class="Row">
					<div class="CommentPage__CommentContainer">
						<div class="BasicCommentItem__Comment">
							<div class="BasicCommentItem__TitleContainer">
								<div class="BasicCommentItem__ProfileBlock">
									<a title="${review.nickName}">
										<div class="ProfilePhoto">
											<div class="ProfilePhoto__ProfilePhotoImage"></div>
											<div class="ProfilePhoto__DefaultImageContainer"></div>
										</div>
										<div class="UserNameWithBadges__Self">${review.nickName}</div>
									</a>
								</div>
								<div class="BasicCommentItem__UserActionStatus">
									<img
										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM0QTRBNEEiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyIDE3Ljk4bC02LjAxNSA0LjM5MmMtLjUwOC4zNzItMS4xOTQtLjEyNi0uOTk4LS43MjVsMi4zMTctNy4wODEtNi4wMzUtNC4zNjdjLS41MS0uMzY5LS4yNDctMS4xNzUuMzgyLTEuMTc0bDcuNDQ3LjAxNiAyLjI4Ni03LjA5MWMuMTkyLS42IDEuMDQtLjYgMS4yMzMgMGwyLjI4NiA3LjA5IDcuNDQ3LS4wMTVjLjYyOS0uMDAxLjg5LjgwNS4zOCAxLjE3NGwtNi4wMzMgNC4zNjcgMi4zMTYgNy4wOGMuMTk2LjYtLjQ5IDEuMDk4LS45OTkuNzI2TDEyIDE3Ljk4eiIvPgo8L3N2Zz4K"
										width="16px" height="16px" alt="star"
										style="margin: 0 3px 0 0;"><span style="font-size: 13px;">${review.reviewRate*0.5}</span>
								</div>
							</div>
							<div class="BasicCommentItem__TextBlock">
								<div class="ContentlessCommentItem__Text">${review.reviewComm }</div>
							</div>
							<div class="ContentlessCommentItem__LikeReplyBlock">
								<img
									src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzc4Nzg3OCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02Ljc1IDkuNDg1aC0zYTEgMSAwIDAgMC0xIDF2MTBhMSAxIDAgMCAwIDEgMWgzYTEgMSAwIDAgMCAxLTF2LTEwYTEgMSAwIDAgMC0xLTFNMjAuNjU3IDguNTY2YTIuMzYzIDIuMzYzIDAgMCAwLTEuNzc5LS44MTNIMTYuNjJsLjE2NC0uNjI3Yy4xMzctLjUyOC4yMDEtMS4xMi4yMDEtMS44NjMgMC0xLjkxOS0xLjM3NS0yLjc3OC0yLjczOC0yLjc3OC0uNDQ0IDAtLjc2Ni4xMjMtLjk4Ni4zNzYtLjIuMjI3LS4yODIuNTMtLjI0My45MzVsLjAzIDEuMjMtMi45MDMgMi45NGMtLjU5My42LS44OTQgMS4yMy0uODk0IDEuODcydjkuNjQ3YS41LjUgMCAwIDAgLjUuNWg3LjY4N2EyLjM4OCAyLjM4OCAwIDAgMCAyLjM0OC0yLjA3bDEuNDQ1LTcuNDUyYTIuNDQgMi40NCAwIDAgMC0uNTc0LTEuODk3Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
									width="18px" height="18px"><span id="rl">${review.reviewLike}</span>
								<img class="ContentlessCommentItem__ReplyImage"
									src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM3ODc4NzgiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTkuODU3IDE3Ljc4Nkw2IDIxdi00LjkxYy0xLjg0MS0xLjM3My0zLTMuMzY5LTMtNS41OUMzIDYuMzU4IDcuMDMgMyAxMiAzczkgMy4zNTggOSA3LjVjMCA0LjE0Mi00LjAzIDcuNS05IDcuNS0uNzM5IDAtMS40NTYtLjA3NC0yLjE0My0uMjE0eiIvPgo8L3N2Zz4K"
									width="18px" height="18px">${replycount}
							</div>
							<div class="ContentlessCommentItem__UserActionBlock">
								<button class="likebtn" id="like">
									<span class="like">좋아요</span>
								</button>
							</div>
							
							<!-- 댓글 목록 -->
							<div class="UserComments" id="replyList"></div>
							
							<!-- 댓글 작성 -->
							<div class="WriteComments">
								<form name="frm" id="frm">
									<input type="hidden" name="reviewNum" value="${review.reviewNum}">
									<input type="hidden" name="coReEmail" value="${email}">
									<table>
									<tr>
										<td><textarea
													rows="1"
													cols="100%"
													name="coReCont"
													id="coReCont"
													class="form-control"
													<c:if test="${email == null}">
													placeholder="<c:out value="${email }" default="로그인이 필요한 서비스예요"></c:out>"
													</c:if>></textarea>
										</td>
										<td> 
											<input type="button" value="등록" id="replyInsert" class="btn btn-sm btn-default" />
										</td>
									</tr>
								</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
