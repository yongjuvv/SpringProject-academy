<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input.or_count {
	outline: green;
	outline-color: green;
}

input.or_totalCost {
	width: 80px;
	outline: green;
	outline-color: green;
}

#order {
	padding: 5%;
	align-self: center;
}

.row {
	padding-bottom: 2%;
}

button {
	border: none;
}

.circle {
	radius: 50%;
	width: 22px;
	height: 22px;
	width: 22px;
}

#opt-qty-minus {
	width: 30px;
	height: 30px;
}

#opt-qty {
	width: 30px;
	height: 30px;
}

#opt-qty-plus {
	width: 30px;
	height: 30px;
}

#100 {
	width: 100px;
}

.cbox {
	max-width: 500px;
	height: auto;
	align: center;
}

form {
	padding: 2%;
	border-color: yellow;
	border: thin;
}

.jubotron{
	font-size: small;
	max-height:200px;
	
}

#priceinfo{
	background-color: #EAEAEA;
	max-height:auto;
}

.container-fluid{
	padding:2%;
}

#pad1{
	padding-top:5%;
}

#delivery{
	padding:2%;
}

#buy{
	padding:2%;
}

#but3{
	border:2px solid yellow;
	background-color: yellow;
	color:black;
	width: 300px;
	height: 80px;
	font-size: large;
}
</style>
<script type="text/javascript">
	$(function() {

		todayIs();

		function todayIs() {
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth() + 1; // Jan is 0
			var yyyy = today.getFullYear();

			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}

			today = yyyy + '-' + mm + '-' + dd;
			frm1.or_date.value = today;
		}
	});

	$(function() {

		ordernum();

		function ordernum() {
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth() + 1; // Jan is 0
			var yyyy = today.getFullYear();

			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}

			//var rand = Math.floor(Math.random()*10000)+1;
			var rand = (Math.random() * 9) + 1;
			var rand1 = rand.toFixed(3) * 1000;
			var rnum = parseInt(rand1);

			var y = yyyy.toString();
			var m = mm.toString();
			var d = dd.toString();
			var r = rnum.toString();
			today = y + m + d + r;
			today1 = parseInt(today);
			/* 			alert(today1); */
			frm1.orNumber.value = today1;
		}
	});

	function sessionChk() {
		alert('로그인을 해주세요.');
	}
	function alreadyLogin() {
		alert('이미 로그인 되어 있습니다.')
	}

	function plus() {
		var plus1 = parseInt(frm1.or_count.value) + 1;
		frm1.or_count.value = plus1;

		var cost = frm1.or_count.value * 85000;
		var cost1 = parseInt(cost);
		frm1.or_totalCost.value = cost1;
		$("#pdcost").text(cost1);
		$("#pdcost2").text(cost1);
		$("#pdcost3").text(cost1);
	}

	function minus() {
		var minus1 = parseInt(frm1.or_count.value)
		if (minus1 <= 0) {
			minsu1 = 1;
		} else {
			minus1 = minus1 - 1;
		}
		frm1.or_count.value = minus1;

		var cost = frm1.or_count.value * 85000;
		var cost1 = parseInt(cost);
		frm1.or_totalCost.value = cost1;
		$("#pdcost").text(cost1);
		$("#pdcost2").text(cost1);
		$("#pdcost3").text(cost1);
	}

	function colVal() {
		var color = frm1.or_color.value;
		if (color == "Blue") {
			var Blue = "MAPPING_PM_01BLUE";
			$("#pdcolor").text(Blue);
			frm1.or_name.value=Blue;
		} else {
			var Sky = "MAPPING_PM_01SKY";
			$("#pdcolor").text(Sky);
			frm1.or_name.value=Sky;
		}
	}

	/* $(function() {
		costVal();
		function costVal() {
			
			// $("#or_totalCost").text(cost);
		}
	}); */
