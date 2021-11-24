<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../newHeader.jsp" %>
<%@ include file="../sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#submitButtonButton').click(function() {
			
			var email = $('#email').val();
			var collName = $('#collName').val();
			var collDesc = $('#collDesc').val();
			alert($('#email').val());
			alert($('#collName').val());
			alert($('#collDesc').val());
			$.post("submitCollect.do", "email="+email+"&collName="+collName+"&collDesc="+collDesc, function (data) {
				
			});
		});
	});
</script>
<style>
.containerMargin{
	margin-top : 100px;
	color: black;
}
</style>
</head>
<body>

	<%-- <input type="text" name="movNum" value="${movie.movNum}">
	<input type="text" name="tvNum" value="${tv.tvNum}">
	<input type="text" name="email" value="${email}">
	<input type="text" name="collNum" value="${collect.collNum}"> --%>
<div class="container containerMargin">
	<form action="submitCollect.do">
	<div class="row">
	<input type="hidden" name="email" id="email" value="${email}">
		<div class="col-4">
				<textarea rows="1" name="collName" id="collName"
						placeholder="나만의 컬렌션 제목을 설정해 주세요"
						maxlength="50" class="form-control"></textarea>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-4">
				<textarea rows="4" name="collDesc" id="collDesc"
						placeholder="내용"
						maxlength="200" class="form-control"></textarea>
		</div>
		<input type="submit" value="등록" class="btn btn-danger">
	</div>
	</form>
	<hr>
			<%@ include file="searchCollect.jsp"%>
			<button type="button" class="ContentMyCommentSection_Button"
				data-toggle="modal" data-target=".bd-example-modal-lg"
				style="float: left;">영상 선택하기</button>
		<%-- <a href="searchCollect1.do">
		<div style="float: left; height: 120; width: 100;">
		<img alt="" src="<%=request.getContextPath() %>/images/${movie.movPic}" width="100" height="120" >
		</div>
		</a> --%>
		<div id="AddedCartList"></div>
	<%-- <div style="float: left; height: 120; width: 100;">
	<c:forEach items="${cartList }" var="list">
	<img alt="" src="<%=request.getContextPath() %>/images/${list}" width="100", height="120">	
	<a>${list }</a>
	</c:forEach>
	</div> --%>
	<hr>
	<hr>
	<hr>
	<div>
	<hr>
	<hr>
	<hr>
	<hr>
	<hr>
	
	 <!-- <button id="submitButtonButton">등록</button> -->
	<!-- <input type="submit" value="등록" class="btn btn-danger"> -->
	</div>
</div>

</body>
</html>