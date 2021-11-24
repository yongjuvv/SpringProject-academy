<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
var action = '';
var type= '';
$(function() {
	$('#modalLoginForm').click(function() {
		action = 'create';
		type='POST'
		$('#modalLoginForm').modal();
	});
});
</script>
<style type="text/css">
@import url("${path}/css/header.css");
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
							<button class="joinButtonCss" data-toggle="modal" data-target="#modalJoinForm" id="modalJoinForm">회원가입</button>
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