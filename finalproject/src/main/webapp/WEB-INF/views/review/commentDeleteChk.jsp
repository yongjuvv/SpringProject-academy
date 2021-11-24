<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>확인</title>
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
.formMargin{
	margin-top: 100px;
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
	<div class="container" align="center">
		<form action="commentDelete.do?reviewNum=${reviewNum}&pageNum=${pageNum}" class="formMargin" method="post">
			<input type="hidden" name="reviewNum" value="${reviewNum }">
			<table class="table">
				<tr>
					<td colspan="2">
							코멘트를 삭제하시겠어요?
					</td>
				</tr>
				<tr>
					<td>
					<input type="button" class="btn btn-default" onclick="history.go(-1)" value="아니 실수야">
					<input type="submit" class="btn btn-danger" value="네 삭제할래요">
					</td>
			</table>
		</form>
	</div>
</body>
</html>