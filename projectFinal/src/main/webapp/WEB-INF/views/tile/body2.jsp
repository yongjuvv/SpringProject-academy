<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mainBody2 {
	overflow: scroll;
}

.img-container {
	float: center;
	padding-top: 50;
	padding-bottom: 50;
}

.team-container {
	margin-top: 30;
	padding-top: 50;
	float: center;
	margin-bottom: 30;
	padding-bottom: 50;
}

#body2Image {
	overflow: hidden;
	float: center;
	max-width: 100%;
	height: auto;
}

.font {
	margin-top: 10;
	padding-top: 10;
	font-style: italic;
	font-weight: bold;
	text-align: center;
}

#team {
	margin-top: 10;
	padding-top: 10;
	border-radius: 50%;
	width: 200;
	height: 200;
}

.font1 {
	margin-top: 10;
	padding-top: 10;
	font-style: italic;
	font-weight: bold;
	font-color: blue;
	text-align: center;
}



</style>
</head>
<body>
	<div class="container" id="mainBody2" align="center">
		<div class="img-container">
			<img alt="" src="resources/images/body2.gif" id="body2Image">
			<p class="font">내 펫의 실시간 장소를 확인하세요!
		</div>
		<div class="img-container" id="pad">
			<img alt="" src="resources/images/thirdBody2.png" id="body2Image">
			<p class="font">
				<br> 내 펫의 실시간 건강정보를 확인하고 펫의 건강을 관리하세요!
		</div>
		<div class="team-container">
			<h1 class="font">Mapping pet 팀원</h1>
			<table>
				<tr>
					<td align="center" colspan="2"><img alt=""
						src="resources/images/king.jpg" id="team"> <br>
					<p class="font1">our pet</p> <br>
					<p style="font-style: italic">The chairman</p></td>
				</tr>

				<tr>
					<td align="center">
						<div class="card" style="width: 180px;">
							<img class="card-img-top" src="resources/images/yongju.jpg"
								alt="Card image" style="width: 180px; height:240px;">
							<div class="card-body font1">
								<h4 class="card-title">Yongju</h4>
								<br>
								<p style="font-style: italic">고객센터 서비스 담당</p>
								<br>
								<p style="font-style: italic">펫 위치 조회 담당</p>
							</div>
						</div>
					</td>
					<td align="center">
						<div class="card" style="width: 180px;">
							<div class="card-body font1">
								<h4 class="card-title">Minsu</h4>
								<br>
								<p style="font-style: italic;">상품 정보 담당</p>
								<br>
								<p style="font-style: italic">펫 위치 조회 담당</p>
							</div>
							<img class="card-img-top" src="resources/images/minsu.jpg"
								alt="Card image" style="width: 180px; height:240px;">
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">
						<div class="card" style="width: 180px;">
							<img class="card-img-top" src="resources/images/gunchang.jpg"
								alt="Card image" style="width: 180px; height:240px;">
							<div class="card-body font1">
								<h4 class="card-title">Gunchang</h4>
								<br>
								<p style="font-style: italic">게시판 담당</p> 
								<br>
								<p style="font-style: italic">펫 건강관리 담당</p>
							</div>
						</div>
					</td>
					<td align="center">
						<div class="card" style="width: 180px;">
							<div class="card-body font1">
								<h4 class="card-title">Eunjun</h4>
								<br>
								<p style="font-style: italic">회원정보 담당</p> 
								<br>
								<p style="font-style: italic">펫 건강관리 담당</p>
							</div>
							<img class="card-img-top" src="resources/images/eunjun.jpg"
								alt="Card image" style="width: 180px; height:240px;">
						</div>
					</td>
					<!-- <td align="center"><img alt=""
						src="resources/images/gunchang.jpg" id="team"> <br>
					<p class="font1" stlye="font-color : blue">Gunchang</p> <br>
					<p style="font-style: italic">게시판 담당</p> <br>
					<p style="font-style: italic">펫 건강관리 담당</p></td>
					<td align="center"><img alt=""
						src="resources/images/eunjun.jpg" id="team"> <br>
					<p class="font1">Eunjun</p> <br>
					<p style="font-style: italic">회원정보 담당</p> <br>
					<p style="font-style: italic">펫 건강관리 담당</p></td> -->
				</tr>
			</table>

		</div>

	</div>


</body>
</html>