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

<script type="text/javascript">
	var emailCheck = 0;
	var passCheck = 0;

	function emailChk() {
		var Email = $('#emailbox').val();
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if (!re.test(Email)) {
			$("#signupbtn").prop("disabled", true);
			$("#emailbox").css("background-color", "#FFCECE");
			$("#emailCk").text("제대로된 이메일을 입력해주세요");
		} else if (re.test(Email)) {
			$.ajax({
				data : {
					email : Email
				},
				url : "emailChk.do",
				success : function(data) {
					if (Email == "" && data == '0') {
						$("#signupbtn").prop("disabled", true);
						$("#emailbox").css("background-color", "#FFCECE");
						emailCheck = 0;
					} else if (data == '0') {
						$("#emailbox").css("background-color", "#b4e1ef");
						$("#emailCk").text("");
						emailCheck = 1;
						if (emailCheck == 1 && passCheck == 1) {
							$("#signupbtn").prop("disabled", false);
							/* 	$("#signupbtn").css("background-color", "#4CAF50"); */
							signupCheck();
						}
					} else if (data == '1') {
						$("#signupbtn").prop("disabled", true);
						$("#emailbox").css("background-color", "#FFCECE");
						$("#emailCk").text("이미 사용중인 이메일입니다");
						emailCheck = 0;
					}
				}
			});
		}
	}
	// pass 1 조건일치여부
	function passChk() {
		var regPw = /^.*(?=.{4,15})(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@!#$*()_&]).*$/;

		if (!regPw.test(frm.pass.value)) {
			$("#signupbtn").prop("disabled", true);
			$("#pass").css("background-color", "#FFCECE");
			$("#passCk").text("조건에 맞는 비밀번호를 입력해주세요");
		} else if (regPw.test(frm.pass.value)) {
			$("#pass").css("background-color", "#b4e1ef");
			$("#passCk").text("");
			passCheck = 1;
			if (emailCheck == 1 && passCheck == 1 /* && passCheck2 == 1 */) {
				$("#signupbtn").prop("disabled", false);
				/* $("#signupbtn").css("background-color", "#4CAF50"); */
				signupCheck();
			}
		}
	}

	//닉네임과 이메일 입력하지 않았을 경우 가입버튼 비활성화
	function signupCheck() {
		var nickName = $("#nickName").val();
		var birth = $("#memBirth").val();
		var memName = $("#memName").val();
		if (nickName == "" || birth == "" || memName == "") {
			$("#signupbtn").prop("disabled", true);
		}
	}
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="ment_hello">회원<br><span class="ment_emphasis">가입</span></h2>
		<form action="join.do" method="post" name="frm">
			<table class="table">
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" required="required"
						autofocus="autofocus" oninput="emailChk()" id="emailbox"
						class="form-control">
						<div class="err" id="emailCk"></div>
					<td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="memName" required="required"
						id="memName" class="form-control"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="nickName" required="required"
						id="nickName" class="form-control"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass" required="required"
						id="pass" class="form-control"
						placeholder="문자, 숫자, 특수기호의 조합으로 이루어진 4글자 이상의 비밀번호" maxlength="15"
						oninput="passChk()">
					<div class="err" id="passCk"></div></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="memBirth" required="required"
						id="memBirth" class="form-control" value="1980-01-01"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input
								type="submit"
								value="가입 완료"
								disabled="disabled"
								id="signupbtn"
								class="btn btn-success">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>