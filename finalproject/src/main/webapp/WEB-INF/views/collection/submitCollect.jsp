<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:if test="${result1>0}">
		<script type="text/javascript">
			location.href = "myCollectionList.do";
		</script>
	</c:if>
	<c:if test="${result1 == 0 }">
		<script type="text/javascript">
			alert('실패');
		</script>
	</c:if>
</body>
</html>