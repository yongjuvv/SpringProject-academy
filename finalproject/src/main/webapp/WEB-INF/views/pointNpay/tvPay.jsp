<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="../sessionChk.jsp"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 결제 완료</title>
</head>
<body>
	<c:if test="${result > 0}">
	<c:if test="${tvNum>0 }">
		<script type="text/javascript">
			alert("${tvName} ${tvEpNum}화의 결제가 완료되었어요.");
			location.href = "tvSearchResult.do?tvNum=${tvNum}";
		</script>
	</c:if>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("결제실패");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result < 0}">
		<script type="text/javascript">
			alert("이미 결제한 회차 입니다");
			history.go(-1);
		</script>
	</c:if>

</body>
</html>