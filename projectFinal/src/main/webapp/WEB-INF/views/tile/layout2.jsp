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
</head><body>

<section>
<div class = "container" align = "center">
   <table class = "table table-bordered">
      <tr height = "10%">
         <td colspan = "2" align = "center">
            <tiles:insertAttribute name = "header1"/>
         </td>
      </tr>
      <tr height = "20%">
         <td colspan = "2" align = "center">
            <tiles:insertAttribute name = "subBody"/>
         </td>
      </tr>
      <tr height = "10%">
         <td colspan ="2" align = "center">
            <tiles:insertAttribute name = "menu"/>
         </td>
      </tr>
      <tr height = "20%">
         <td colspan = "2" align = "center">
            <tiles:insertAttribute name = "body1"/>
         </td>
      </tr>
      <tr height = "20%">
         <td colspan = "2" align = "center">
            <tiles:insertAttribute name = "body2"/>
         </td>         
      </tr>
      <tr height = "10%">
         <td colspan = "2" align = "center">
            <tiles:insertAttribute name = "footer"/>
         </td>
      </tr>
   </table>
</div>
</section>

</body>
</html>