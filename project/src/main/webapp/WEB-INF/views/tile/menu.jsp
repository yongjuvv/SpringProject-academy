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
<nav class="navbar navbar-expand-sm navbar-dark fixed-top">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="main.do">Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="location.do">위치조회</a>
            </li>
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
                <a class="nav-link" href="#">게시판</a>
            </li>
            <li class="nav-item"><c:choose>
            <c:when test="${not empty cId }">
               <a class="nav-link" href="helplist.do">고객센터</a>
            </c:when>
            <c:when test="${empty cId }">
               
            </c:when>
         </c:choose></li>
            <li class="nav-item"><c:choose>
               <c:when test="${not empty cId }">
                  <a class="nav-link" href="mypage.do" >마이페이지</a>
               </c:when>
               <c:when test="${empty cId }">
                  <a class="nav-link" onclick="sessionChk()" href="loginForm.do" >마이페이지</a>
               </c:when>
            </c:choose></li>
            </ul>
            <ul class="navbar navbar-nav ml-auto w-50 justify-content-end">
            <li class="nav-item"><c:choose>
               <c:when test="${empty cId }">
                  <a class="nav-link" href="joinForm.do" >회원가입</a>
               </c:when>
               <c:when test="${not empty cId }">
                  <a class="nav-link" href="main.do" onclick="alreadyLogin()" >회원가입</a>
               </c:when>
            </c:choose></li>
         <li class="nav-item"><c:choose>
               <c:when test="${not empty cId }">
                  <a class="nav-link" href="logout.do" >로그아웃</a>
               </c:when>
               <c:when test="${empty cId}">
                  <a class="nav-link" href="loginForm.do" >로그인</a>
               </c:when>
            </c:choose></li>
        </ul>
</nav>

</body>
</html>