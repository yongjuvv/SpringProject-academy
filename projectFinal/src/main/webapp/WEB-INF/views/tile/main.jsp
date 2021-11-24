<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.font {
	font-style: italic;
	font-weight: bold;
	text-align: left;
	font-color: white;
}

#size {
	width: 250px;
	height: 60px;
	border-radius: 10%
}

#font2 {
	font-weight: bold;
	font-color: white;
}

.bi {
	max-width: 100%;
	height: 100%;
	background-image: url("resources/images/subBodyPic3.jpg");
	background-size: 100% 100%;
	background-repeat: no-repeat;
}

#pad1 {
	padding-top: 10%;
	padding-left: 5%;
	padding-right: 5%;
}

#pad2 {
	padding-bottom: -10%;
	padding-left: 5%;
}

#pad3 {
	padding-top: 5%;
}

#but {
	border: 2px solid skyblue;
	background-color: skyblue;
	color: white;
	width: 300px;
	height: 80px;
	border-radius: 50px;
}

#but1 {
	border: 2px solid white;
	background-color: rgba(0, 0, 0, 0);
	color: white;
	width: 300px;
	height: 80px;
	border-radius: 50px;
}
</style>

</head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>

	<!-- <!-- 	main body
	<div>
		<div class="container" id="mainBody" style="width: width: 100%;"></div>
	</div> -->
	<section class="bi">
		<div id="mainBody">
			<div class="form-row float-center">
				<div class="col-12 col-md-8 col-lg-6" id="pad1">
					<h1 id="font2" style="color: white;" align="left">언제 어디서든 당신의
						반려동물의 위치를 확인하세요.</h1>
					<br>
					<h2 id="font2" style="color: white;" align="left">반려동물의 건강상태를
						체크해주세요!</h2>
				</div>
			</div>
			<div class="form-row float-center" id="pad2" style="margin: auto;">
				<div class="col-12 col-xl-3 button-div" id="pad3">
					<c:choose>
						<c:when test="${not empty cId }">
							<a href="location.do">
								<button type="button" id="but1" style="font-size: 150%">Check
									Location</button>
							</a>
						</c:when>
						<c:when test="${empty cId }">
							<a href="loginForm.do">
								<button type="button" id="but1" style="font-size: 150%">Check
									Location</button>
							</a>
						</c:when>
					</c:choose>
				</div>
				<div class="col-12 col-xl-3 button-div" id="pad3">
					<c:choose>
						<c:when test="${not empty cId }">
							<a href="gonow.do">
								<button type="button" id="but" style="font-size: 150%">Check
									Health</button>
							</a>
						</c:when>
						<c:when test="${empty cId }">
							<a href="gonow.do">
								<button type="button" id="but" style="font-size: 150%">Check
									Health</button>
							</a>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</section>

</body>
</html>