<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mainBody2{
overflow : scroll;
}
.img-container{
margin : 20;
padding : 20;
float : center;
}
.team-container{
margin : 50;
padding : 50;
float : center;

}


#body2Image{
overflow : hidden;
float : center;
max-width:100%;
height:auto;
}

.font{
margin : 10;
padding 10;
font-style : italic;
font-weight : bold;
text-align :center;
}
#team{
margin : 10;
padding : 10;
border-radius : 50%;
width : 200;
height : 200;
}
.font1{
margin : 10;
padding 10;
font-style : italic;
font-weight : bold;
font-color : blue;
text-align :center;

}
</style>
</head>
<body>
   <div class="main-container" id="mainBody2">
      <div class="img-container">
         <img alt="" src="resources/images/body2.gif" id="body2Image">
         <p class="font">내 펫의 실시간 장소를 확인하세요!
      </div>
      <div class="img-container">
         <img alt="" src="resources/images/thirdBody2.png" id="body2Image">
         <p class = "font"><br> 내 펫의 실시간 건강정보를 확인하고 펫의 건강을 관리하세요!
      </div>
      <div class = "team-container">
         <h1 class = "font">Mapping pet 팀원</h1>
            <table>
               <tr>
                  <td align = "center" colspan = "2"><img alt="" src="resources/images/king.jpg" id = "team">
                     <br><p class = "font1">our pet</p>
                     <br><p style = "font-style : italic">The chairman</p>
                  </td></tr>

               <tr>
                  <td align = "center"><img alt="" src="resources/images/yongju.jpg" id = "team" style=” display:block;”>
                     <br><p class = "font1">Yongju</p>
                     <br><p style ="font-style : italic">고객센터 서비스 담당</p>
                     <br><p style = "font-style : italic">펫 위치 조회 담당</p>
                  </td>
                  <td align = "center"><img alt="" src="resources/images/minsu.jpg" id = "team">
                     <br><p class = "font1">Minsu</p>
                     <br><p style = "font-style : italic;">상품 정보 담당</p>
                     <br><p style = "font-style : italic">펫 위치 조회 담당</p>
                  </td>
               </tr>
               <tr>
                  <td align = "center"><img alt="" src="resources/images/gunchang.jpg" id = "team">
                     <br><p class = "font1" stlye = "font-color : blue">Gunchang</p>
                     <br><p style = "font-style : italic">게시판 담당</p>
                     <br><p style = "font-style : italic">펫 건강관리 담당</p>
                  </td>   
                  <td align = "center"><img alt="" src="resources/images/eunjun.jpg" id = "team">
                     <br><p class = "font1">Eunjun</p>
                     <br><p style = "font-style : italic">회원정보 담당</p>
                     <br><p style = "font-style : italic">펫 건강관리 담당</p>
                  </td>
               </tr>
            </table>
         
     </div>      
      
   </div>


</body>
</html>