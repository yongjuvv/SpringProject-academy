<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<input type="number" value="${result }">
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("비밀번호가 변경되었습니다.");
			location.href = "logout.do";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("수정 실패");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>