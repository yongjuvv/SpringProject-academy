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
.container{
   max-width:900px;
}

.black{
   background-color:black;
}

.dim{
   background-color:#696969;
}


</style>
</head><body>

<section class="black">
      <div class="container-xl" align = "center">
         <tiles:insertAttribute name = "header1"/>
      </div>
</section>
<section class="black">
      <tiles:insertAttribute name = "menu"/>
</section>
<section>
      <tiles:insertAttribute name = "subBody"/>
</section>
<section>

</section>
<section>
   <div class="container-xl" align = "center">
      <tiles:insertAttribute name = "body1"/>
   </div>
</section>
<section>
   <div class="container-xl" align = "center">
      <tiles:insertAttribute name = "body2"/>  
   </div>
</section>
<section class="dim">
   <div class="container-xl" >
      <tiles:insertAttribute name = "footer"/>
   </div>
</section>

</body>
</html>