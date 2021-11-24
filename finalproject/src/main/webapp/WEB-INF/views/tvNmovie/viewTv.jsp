<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<video src="<%=request.getContextPath()%>/tv/${tvEp.tvEpVid}" controls="controls" autoplay="autoplay"
	preload="auto" height="500"></video>
</body>
</html>