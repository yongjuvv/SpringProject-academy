<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("리뷰 삭제가 완료되었어요.");
			location.href = "myReviewList.do";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("리뷰 삭제 실패했어요.");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>