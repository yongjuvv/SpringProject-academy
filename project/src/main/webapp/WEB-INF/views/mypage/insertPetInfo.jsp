<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function alreadyLogin() {
	alert('이미 로그인 되어 있습니다.')
}
function sessionChk() {
	alert('로그인을 해주세요.');
}
</script>
<script type="text/javascript">
function petNumberChk() {
	if(!frm.petNumber.value){
		alert('펫 넘버를 입력해주세요!')
		frm.petNumber.focus(); return false;
	}
	$.post('petNumberChk.do', 'petNumber='+frm.petNumber.value, function(data) {
		$('#disp').html(data);
	})
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 펫 정보 입력 body -->
	<h2 class="text-primary" align="center">펫 정보 입력하기</h2>
	<div class="container">
		<form action="insertPetInfo2.do" method="post" name = "frm">
			<table class="table table-striped">
				<tr>
					<td>펫 번호</td>
					<td><input type="text" name="petNumber" autofocus="autofocus"
						required="required"><input type = "button" onclick = "petNumberChk()" value = "중복체크">
						<div id = "disp" class = "err"></div></td>
				</tr>
				<tr>
					<td>펫 이름</td>
					<td><input type="text" name="pet_name" required="required"></td>
				</tr>
				<tr>
					<td>펫 성별</td>
					<td><input type="radio" name="pet_sex" required="required" value = "m">
					<label for = "man">MALE</label>
					<input type = "radio" name = "pet_sex" required="required" value = "w">
					<label for = "woman">FEMALE</label></td>
				</tr>
				<tr>
					<td>펫 유형</td>
					<td><input type="text" name="pet_type" required="required"></td>
				</tr>
				<tr>
					<td>펫 나이</td>
					<td><input type="number" name="pet_age" required="required"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center"><input type="submit" value="입력"></td>
				</tr>
			</table>
		</form>
	</div>


</body>
</html>