</script>
</head>
<body>
	<div id="order" align="center">
		<h2>바로구매</h2>
		<div class="container-fluid">
			<div class="cbox">
				<form action="order.do" name="frm1" method="post">
					<!-- 주문상품 -->
					
					<div id="product">
					<h4 align="left">주문상품</h4>
						<div class="hidden">
							<div class="hidden">주문번호</div>
							<div>
								<input type="hidden" name="id" value="${member.id}"> <input
									type="number" name="orNumber" id="orNumber" class="hidden">
							</div>
						</div>
						<div class="hidden">
							<div class="hidden">
								<input type="hidden" name="or_date" id="or_date">
								<!-- 주문일 -->
							</div>
						</div>

						<div class="row" id="100">
							<div class="col-12 col-sm-4">
								<img alt="" src="resources/images/red.PNG" width="150px">
							</div>
							<div class="col-12 col-sm-8">
								<div class="col-12">
									<div align="left">
										<p>반려동물 위치추적기/위치추적/건강상태체크/색상2종</p>
									</div>
									<div align="left">
										<p id="pdcolor"></p>
										<input type="hidden" name="or_name">
									</div>
									<div class="row">
										<div class="col-12 col-sm-3" align="left">
											<p>색상</p>
										</div>
										<div class="col-12 col-sm-9">
											<select name="or_color" id="or_color" required="required"
												onchange="colVal()">
												<option value="Blue" selected="selected">파랑</option>
												<option value="Skyblue">하늘</option>
											</select>
										</div>
									</div>
									<div align="left">
										<label>QTY:</label> 
										<span>
											<button type="button" id="opt-qty-minus" onclick="minus()">
												<span class="circle"> 
													<i class="fas fa-minus-circle"></i>
												</span>
											</button>
										</span> 
										<span> 
											<input type="number" name="or_count"
											id="opt-qty" value="1" readonly="readonly"
											onchange="costVal()" class="or_count">
										</span> 
										<span>
											<button type="button" id="opt-qty-plus" onclick="plus()">
												<span class="circle"> 
													<i class="fas fa-plus-circle"></i>
												</span>
											</button>
										</span>
									</div>

								</div>
							</div>
						</div>
						
						<!-- 가격정보 -->
						<div id="priceinfo">
							<div  id="pad1">
								<div class="row">
									<div class="col-12 col-sm-6" style="text-align: left;">
										<p align="left">상품금액</p>
									</div>
									<div class="col-12 col-sm-6" style="text-align:right;">
										<div class="hidden">
											<input type="number" name="or_totalCost" id="or_totalCost"
												readonly="readonly" class="or_totalCost">
										</div>
										<p id="pdcost2"></p>
									</div>
								</div>
								<div class="row"> 
									<div class="col-12 col-sm-6" style="text-align: left;">
										<p>배송비</p>
									</div>
									<div class="col-12 col-sm-6" style="text-align:right;">
										<p>0원</p>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-6" style="text-align: left;">
										<p>할인금액</p>
									</div>
									<div class="col-12 col-sm-6" style="text-align:right;">
										<p>0원</p>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-6" style="text-align: left;">
										<p>결제금액</p>
									</div>
									<div class="col-12 col-sm-6" style="text-align:right;">
										<p id="pdcost"></p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>
					<!-- 배송정보 -->
					
					<div id="delivery">
					<h4 align="left">배송정보</h4>
						<p align="left">수령인</p>
						<div class="row">
							<div class="col-12 col-sm-6" align="left">
								${member.name }
							</div>
							<div class="col-12 col-sm-6" align="right">
								<p name="phone">${member.phoneNumber }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-sm-6" align="left">배송지</div>
							<div class="col12 col-sm-6" align="right">
								<input type="text" name="or_deliveryLocation"
									id="or_deliveryLocation" required="required"
									autofocus="autofocus">
								<!-- <input type="submit" class="btn btn-success btn-sm" value="주소 조회"> -->
							</div>
						</div>
					</div>

					<!-- 결제정보 -->
					<div id="buy">
						<h4 align="left">결제정보</h4>
						<div class="row">
							<div class="col-12 col-sm-6" align="left">결제수단</div>
							<div class="col-12 col-sm-6" align="right">
								<select name="or_buyType" id="or_buyType">
									<option value="credit">신용카드</option>
									<option value="send">무통장 입금</option>
									<option value="phone">휴대폰</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-sm-6" align="left">총 결제금액</div>
							<div class="col-12 col-sm-6" align="right">
								<p id="pdcost3"></p>
							</div>
						</div>
					</div>




					<div style="align-self: center; background-color: yellow" >
						<div align="center">
							<button class="" id="but3">결제하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>