<%-- <%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String fileSave = "/fileSave";
		String real = application.getRealPath(fileSave);
		int max = 1024 * 1024 * 10;
		MultipartRequest mr = new MultipartRequest(request, real, max, "utf-8", new DefaultFileRenamePolicy());
		String fileName = mr.getFilesystemName("file");
		String original = mr.getOriginalFileName("file");
		File file = new File(real + "/" + fileName);
		int size = (int) file.length();
	%>
	<h2>파일 업로드 결과</h2>
	파일명 :
	<%=fileName%><br> 본이름 :
	<%=original%><br> 크기 :
	<%=size%><br>
	<a href="../fileSave/<%=fileName%>">파일보기</a>
</body>
</html> --%>