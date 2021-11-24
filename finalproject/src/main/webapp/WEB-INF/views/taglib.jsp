<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- path = /프로젝트명 -->
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/css/myPage.css" rel="stylesheet">

<script src="${path}/js/jquery.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400&subset=korean');

* {
	font-family: 'Noto Sans KR', sans-serif;
}

.err {
	color: #ff2f6e;
	font-weight: 400;
}

</style>