<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container">
<form action="mail.html">
<table class="table table-bordered">
	<caption class="text-primary">메일 보내기</caption>
	<tr><td>받는 사람</td><td><input type="email" name="email"
		required="required" autofocus="autofocus"></td></tr>
	<tr><td>제목</td><td><input type="text" name="title"
		required="required"></td></tr>
	<tr><td>내용</td><td><textarea rows="5" cols="40" 
		name="content" required="required"></textarea></td></tr>
	<tr><td colspan="2"><input type="submit"></td></tr>
</table>
</form>
</div>
</body>
</html>