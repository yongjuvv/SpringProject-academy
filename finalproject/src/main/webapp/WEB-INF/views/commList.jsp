<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div id="container">
<div style='float:left; width:25%;'>
<p class="lTitle">[추천] Hot 해시태그</p>
<c:if test="${not empty recomHashList}">
	<div class="hashtag">
		<table class="table table-bordered">
			<tr>
				<th>#</th>
				<th>누적클릭횟수</th>
			</tr>
			<c:forEach var="hashtag" items="${recomHashList}">
				<p>
				<tr>
					<td class="bd1"><a href="hashtagResult.do?hashNum=${hashtag.hashNum}">${hashtag.hashName}</a></td>
					<td class="bd1"><a href="hashtagResult.do?hashNum=${hashtag.hashNum}">${hashtag.clickCount}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</c:if>
</div>
<div style='float:left; width:25%;'>
<c:if test="${not empty recomMovList}">
<p class="lTitle">[추천] Hot 영화리스트</p>
	<div class="movie">
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<th>장르</th>
			</tr>
			<c:forEach var="movie" items="${recomMovList}">
				<p>
				<tr>
					<td><a href="movSearchResult.do?movNum=${movie.movNum}">${movie.movName}</a></td>
					<td><a href="movSearchResult.do?movNum=${movie.movNum}">${movie.movGenre1}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</c:if>
</div>
<div style='float:left; width:25%;'>
<c:if test="${not empty recomTvList}">
<p class="lTitle">[추천] Hot 영상리스트</p>
	<div class="tv">
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<th>장르</th>
			</tr>
			<c:forEach var="tv" items="${recomTvList}">
				<p>
				<tr>
					<td><a href="tvSearchResult.do?tvNum=${tv.tvNum}">${tv.tvName}</a></td>
					<td><a href="tvSearchResult.do?tvNum=${tv.tvNum}">${tv.tvGenre}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</c:if>
</div>
</div>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>




