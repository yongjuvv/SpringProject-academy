<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close" aria-hidden="true">×</button>
		<h3 class="smaller lighter blue no-margin modal-title">로그인</h3>
	</div>

	<div class="modal-body">
		<form action="login.do" method="post">
			<table class="table table-condensed">
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" class="form-control"
						required="required" autofocus="autofocus"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass" class="form-control"
						required="required"></td>
				</tr>
			</table>
		</form>
	</div>

	<div class="modal-footer">
		<input type="submit" value="확인" class="btn btn-success">
	</div>
</body>
</html>