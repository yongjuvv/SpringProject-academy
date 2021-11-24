<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
<style>
.font{
font-style : italic;
font-weight : bold;
text-align : left;
font-color : white;
}
#size{
   width:200px;
   height:100px;
}

#pad{
   padding:5%;
   border-radius:10%;
}

#font2{
   font-weight : bold;
   font-color : white;
}

.navbar{
   min-height:100px;
   height:auto;
   max-width:100%;
}
#left{
   float:left;
   padding-left: 2%;
}
#right{
   float:right;
   padding-right:2%;
}

</style>
</head>
<script type="text/javascript">
function sessionChk() {
   alert('로그인을 해주세요.');
}
function alreadyLogin() {
   alert('이미 로그인 되어 있습니다.')
}
</script>
</head>
<body>
<!-- Grey with black text -->
   <nav class="navbar navbar-expand-md navbar-dark bg-dark navbar-fixed-top"
      role="navigation">
      <a class="navbar-brand" href="main.do" id="left">MAPPING PET</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#collapsibleNavbar">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
         <ul class="navbar-nav mr-auto" id="left">
            <li class="nav-item">
               <c:choose>
                  <c:when test="${not empty cId }">
                     <a class="nav-link" href="PBview.do">기기구매</a>
                  </c:when>
                  <c:when test="${empty cId }">
                     <a class="nav-link" href="PBview2.do">기기구매</a>
                  </c:when>
               </c:choose>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="boardList.do">게시판</a>
            </li>
            <li class="nav-item">
               <c:choose>
                  <c:when test="${not empty cId }">
                     <a class="nav-link" href="helplist.do">고객센터</a>
                  </c:when>
                  <c:when test="${empty cId }">

                  </c:when>
               </c:choose>
            </li>
            <li class="nav-item">
               <c:choose>
                  <c:when test="${not empty cId }">
                     <a class="nav-link" href="mypage.do">마이페이지</a>
                  </c:when>
                  <c:when test="${empty cId }">
                     <a class="nav-link" onclick="sessionChk()" href="loginForm.do">마이페이지</a>
                  </c:when>
               </c:choose>
            </li>
         </ul>
         <ul class="dropdown-menu">
            <li class="nav-item"><a href="#">Test1</a></li>
            <li class="nav-item"><a href="#">Test2</a></li>
         </ul>
         <ul class="navbar-nav ml-auto justify-content-end" id="right">
            <li class="nav-item">
               <c:choose>
                  <c:when test="${empty cId }">
                     <a class="nav-link" href="joinForm.do">
                        <span class="glyphicon glyphicon-user"></span> 회원가입
                     </a>
                  </c:when>
                  <c:when test="${not empty cId }">
                     <a class="nav-link" href="main.do" onclick="alreadyLogin()">
                        <span class="glyphicon glyphicon-user"></span> 회원가입
                     </a>
                  </c:when>
               </c:choose>
            </li>
            <li class="nav-item">
               <c:choose>
                  <c:when test="${not empty cId }">
                     <a class="nav-link" href="logout.do">
                        <span class="glyphicon glyphicon-log-out"></span> 로그아웃
                     </a>
                  </c:when>
                  <c:when test="${empty cId}">
                     <a class="nav-link" href="loginForm.do">
                        <span class="glyphicon glyphicon-log-in"></span> 로그인
                     </a>
                  </c:when>
               </c:choose>
            </li>
         </ul>
      </div>
   </nav>
   <jsp:include page="locationTest2.html"></jsp:include>
</body>
</html>