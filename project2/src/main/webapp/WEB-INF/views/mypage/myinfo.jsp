<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function delChk() {
		var chk = confirm("정말 탈퇴하시겠습니까?");
		if (chk) {
			location.href = "myinfoDelete.do";
		} else
			alert('탈퇴 취소되었습니다.');
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
	
	<div class="container">
		<h2 class="text-primary" align = "center">회원 정보 상태</h2>
		<div class="container" align = "center">
			<table class="table table-striped">
				<tr>
					<td colspan = "2" align = "center">아이디 : ${member.id }</td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">이름 : ${member.name }</td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">성별 : ${member.sex }</td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">주소 : ${member.address }</td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">이메일 : ${member.email }</td>
					
				</tr>
				<tr>
					<td colspan = "2" align = "center">전화번호 : ${member.phoneNumber }</td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">가입날짜 : ${member.joindate }</td>
				</tr>
				<tr>
					<td colspan = "2" align = "center"><a class="btn btn-default" href="myinfoUpdateForm.do">회원
							정보 수정</a><input type="button" value="회원 탈퇴" class="btn btn-default"
						onclick="delChk()"></td></tr>
			</table>
		</div>
	</div>



</body>
</html>