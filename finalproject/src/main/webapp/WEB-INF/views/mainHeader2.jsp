<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<script type="text/javascript">
$(function() {
	$('#modalLoginForm').click(function () {
		action = 'create';
		type='POST'
		$('#modalLoginForm').modal();
	});
});
</script>
<style>
.mainButton{
	border: none;
	color: #f6f6f6;
	background: black;
}
</style>

		<div id="nav_menu" class="nav_menu">
			<ul>
				<% if (session.getAttribute("email") == null) { %>
				<li id="bold14" value="login">
					<%@include file="member/modalLoginForm.jsp" %>
						<button class="mainButton" data-toggle="modal" data-target="#modalLoginForm" id="modalLoginForm">로그인</button>
						<!-- <a href="loginForm.do">로그인</a> --></li>
				<li id="bold14" value="join">
					<%@include file="member/modalJoinForm.jsp" %>
						<button class="mainButton" data-toggle="modal" data-target="#modalJoinForm" id="modalJoinForm">회원가입</button>
					<!-- <a href="joinForm.do">회원 가입</a> --></li>
				<%}
					else if (session.getAttribute("email") != null) {%>
				<li id="bold14" value="logout"><a class="mainButton" href="logout.do">로그아웃</a></li>
				<li id="bold14" value="myPage"><a class="mainButton" href="myPage.do">마이 페이지</a></li>
				<%} %>
			</ul>
		</div>
