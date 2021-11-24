<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#pb .container {
	max-width: auto;
	height: auto;
	padding: 10px;
	margint: 10px;
	align="center"
}

img {
	align: center;
}

#but {
	border: 2px solid skyblue;
	background-color: skyblue;
	color: white;
	width: 300px;
	height: 80px;
	border-radius: 50px;
}

#padd{
	padding-top: 3%;
	padding-bottom: 3%;
}

</style>
</head>
<script type="text/javascript">
	// 댓글 펑션
	$(function() {
		$('#pbrbdListDisp').load(
				'${path}/PBreplyList/pNumber/${rpdboard.pNumber}');
		$('#pbrInsert').click(function() {
			var sendData = $('#frm').serialize();
			$.post('${path}/pbrInsert', sendData, function(data) {
				alert('댓글이 작성 되었습니다');
				$('#pbrbdListDisp').html(data);
				frm.pbr_content.value = "";
			});
		});
	});

	function sessionChk() {
		alert('로그인을 해주세요.');
	}
	function alreadyLogin() {
		alert('이미 로그인 되어 있습니다.')
	}
</script>
<body>
	<div id="pb">
		<div class="container">
			<div class="row row-ie-fix">
				<!-- 상품 사진 -->
				
				<div class="container col-12 col-lg-6 div-ie-fix" align="center">
					<div class="col-12" id="padd">
						<h1>Mapping Device</h1>
					</div>
					<div class="col-12" id="padd">
						<img alt="" src="resources/images/red.jpg" width="400px">
					</div>
					<div class="col-12" id="padd">
						<label>제품상세</label><br>
						<table class="table table-bordered">
							<tr>
								<td>제품명 : </td>
								<td></td>
							</tr>
							<tr>
								<td>색상 : </td>
								<td></td>
							</tr>
							<tr>
								<td>사이즈 : </td>
								<td></td>
							</tr>
							<tr>
								<td> : </td>
								<td></td>
							</tr>
							<tr>
								<td>제품명 : </td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>

				<!-- 상품 내용 -->
				<div class="container col-12 col-lg-6 div-ie-fix">
					<div align="left" class="col-12" id="padd">
						<h2>디바이스에 내장된 GPS와 신체센서로 위치조회와 건강상태조회 가능!</h2>
					</div>
					<div align="left" class="col-12" id="padd">
						<h4>위치추적 등 모든 기능은 홈페이지를 통해 가능합니다. 더하여 별도의 이용료는 부가되지 않습니다.</h4>
						<h4></h4>
					</div>
					<div align="center" class="col-12" id="padd">
						<c:choose>
							<c:when test="${empty cId }">
								<a href="loginForm.do">
									<button id="but">구매</button>
								</a>
							</c:when>
							<c:when test="${not empty cId }">
								<a href="orderFormRed.do" name="order" onsubmit="return chk()">
									<button id="but">구매</button>
								</a>
							</c:when>
						</c:choose>
					</div>
					<div align="center" class="col-12" id="padd">
						<img alt="" src="resources/images/paylogo.png" width="400px">
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<!-- 댓글 설명란 밑 작성 -->
			<div class="col-12">
				<div>
					<h2>댓글 작성</h2>
				</div>

				<!-- 별점/댓글 입력 -->
				<div class="col-12">
					<!-- 별점 -->
					<div></div>

					<!-- 댓글 -->
					<form name="frm" id="frm">
						<div>
							<table class="table table-hover">
								<tr>
									<td><textarea rows="3" cols="30" name="PBreplytext"></textarea>
									</td>
								</tr>
								<tr>
									<td align="right"><input type="submit" name="pbr_content"
										value="댓글등록" class="btn btn-success btn-sm" id="pbrInsert"></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 댓글들 -->
		<div id="pbrbdListDisp"></div>
	</div>
	</div>
</body>
</html>