<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$.getJSON("http://localhost:8080/ch09/jsonBoard.do",
			function(data) {
				$.each(data, function() {
					$('#treeData').append(
						'<tr><td>'+this.subject+'</td>'+
						'<td>'+this.writer+'</td>'+
						'<td>'+this.reg_date+'</td>'+
						'<td>'+this.readcount+'</td></tr>');
				});
			});
	});
</script></head><body>
<div class="container">
<h2 class="text-primary">직원 목록</h2>
<table class="table table-bordered" id="treeData">
	<tr><td>제목</td><td>작성자</td><td>작성일</td>
		<td>조회수</td></tr>
</table>
</div>
</body>
</html>