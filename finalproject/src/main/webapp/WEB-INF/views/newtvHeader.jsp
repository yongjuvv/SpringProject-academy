<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<script type="text/javascript">
var action = '';
var type= '';
$(function() {
	$('#modalLoginForm').click(function () {
		action = 'create';
		type='POST'
		$('#modalLoginForm').modal();
	});
});
</script>
<style type="text/css">
.TopNavTab {
	position: fixed;
	top: 0px;
	left: 0;
	z-index: 51;
	background: transparent;
	color: #fff;
	text-align: center;
	width: 100%;
	height: 72px;
	-webkit-transition: background-color 200ms;
	transition: background-color 200ms;
	background: white;
    height: 60px;
}
.NavRow{
	margin: 0 20px;
	height: 100%;
}
.TopNavTab_NavUl{
	overflow: hidden;
	list-style: none;
    padding: 0;
    margin: 0;
    height: 100%;
}
.TopNavTab_SearchContainer{
	width:400px;
	position: absolute;
    top: 0;
    right: 0;
    left: 0;
    margin: 0 auto;
    height: 100%;
}
.SearchInput_SearchFormBlock{
	margin-top: 0.6em;
}
.NavBasicFormInput{
	display: flex;
	-webkit-box-align: center;
	align-items: center;
    box-sizing: border-box;
    width: 100%;
    height: 44px;
    padding: 0 12px;
    border-radius: 6px;
    background: #f5f5f5;
    margin: 0;
}
.NavInputSearchIcon{
	margin-right: 15px;
	color: #999;
	margin-left: 5px;
}
.searchIcon{
	
}
.NavInputFormBlock{
	-webkit-flex: 1;
    -ms-flex: 1;
    flex: 1;
}
.InputFormSearch{
	font-size: 17px;
    font-weight: 400;
    letter-spacing: -0.7px;
    line-height: normal;
    background: transparent;
    width: 100%;
    padding: 0;
    border: 0;
    overflow: hidden;
    caret-color: #ff2f6e;
    -webkit-appearance: textfield;
    outline-offset: -2px;
    color: #1e1e1e;
}
.InputFormSearch:focus{
	outline: none;
}
.NavInputClear{
	display: -webkit-inline-box;
    display: -webkit-inline-flex;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    width: 24px;
    height: 100%;
    color: #999;
}
.NavInputClearButton{
	display: inline-block;
    background: no-repeat center;
    background-size: cover;
    width: 24px;
    height: 24px;
    cursor: pointer;
    top: 4px;
}
.TopNavTab_NavLogo{
	float: left;
    margin: 16px 0;
    display: list-item;
    text-align: -webkit-match-parent;
    font-size: 20px;
    display: block;
    color: #BD24A9;
    font-weight: 900;
}
.NavLogo{
	background-color: transparent;
}
.NavLogoCss{
	color: #BD24A9;
    font-weight: 900;
    font-size: 20px;
    letter-spacing: 1px;
}
.TopNavTab_NavList{
	display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    float: right;
    height: 74px;
    margin: 0 0 0 20px;
}
.loginButtonCss{
	color:#BD24A9;
	font-weight: 400;
	letter-spacing: -1px;
	margin-top: 8px;
    margin-bottom: 20;
    background-color: transparent;
    display: inline-block;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    user-select: none;
    background-image: none;
    border-radius: 4px;
    border: 1px solid #BD24A9;
}
.loginButtonCss:hover{
	background-color: #BD24A9;
	color: white;
}
.loginButtonCss:focus{
	outline: none;
}
.NavImgLogo{
	margin-bottom: 13px;
}
.NavSearchForm{
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<header class="TopNavTab">
		<nav>
			<div class="TopNavGrid">
				<div class="NavRow">
					<ul class="TopNavTab_NavUl">
						<li class="TopNavTab_NavLogo">
							<a href="searchForm.do" class="NavLogo"><span class="NavLogoCss">#HASHTAG</span></a>
						</li>
						<% if (session.getAttribute("email") == null) { %>
						<li class="TopNavTab_NavList">
							<%@include file="member/modalLoginForm.jsp" %>
							<button class="loginButtonCss" data-toggle="modal" data-target="#modalLoginForm" id="modalLoginForm">로그인</button>
						</li>
						<li class="TopNavTab_NavList">
							<%@include file="member/modalJoinForm.jsp" %>
							<button class="loginButtonCss" data-toggle="modal" data-target="#modalJoinForm" id="modalJoinForm">회원가입</button>
						</li>
						<%} else if (session.getAttribute("email") != null) {%>
						<li class="TopNavTab_NavList">
							<button class="loginButtonCss" onclick="location.href='logout.do'">로그아웃</button>
						</li>
						<li class="TopNavTab_NavList">
							<a href="myPage.do">
							<img alt="" src="https://2.bp.blogspot.com/-G0w5y_ViMG4/XDwpVaZBTCI/AAAAAAAAAAM/HtJC_DWav9cT1r0Hch87X0Xmy9YoymLsACLcBGAs/s1600/user.png" width="60px"
								class="NavImgLogo"></a>
						</li>
							<%} %>
						</ul>
						
						<div class="TopNavTab_SearchContainer">
							<div class="SearchInput_SearchFormBlock">
								<form class="NavSearchForm" action="searchResult.do">
									<label class="NavBasicFormInput">
										<div class="NavInputSearchIcon">
											<span class="glyphicon glyphicon-search searchIcon"></span>
										</div>
										<div class="NavInputFormBlock">
											<input type="text" class="InputFormSearch" name="search"
												placeholder="작품 제목, 배우, 감독을 검색해보세요." value="${tv.tvName}">
										</div>
										<div class="NavInputClear">
											<span
												class="NavInputClearButton glyphicon glyphicon-remove-sign"
												aria-label="clear" role="button"></span>
										</div>
									</label>
								</form>
							</div>
						</div>
				</div>
			</div>
		</nav>
	</header>