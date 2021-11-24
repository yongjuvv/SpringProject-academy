<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function idchk() {
	if(!frm.id.value){
		alert('아이디를 입력해주세요!')
		frm.id.focus(); return false;
	}
	$.post('idChk.do', 'id='+frm.id.value, function(data) {
		$('#disp').html(data);
	})
	
}
	
</script>
<script type="text/javascript">
	function sessionChk() {
		alert('로그인을 해주세요.');
	}
	function alreadyLogin() {
		alert('이미 로그인 되어 있습니다.')
	}
</script>
</head>
<body>
	<!-- 회원가입 body -->
	<h2 class="text-primary" align = "center">회원 가입</h2>
	<div class="container" align="center">
		<form action="join.do" method="post" name="frm" enctype="multipart/form-data" onsubmit = "return chk()">
			<table class="table table-hover">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" required="required"
						autofocus="autofocus"><input type = "button" onclick = "idchk()" value = "중복체크">
						<div id = "disp" class = "err"></div></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" required="required"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" required="required"></td>
				</tr>
				
				
				
				<tr>
					<td>성별</td><td><input type="radio" name="sex" required="required" value = "MAN">
					<label for = "man">남자</label>
					<input type = "radio" name = "sex" required="required" value = "WOMAN">
					<label for = "woman">여자</label></td>
				</tr>
				
				
				
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" required="required"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" required="required">@<input type = "text" name = "email" required="required">
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phoneNumber" required="required" size = "4">-<input type="text" name="phoneNumber" required="required" size = "4">-<input type="text" name="phoneNumber" required="required" size = "4"></td>
				</tr>
				<tr><td colspan = "2" align = "center"><input type = "submit"></td></tr>
			</table>
			<a href="loginForm.do">로그인</a>
		</form>
	</div>

</body>
</html>