<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.UserPageRow{
	margin: 0 20px;
}
.cartListUl{
	list-style: none;
    padding: 0;
    margin: 0;
}
.cartListLi{
	display: list-item;
    text-align: -webkit-match-parent;
}
.CartInnerPartWithImage{
	align-items: center;
    color: inherit;
    text-decoration: none;
    height: 76px;
    display: flex;
}
.CartInnerPartWithImage_ImageBlock{
	height: 70;
    width: 56;
    margin-right:10;
}
.CartLazingLoadingBackgound{
	box-sizing: border-box;
    border: solid 1px rgba(0,0,0,0.08);
    border-radius: 3px;
    height: 70px
    width: 56px;
    margin: 0 12px 0 0;
}
.CartLazingLoadingBackgound_Image{
	display: inline-block;
    position: relative;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    height: 70px;
    width: 56px;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    opacity: 1;
    -webkit-transition: 300ms;
    transition: 300ms;
}
.CartInnerPartWithImage_Info{
	display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex: 1;
    -ms-flex: 1;
    flex: 1;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    box-sizing: border-box;
    height: 100%;
    border-bottom: 1px solid #f0f0f0;
    overflow: hidden;
    text-overflow: ellipsis;
}
.CartInnerPartWithImage_InfoTitle{
	    justify-content: center;
    padding: 0 10px 0 0;
    overflow: hidden;
    text-overflow: ellipsis;
    flex-direction: column;
    -webkit-box-pack: center;
    flex: 1;
    display: flex;
}
.cartTitleName{
	letter-spacing: -0.7px;
    line-height: 22px;
    font-size: 17px;
    font-weight: 400;
    color: #1f1f1f;
    white-space: nowrap;
    margin-bottom: 2px;
    overflow: hidden;
    text-overflow: ellipsis;
}
.cartTitleExtraInfo{
	font-size: 14px;
    font-weight: 400;
    letter-spacing: -0.3px;
    line-height: 19px;
    color: #8c8c8c;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
<body>

	<ul class="cartListUl">
		<c:forEach var="cart" items="${cartList}">
		<li class="cartListLi">
			<div class="CartInnerPartWithImage">
				<div class="CartInnerPartWithImage_ImageBlock">
					<div class="CartLazingLoadingBackgound">
						<div class="ImageBlock">
						<img alt="이미지" class="CartLazingLoadingBackgound_Image"
							src="<%=request.getContextPath()%>/images/${cart.movPic}">
						</div>
					</div>
				</div>
				<div class="CartInnerPartWithImage_Info">
					<div class="CartInnerPartWithImage_InfoTitle">
						<div class="cartTitleName">${cart.movName}</div>
						<div class="cartTitleExtraInfo">${cart.movGenre1} · <fmt:formatDate value="${cart.movDate}" pattern="yyyy" /></div>
					</div>
				</div>
			</div>
		</li>
		</c:forEach>
	</ul>
</body>
</html>