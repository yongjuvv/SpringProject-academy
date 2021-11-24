<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		var pass = $('#pass').val();
		if (!regPw.test(pass)) {
			$("#signupbtn").prop("disabled", true);
			$("#pass").css("background-color", "#FFCECE");
			$("#passCk").text("조건에 맞는 비밀번호를 입력해주세요");
		} else if (regPw.test(pass)) {
			$("#pass").css("background-color", "#b4e1ef");
			$("#passCk").text("");
			passCheck = 1;
			if (emailCheck == 1 && passCheck == 1) {
				$("#signupbtn").prop("disabled", false);
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
<style>@import url("${path}/css/modalJoinForm.css");
</style>
<div class="modal fade" id="modalJoinForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="exampleModalLabel">HASHTAG</h2>
      </div>
      <div class="modal-body">
      <form class="joinForm" action="join2.do" method="post" name="frm">
      	<div class="inputDiv">
      		<label class="basicFormInput">
      			<div class="input">
					<input type="email" name="email" required="required"
						autofocus="autofocus" oninput="emailChk()" id="emailbox"
						class="basicInput" placeholder="이메일">
      			</div>
      			<div class="inputClear">
      				<span class="inputClearButton glyphicon glyphicon-remove-sign" aria-label="clear" role="button" onclick="clearing('emailbox')" ></span>
      			</div>
      		</label>
      		<p class="err" id="emailCk"></p>
      	</div>
      	<div class="inputDiv">
      		<label class="basicFormInput">
      			<div class="input">
					<input type="text" name="memName" required="required"
						id="memName" class="basicInput" placeholder="이름">
      			</div>
      			<div class="inputClear">
      				<span class="inputClearButton glyphicon glyphicon-remove-sign" aria-label="clear" role="button"></span>
      			</div>
      		</label>
      	</div>
      	<div class="inputDiv">
      		<label class="basicFormInput">
      			<div class="input">
					<input type="text" name="nickName" required="required"
						id="nickName" class="basicInput" placeholder="닉네임">
      			</div>
      			<div class="inputClear">
      				<span class="inputClearButton glyphicon glyphicon-remove-sign" aria-label="clear" role="button"></span>
      			</div>
      		</label>
      	</div>
      	<div class="inputDiv">
      		<label class="basicFormInput">
      			<div class="input">
					<input type="date" name="memBirth" required="required"
						id="memBirth" class="basicInput" value="1980-01-01" placeholder="생년월일">
      			</div>
      			<div class="inputClear">
      				<span class="inputClearButton glyphicon glyphicon-remove-sign" aria-label="clear" role="button"></span>
      			</div>
      		</label>
      	</div>
      	<div class="inputDiv">
      		<label class="basicFormInput">
      			<div class="input">
				<input type="password" name="pass" required="required"
						id="pass" class="basicInput"
						placeholder="비밀번호 : 문자, 숫자, 특수기호" maxlength="15"
						oninput="passChk()">
      			</div>
      			<div class="inputClear">
      				<span class="inputClearButton glyphicon glyphicon-remove-sign" aria-label="clear" role="button">
      				</span>
      			</div>
      		</label>
      		<p class="err" id="passCk"></p>
      	</div>
      	<input type="submit" class="modalJoinActionButton" id="signupbtn joinActionButton" value="회원가입">
      	<!-- <button type="button" class="modalJoinActionButton" id="signupbtn joinActionButton" data-dismiss="modal">회원가입</button> -->
      </form>
      <div class="modalLoginAction">
      	이미 가입하셨나요?      
      	<%@include file="modalLoginForm.jsp" %>
		<button class="modalLoginActionButton" data-toggle="modal" data-target="#modalLoginForm" id="modalLoginForm" data-dismiss="modal">로그인</button>
      </div>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
	