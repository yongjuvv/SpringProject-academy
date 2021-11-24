<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	var action = '';
	var type = '';
	$(function() {
		$('#modalLoginForm').click(function() {
			action = 'create';
			type = 'POST'
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
}

.TopNavTabScroll {
	position: fixed;
	top: 0px;
	left: 0;
	z-index: 51;
	background: #fff;
	color: #fff;
	text-align: center;
	width: 100%;
	height: 72px;
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.10), 0 0 0 0 #D2D2D2;
	transition: background-color 200ms;
}

.NavRow {
	margin: 0 20px;
	height: 100%;
}

.TopNavTab_NavUl {
	overflow: hidden;
	list-style: none;
	padding: 0;
	margin: 0;
	height: 100%;
}

.TopNavTab_SearchContainer {
	width: 400px;
	position: absolute;
	top: 0;
	right: 0;
	left: 0;
	margin: 0 auto;
	height: 100%;
}

.SearchInput_SearchFormBlock {
	margin: 12px 0;
}

.NavBasicFormInput {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	box-sizing: border-box;
	width: 100%;
	height: 48px;
	padding: 0 12px;
	border-radius: 6px;
	background: #f5f5f5;
	margin: 0;
	background: rgba(0, 0, 0, 0.2);
	border: 1px solid rgba(255, 255, 255, 0.25);
}

.NavBasicFormInputScroll {
	display: flex;
	align-items: center;
	width: 100%;
	background: #f5f5f5;
	box-sizing: border-box;
	height: 48px;
	border-radius: 6px;
}

.NavInputSearchIcon {
	margin-right: 15px;
	color: #999;
	margin-left: 5px;
}

.searchIcon {
	
}

.NavInputFormBlock {
	-webkit-flex: 1;
	-ms-flex: 1;
	flex: 1;
}

.InputFormSearch {
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
	color: #FFF;
}

.InputFormSearchScroll {
	background: transparent;
	width: 100%;
	padding: 0;
	border: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	caret-color: #ff2f6e;
	color: black;
}

.InputFormSearch:focus {
	outline: none;
}

.NavInputClear {
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

.NavInputClearButton {
	display: inline-block;
	background: no-repeat center;
	background-size: cover;
	width: 24px;
	height: 24px;
	cursor: pointer;
	top: 4px;
}

.TopNavTab_NavLogo {
	float: left;
	margin: 23px 0;
	display: list-item;
	text-align: -webkit-match-parent;
	display: block;
}

.NavLogo {
	background-color: transparent;
}

.NavLogoCss {
	color: #FFF;
	font-weight: 900;
	font-size: 21px;
	letter-spacing: 1px;
}

.NavLogoCssScroll {
	color: #ff2f6e;
	font-weight: 900;
	font-size: 21px;
	letter-spacing: 1px;
}

.TopNavTab_NavList {
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
}

.loginButtonCss {
	color: #FFF;
	font-weight: 500;
	letter-spacing: -1px;
	background-color: transparent;
	display: inline-block;
	padding: 6px 12px;
	font-size: 15px;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	touch-action: manipulation;
	cursor: pointer;
	user-select: none;
	background-image: none;
	border-radius: 4px;
	border: none;
}

.loginButtonCssScroll {
	background: transparent;
	color: #ff2f6e;
	border: 0;
	margin: 20px 0;
}

.joinButtonCss {
	color: #FFF;
	font-weight: 500;
	letter-spacing: -1px;
	background-color: #ff2f6e;
	display: inline-block;
	padding: 6px 12px;
	font-size: 15px;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	touch-action: manipulation;
	cursor: pointer;
	user-select: none;
	background-image: none;
	border-radius: 4px;
	border: none;
}

/* .loginButtonCss:hover {
	background-color: #BD24A9;
	color: white;
} */

.loginButtonCss:focus {
	outline: none;
}

.NavImgLogo {
	margin-bottom: 13px;
}

.NavSearchForm {
	margin-bottom: 5px;
}

.ProfilePhoto {
    overflow: hidden;
    width: 32px;
    height: 32px;
    cursor: pointer;
	align-items: center;
    display: flex;
    position: relative;
    -webkit-box-pack: center;
}

.ProfilePhoto__ProfilePhotoImage {
    position: relative;
    z-index: 1;
    background: url(https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_100,w_100/v1549615514/wplmkg6m6zergls8dub7.jpg) no-repeat center;
    background-size: cover;
    width: 100%;
    height: 100%;
    border: none;
}

.ProfilePhoto__DefaultImageContainer {
	display: flex;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 0;
    -webkit-box-pack: center;
	align-items: center;
    background: #f8f8f8;
    width: 100%;
    height: 100%;
}

</style>
</head>
<body>
	<header class="TopNavTab">
		<nav>
			<div class="TopNavGrid">
				<div class="NavRow">
					<ul class="TopNavTab_NavUl">
						<li class="TopNavTab_NavLogo"><a href="searchForm.do"
							class="NavLogo"><span class="NavLogoCss">#HASHTAG</span></a></li>
						<%
							if (session.getAttribute("email") == null) {
						%>
						<li class="TopNavTab_NavList"><%@include
								file="member/modalLoginForm.jsp"%>
							<button class="loginButtonCss" data-toggle="modal"
								data-target="#modalLoginForm" id="modalLoginForm">로그인</button></li>
						<li class="TopNavTab_NavList"><%@include
								file="member/modalJoinForm.jsp"%>
							<button class="joinButtonCss" data-toggle="modal"
								data-target="#modalJoinForm" id="modalJoinForm">회원가입</button></li>
						<%
							} else if (session.getAttribute("email") != null) {
						%>
						<li class="TopNavTab_NavList">
							<button class="loginButtonCss" onclick="location.href='logout.do'">로그아웃</button>
						</li>
						<li class="TopNavTab_NavList">
							<a href="myPage.do">
								<div class="ProfilePhoto">
									<div class="ProfilePhoto__ProfilePhotoImage"></div>
									<div class="ProfilePhoto__DefaultImageContainer">
										<img
											class="defaultImage__ProfileImg" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
											alt="${review.nickName}의 사진">
									</div>
								</div>
							</a>
						</li>
						<%
							}
						%>
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
											placeholder="작품 제목, 배우, 감독을 검색해보세요." value="${movie.movName}">
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