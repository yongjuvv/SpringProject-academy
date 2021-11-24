<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	
	<!-- 마이페이지 body의 네비게이션 -->
	<div>
		<h2 class="text-primary" align="center">회원 정보</h2>
	</div>
	<div>
		<nav class="navbar bg-light">
			<ul class="nav navbar-nav">
				<li class="nav-item"><a class="nav-link" href="myinfo.do">회원정보</a></li>
				<li class="nav-item"><a class="nav-link"
					href="insertPetInfo.do">펫 정보 입력</a></li>
			</ul>
		</nav>
	</div>

</body>
</html>