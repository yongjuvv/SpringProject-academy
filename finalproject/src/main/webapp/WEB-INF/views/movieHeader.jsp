<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
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
@import url("${path}/css/header.css");
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