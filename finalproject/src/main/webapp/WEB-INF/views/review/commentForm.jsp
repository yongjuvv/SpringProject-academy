<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 남기기</title>
<script type="text/javascript">
$(function() {
	$('.TopNavTab').addClass('TopNavTabScroll');
	$('.loginButtonCss').addClass('loginButtonCssScroll');
	$('.NavLogoCss').addClass('NavLogoCssScroll');
	$('.NavBasicFormInput').addClass('NavBasicFormInputScroll');
	$('.InputFormSearch').addClass('InputFormSearchScroll');
});
</script>
<style type="text/css">
input[type="checkbox"] {
	display: none;
}
input[type="checkbox"]:checked+label {
	padding: 6px;
	color: #ffffff;
	font-size: 20px;
	background-color: #aaaaff;
	border-radius: 6px;
}
label {
	font-weight: normal;
	font-size: 15px;
}
.hashlabel {
	font-weight: normal;
	font-size: 15px;
	border-radius: 6px;
	padding: 6px;
}
.formMargin{
	margin-top: 60px;
}
</style>
<script>
	// 해시태그 선택 제한
	$(document).ready(function() {
		$("input[type='checkbox']").on("click", function() {
			var count = $("input:checked[type='checkbox']").length;
			if (frm.reviewSpoiler.checked == true)
				count = count - 1;
			if (count > 3) {
				$(this).attr("checked", false);
				alert("해시태그는 3개까지만 선택할 수 있어요");
				return false;
			}
		});
	});
	
	// 해시태그 선택 안 하고 리뷰 등록했을 때 막기
	function chk() {
		var n = $('input:checkbox[name="hashtags"]:checked').length;
		if (n == 0) {
			alert("해시태그 1개는 꼭 선택해야 해요.");
			return false;
		}
	}
	
	// 리뷰 글자 수 표시
	$(function() {
		$('#reviewComm').keyup(function(e) {
			var reviewComm = $(this).val();
			$('#counter').html(reviewComm.length + '/300');
		});
		$('#reviewComm').keyup();
	});
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<form action="commentSubmit.do" class="formMargin" method="post" name="frm" onsubmit="return chk()">
		<input type="hidden" name="email" value="${email}">
		<input type="hidden" name="reviewNum" value="${review.reviewNum}">
		<input type="hidden" name="movNum" value="${review.movNum}">
		<input type="hidden" name="tvNum" value="${review.tvNum}">
		
		<div class="container">
			<div class="row">
				<div class="col-4"></div>
				<c:if test="${review.movNum==0}">
					<div class="col-4"><h3>${tv.tvName}</h3></div>
				</c:if>
				<c:if test="${review.tvNum==0}">
					<div class="col-4"><h3>${movie.movName}</h3></div>
				</c:if>
				<div class="col-4"></div>
			</div>
			<div class="row">
				<div class="col-4"></div>
				<div class="col-4">
						<textarea
								rows="5"
								name="reviewComm"
								id="reviewComm"
								placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요"
								maxlength="300"
								class="form-control"><c:if test="${review.reviewComm != null}">${review.reviewComm}</c:if></textarea>
				</div>
				<div class="col-4"></div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-2">
					<span id="counter" class="counter">###</span>
				</div>
				<div class="col-2"></div>
				<div class="col-4">
						<input type="checkbox" name="reviewSpoiler" id="reviewSpoiler" value="y" />
						<label for="reviewSpoiler">스포일러 있어요</label>
				</div>
				<div class="col-2"></div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-4"></div>
				<div class="col-4">
				<c:forEach var="hashtag" items="${hashList}">
					<c:if test="${hashtag.hashNum==review.hashNum1 || hashtag.hashNum==review.hashNum2 || hashtag.hashNum==review.hashNum3}">
						<input type="checkbox" id="${hashtag.hashNum}" name="hashtags" value="${hashtag.hashNum}" checked="checked">
						<label for="${hashtag.hashNum}">${hashtag.hashName}</label>
					</c:if>
					<c:if test="${hashtag.hashNum!=review.hashNum1 && hashtag.hashNum!=exmovie.hashNum2 && hashtag.hashNum!=review.hashNum3}">
					<input type="checkbox" id="${hashtag.hashNum}" name="hashtags" value="${hashtag.hashNum}">
						<label for="${hashtag.hashNum}">${hashtag.hashName}</label>
					</c:if>
				</c:forEach>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row" align="center"><input type="submit" value="등록" class="btn btn-info"></div>
		</div>
</form>
</body>
</html>