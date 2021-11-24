<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul {
   background-color: #FFDAB9;
   width: 1000px;
   margin: auto;
   padding: 0;
   overflow: hidden;
   list-style-type: none;
}

li {
   float: left;
}

li a {
   display: block;
   background-color: #FFDAB9;
   color: #000000;
   padding: 30px;
   padding-right: 45px;
   padding-left: 45px;
   text-decoration: none;
   text-align: center;
   font-weight: bold;
}
/* li a:hover {
   background-color : #CD853F;
   color : white;
} */
li a.current {
   background-color: #FF6347;
   color: white;
}

li a:hover:not (.current ) {
   background-color: #CD853F;
   color: white;
}
</style>
</head>
<body>
<!-- logo -->
   <div align="center">
      <a href="main.html"><img src="images/logo.jpg" width="212px"></a>
   </div>
   
<!-- navigation bar -->
<div>
<nav id = "bar">
<ul>
<li><a href = "main.do">메인홈</a></li>
<li><a href = "mypage.do">마이페이지</a></li>
<li><a href = "">상품구매</a></li>
<li><a href = "">게시판</a></li>
<li><a href = "helplist.do">고객센터 게시판</a></li>
</ul>
</nav>

</div>

</body>
</html>