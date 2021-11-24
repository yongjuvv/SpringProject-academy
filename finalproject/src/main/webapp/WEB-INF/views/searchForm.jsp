<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mainHeader.jsp"%>

<style type="text/css">
@import url("${path}/css/searchForm.css");
</style>

<script type="text/javascript">
$(function() {
	var D = [];
	<c:forEach items="${nameList}" var="d_list">
	var s = '${d_list}'
	D.push(s);
	</c:forEach>

	$("#search").autocomplete({
		source : D
	});
});
function chk() {
	if(frm.search.value == ''){
		return false;
	}
}
	

</script>

<div class="container section" align="center">

	<!-- 검색창 -->
	<div class="container section_search_movName" align="center">
		<form action="searchResult.do" name="frm" onsubmit = "return chk()">
			<input
					type="search"
					name="search"
					id="search"
					placeholder="작품 제목, 배우, 감독을 검색해보세요">
		</form>
	</div>
	
	<!-- 해시태그 랜덤 리스트 -->
	<div class="container section_hashtag_list" align="center">
		<c:if test="${not empty list }">
			<c:forEach var="hashtag" items="${list }">
				<a href="hashtagResult.do?hashNum=${hashtag.hashNum}">
					#${hashtag.hashName} </a>
				<label for="${hashtag.hashNum}" class="hashlabel"></label>
			</c:forEach>
		</c:if>
	</div>
</div>

<%@ include file="footer.jsp"%>