<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file = "../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
      <tiles:insertAttribute name="title" />
</title>
<style type="text/css">
body { padding-top: 0px; }
/* @media screen and (max-width: 768px) {
    body { padding-top: 0px; }
} */

.dim{
	background-color:#696969; 
}

.smoke{
	background-color:#F5F5F5;
}

.black{
	background-color:black;
}

#mar {
	margin-top: 60px;
}

.black{
	background-color: #353535;
}
</style>
</head><body>

<section class="bg-dark">
	<tiles:insertAttribute name = "menu"/>
	<%-- <tiles:insertAttribute name = "header1"/> --%>
</section>
<section id="mar">
		<tiles:insertAttribute name = "body1"/>
		<tiles:insertAttribute name = "body2"/>  	
</section>
<section class="black">
		<tiles:insertAttribute name = "footer"/>
</section>

</body>
</html>