<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result>0 }">
		<script type="text/javascript">
			alert("펫 정보 입력 완료")
			location.href = "main.do"
		</script>
	</c:if>

	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("펫 정보 입력을 실패하셨습니다.")
			history.go(-1)
		</script>
	</c:if>

	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("펫 넘버가 이미 존재합니다.")
			history.go(-1)
		</script>
	</c:if>


</body>
</html>