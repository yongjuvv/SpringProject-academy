<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	function sessionChk() {
		alert('로그인을 해주세요.');
		
	}
	function alreadyLogin() {
		alert('이미 로그인 되어 있습니다.')
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그인 body -->
	<h2 align="center" class = "text-primary">로그인</h2>
	<div class="container">
		<form action="login.do" method="post">
			<table class="table table-striped">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" required="required"
						autofocus="autofocus"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" required="required"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center"><input type="submit" value="입력"></td>
				</tr>
			</table>

		</form>

	</div>

</body>
</html>