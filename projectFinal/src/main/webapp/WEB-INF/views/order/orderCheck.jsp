<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
   <table class="table table-hover">
      <tr>
         <td>주문자</td>
         <td><p name="id">${member.id}</p></td>
      </tr>
      <tr>
         <td>주문번호</td>
         <td>${order.orNumber}</td>
      </tr>
      <tr>
         <td>주문일자</td>
         <td>${order.or_date}</td>
      </tr>
      <tr>
         <td>상품정보</td>
         <td>
            <table>
               <tr>
                  <td>품명</td>
                  <td>${order.or_name}<td>
               </tr>
               <tr>
                  <td>색상</td>
                  <td>${order.or_color}</td>
               </tr>
               <tr>
                  <td>수량</td>
                  <td>${order.or_count}</td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td>결제금액</td>
         <td>${order.or_totalCost}</td>
      </tr>
      <tr>
         <td>배송지</td>
         <td>${order.or_deliveryLocation}</td>
      </tr>
      <tr>
         <td>배송상태</td>
         <td>${order.or_deliveryState}</td>
      </tr>
   </table>
   
   
   
</div>
</body>
</html>