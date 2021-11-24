<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
#but0 {
	border: none;
	background-color:skyblue;
	color: infobackground;
	width: 100px;
	height: 40px;
	border-radius: 50px;
}

#join.container #join-row #join-column #join-box {
  max-width: auto;
  height: auto;

 
}
#join.container #join-row #join-column #join-box #join-form {
  padding: 20px;
}
#join.container #join-row #join-column #join-box #join-form #register-link {
  margin-top: -85px;
}

#join{
	padding-top:50px;
	padding-bottom: 50px;
}

#con {
	background-color: #EAEAEA;
	padding:2%;
	max-width:50%;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function idchk() {
		if (!frm.id.value) {
			alert('아이디를 입력해주세요!')
			frm.id.focus();
			return false;
		}
		$.post('idChk.do', 'id=' + frm.id.value, function(data) {
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
	<div id="join">
	<h2 class="text-center text-info">Join</h2>
		<div class="container" align="left" id="con">
			<div id="join-row"
				class="row justify-content-center align-items-center">
				<div id="join-column" class="col-md-6">
					<div id="join-box" class="col-md-12">
						<form id="join-form" action="join.do" method="post" name="frm"
							enctype="multipart/form-data" onsubmit="return chk()">
								<div class="form-group">
									<label for="username" class="text-info">아이디:</label>
									<br>
									<input type="text" name="id" required="required"
										autofocus="autofocus"><input type="button"
										onclick="idchk()" value="중복체크">
									<div id="disp" class="err"></div></td>
								</div>
								<div class="form-group">
									<label for="password" class="text-info">비밀번호</label>
									<br>
									<input type="password" name="password"
										required="required">
								</div>
								<div class="form-group">
									<label for="name" class="text-info">이름</label>
									<br>
									<input type="text" name="name" required="required">
								</div>
								<div class="form-group">
									<label for="sex" class="text-info">성별</label>
									<br>
									<input type="radio" name="sex" required="required"
										value="MAN"> <label for="man">남자</label> <input
										type="radio" name="sex" required="required" value="WOMAN">
										<label for="woman">여자</label>
								</div>
								<div class="form-group">
									<label for="address" class="text-info">주소</label>
									<br>
									<input type="text" name="address" required="required">
								</div>
								<div class="form-group">
									<label for="email" class="text-info">이메일</label>
									<br>
									<input type="text" name="email" required="required">@<input
										type="text" name="email" required="required">
								</div>
								<div class="form-group">
									<label for="phonenumber" class="text-info">전화번호</label>
									<br>
									<input type="text" name="phoneNumber"
										required="required" size="4">-<input type="text"
										name="phoneNumber" required="required" size="4">-<input
										type="text" name="phoneNumber" required="required" size="4">
								</div>
								<div class="form-group" align="left" style="padding-top:10px;">
									<button id="but0">확인</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group" align="center" style="padding-top:2%;">
									<a href="loginForm.do">로그인</a>
								</div>
	</div>
</body>
</html>