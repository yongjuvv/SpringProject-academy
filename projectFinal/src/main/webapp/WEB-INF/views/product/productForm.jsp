<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
	<h2>상품정보 입력</h2>
	<form action="product.do" method="post" id="frm">
		<table class="table table-hover">
			<tr>
				<td>제품명</td>
				<td><input type="text" name="pName" required="required" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td>색상</td>
				<td>
					<select name="pColor" required="required">
						<option value="red">빨강</option>
						<option value="blue">파랑</option>
						<option value="green">초록</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="pPrice" required="required"></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="text" name="pQuantity" required="required"></td>
			</tr>
			<tr>
				<td>제조사</td>
				<td><input type="text" name="pCompany" required="required"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td cols="2" align="center">
					<input type="submit" value="등록" class="btn btn-success"> 
					<input type="reset" value="취소" class="btn btn-danger">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>