<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<div class="container" align="center">
	<h2 class="ment_hello"><span class="ment_emphasis">탈퇴</span><br>확인(2)</h2>
		<form action="memDel.do">
			<table class="table">
				<tr>
					<td>
						<p>
						<span class="memDelTitleQuestion">정말 탈퇴하시겠어요?</span> <br>
						1. 한 번 탈퇴한 이메일 주소는 재가입이 불가능합니다. <br>
						2. 등록한 리뷰와 해시태그는 자동으로 삭제되지 않습니다.
					</td>
				</tr>
				<tr>
					<td style="border-top: none;">
						<input
							type="button"
							onclick="history.go(-1)"
							value="안 할래요"
							class="btn btn-default">
						<input
							type="submit"
							value="네 탈퇴할래요"
							class="btn btn-danger">
					</td>
			</table>
		</form>
	</div>
</body>
</html>