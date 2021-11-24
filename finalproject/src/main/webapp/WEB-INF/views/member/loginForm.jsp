<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
th {
	text-align: left;
}
</style>

</head>
<body>
<div class="container" align="center">
	<h2 class="ment_hello">회원<br><span class="ment_emphasis">로그인</span></h2>
		<form action="login.do" method="post">
			<table class="table">
				<tr>
					<th>이메일</th>
					<td>
						<input
							type="email"
							name="email"
							class="form-control"
							required="required"
							autofocus="autofocus">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input
							type="password"
							name="pass"
							class="form-control"
							required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="로그인" class="btn btn-success"></td>
				</tr>
			</table>
		</form>
</div>
</body>
</html>