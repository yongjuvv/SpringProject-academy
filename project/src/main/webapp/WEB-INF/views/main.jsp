<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
<script type="text/javascript">
   function sessionChk() {
      alert('로그인을 해주세요.');
   }
   function sessionChk2() {
	  alert('로그인 이후에 사용할 수 있습니다.');
	   }
   function alreadyLogin() {
      alert('이미 로그인 되어 있습니다.')
   }
</script>

</head>
<body>
   <!-- 로고창 -->

   <div class="container" align="center">
      <a href="main.do"><img src="resources/images/logo.jpg"
         width="212px"></a>
   </div>

   <!-- 위치조회 창 -->
   <div class="container"
      style="border: 1px solid #BDBDBD; width: 1000px; height: 285px;">
      <div style="border: 1px solid #BDBDBD; width: 500px; height: 285px;">
         <img src="resources/images/mainPhoto.jpg">
      </div>
   </div>
   <!--네비게이션 바 -->
   <div class="container" align="center">
      <!-- Links -->
      <ul>
         <li><a href="main.do">Home</a></li>
         <li><a href="PBview.do">기기구매</a></li>
         <li><a href="location.do">위치조회</a></li>
         <li><a href="">게시판</a></li>
         <li><c:choose>
         	<c:when test="${not empty cId }">
         		<a href="helplist.do">고객센터</a>
         	</c:when>
         	<c:when test="${empty cId }">
         		<a onclick="sessionChk()" href="loginForm.do">고객센터</a>
         	</c:when>
         </c:choose></li>
      
         <li><c:choose>
               <c:when test="${not empty cId }">
                  <a href="mypage.do">마이페이지</a>
               </c:when>
               <c:when test="${empty cId }">
                  <a onclick="sessionChk()" href="loginForm.do">마이페이지</a>
               </c:when>
            </c:choose></li>
         <!-- <li><a href="mypage.do">마이페이지</a></li> -->
         <!-- <li><a href="joinForm.do">회원가입</a></li> -->
         <li><c:choose>
               <c:when test="${empty cId }">
                  <a href="joinForm.do">회원가입</a>
               </c:when>
               <c:when test="${not empty cId }">
                  <a href="main.do" onclick="alreadyLogin()">회원가입</a>
               </c:when>
            </c:choose></li>
         <li><c:choose>
               <c:when test="${not empty cId }">
                  <a href="logout.do">로그아읏</a>
               </c:when>
               <c:when test="${empty cId}">
                  <a href="loginForm.do">로그인</a>
               </c:when>
            </c:choose></li>
      </ul>
   </div>

   <!-- main body -->
   <div>
      <div class="container" id="mainBody"
         style="border: 1px solid #BDBDBD; width: 1000px; height: 285px;"></div>
   </div>
   <!-- footer -->
   <div class="container" id="footer"
      style="border: 1px solid #BDBDBD; width: 1000px; height: 285px;"></div>

</body>
</html>