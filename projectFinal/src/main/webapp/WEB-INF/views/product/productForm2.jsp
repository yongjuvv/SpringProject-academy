<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul {
	background-color: #FFDAB9;
	width: 1000px;
	margin: auto;
	padding: 0;
	overflow: hidden;
	list-style-type: none;
}

li {
	float: left;
}

li a {
	display: block;
	background-color: #FFDAB9;
	color: #000000;
	padding: 30px;
	padding-right: 45px;
	padding-left: 45px;
	text-decoration: none;
	text-align: center;
	font-weight: bold;
}
/* li a:hover {
   background-color : #CD853F;
   color : white;
} */
li a.current {
	background-color: #FF6347;
	color: white;
}

li a:hover:not (.current ) {
	background-color: #CD853F;
	color: white;
}

</style>
</head>
<body>
	<div class="container">
		<nav class="navbar fixed-top navbar-expand-md store-banner-off mobile-fixed" align="center">
			<div align="center">
				<a href="main.do" id="main-image"> <img alt=""
					src="resources/images/logo.jpg" width="212px">
				</a>
			</div>
			

			<!--네비게이션 바 -->
			<div class="container">
				<nav class="navbar navbar-expand-sm bg-light navbar-light" class="col-12 col-lg">

					<!-- Links -->
					<ul class="navbar-nav">
						<li class="nav-item active"><a class="nav-link"
							href="main.do">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="PBview.do">기기구매</a></li>
						<li class="nav-item"><a class="nav-link" href="">게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="">고객센터</a></li>
						<li class="nav-item"><a class="nav-link" href="">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="joinForm.do">회원가입</a></li>
						<li class="nav-item">
							<c:choose>
								<c:when test="${not empty loginUser }">
									<a href="logoutForm.do">로그아읏</a>
								</c:when>
								<c:when test="${empty loginUser}">
									<a href="loginForm.do">로그인</a>
								</c:when>
							</c:choose></li>
					</ul>
				</nav>
			</div>
		</nav>
		<section class="main-section">
			<h2 align="center">상품정보 입력</h2>
			<form action="product.do" method="post" id="frm">
				<div class="col-12" align="center">
					<div id="div1">
						<span id="span1">번호</span>
						<span id="span2">
							<input type="hidden" name="p_Number" value="${p_Number}">
						</span>
					</div>
						
					<div id="div1">
						<span id="span1">제품명</span>
						<span id="span2">
							<input type="text" name="p_Name" required="required" autofocus="autofocus">
						</span>
					</div>
					<div id="div1">
						<span id="span1">색상</span>
						<span id="span2">
							<select name="p_Color" required="required">
								<option value="red">빨강</option>
								<option value="blue">파랑</option>
								<option value="green">초록</option>
							</select>
						</span>
					</div>
					<div id="div1">
						<span id="span1">가격</span>
						<span id="span2">
							<input type="text" name="p_Price" required="required">
						</span>
					</div>
					<div id="div1">
						<span id="span1">재고</span>
						<span id="span2">
							<input type="text" name="p_Quantity" required="required">
						</span>
					</div>
					<div id="div1">
						<span id="span1">등록일</span>
						<span id="span2">
							<input type="date" name="p_Regdate" required="required">
						</span>
					</div>
					<div id="div1">
						<span id="span1">제조사</span>
						<span id="span2">
							<input type="text" name="p_pcName" required="required">
						</span>
					</div>
					<div align="center">
						<span>
							<input type="submit" value="등록" class="btn btn-success"> 
						</span>
						<span>
							<input type="reset" value="취소" class="btn btn-danger">
						</span>
					</div>
				</div>
			</form>
		</section>
		<div class="col-12">
		</div>
	</div>
</body>
</html>