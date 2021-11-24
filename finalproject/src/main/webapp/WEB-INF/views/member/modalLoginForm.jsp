<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal -->
<script>
$(function() {
	$("#loginButton").click(function () {
		var email = $('#email').val();
		var password = $('#password').val();
		$.post("login2.do", "email="+email+"&password="+password, function(data) {
		});
		location.reload();
	});
});
</script>
<style>
@import url("${path}/css/modalLoginForm.css");
</style>
<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="exampleModalLabel">HASHTAG</h2>
      </div>
      <div class="modal-body">
      <form class="loginForm">
      	<div class="inputDiv">
      		<label class="basicFormInput">
      			<div class="input">
      				<input
					type="email"
					name="email"
					id="email"
					class="basicInput"
					required="required"
					autofocus="autofocus" placeholder="이메일">
      			</div>
      			<div class="inputClear">
      				<span class="inputClearButton glyphicon glyphicon-remove-sign" aria-label="clear" role="button"></span>
      			</div>
      		</label>
      	</div>
      	<div class="inputDiv">
      		<label class="basicFormInput">
      			<div class="input">
      			<input
					type="password"
					name="password"
					id="password"
					class="basicInput"
					required="required" placeholder="비밀번호">
      			</div>
      			<div class="inputClear">
      				<span class="inputClearButton glyphicon glyphicon-remove-sign" aria-label="clear" role="button">
      				</span>
      			</div>
      		</label>
      	</div>
      	<button type="button" class="modalLoginButton" id="loginButton" data-dismiss="modal">로그인</button>
      </form>
      <div class="modalForgot">
      	<button class="modalForgotButton">비밀번호를 잊어버리셨나요?</button>
      </div>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
