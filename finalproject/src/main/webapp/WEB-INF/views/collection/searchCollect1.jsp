<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* function search() {
		alert($('#searchCollect').val());
	var searchCollect = $('#searchCollect').val();
	$.post("list.do", "searchCollect="+searchCollect, function(data) {
		$('#list').html(data);
	});

} */
$(function () {
	$('#searchButton').click(function() {
		alert($('#searchCollect').val());
		var searchCollect = $('#searchCollect').val();
		$.post("list.do", "searchCollect="+searchCollect, function(data) {
			$('#list').html(data);
		});
	});
});
</script>
</head>
<body>
<input type="text" class="form-control" name="searchCollect" id="searchCollect" 
					placeholder="작품 제목, 배우, 감독을 검색해보세요." style="width: 270px">
					<button id="searchButton">검색</button>
					<div id="list"></div>
</body>
</html>