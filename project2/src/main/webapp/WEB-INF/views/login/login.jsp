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

<c:if test = "${result > 0 }">
<script type="text/javascript">
alert("로그인 성공")
location.href = "main.do";
</script>
</c:if>

<c:if test = "${result == 0 }">
<script type="text/javascript">
alert("비밀번호가 틀립니다.")
history.go(-1);
</script>
</c:if>

<c:if test = "${result == -1 }">
<script type="text/javascript">
alert("정보가 존재하지 않습니다.")
history.go(-1);
</script>
</c:if>


</body>
</html>