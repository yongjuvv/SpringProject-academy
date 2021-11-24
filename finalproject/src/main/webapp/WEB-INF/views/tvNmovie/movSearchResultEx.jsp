<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${movie.movName}</title>
<script type="text/javascript">
function reviewComForm() {
	var reviewNum;
	reviewNum=$('#reviewNum').val();
	location.href='commentForm.do?reviewNum='+reviewNum;
}

$(function() {
	$('#insertComm').click(
			function () {
				$('#modal-title').text($('#movName').val());
				$('#commentForm').modal('show');
	});
});
</script>
<style type="text/css">
li {
	display: inline-block;
}
.hiddenComm{
	display: none;
}
.personA{
	align-items: center;
	display: flex;
	color: inherit;
    text-decoration: none;
    height: 76px;
}
.personLi {
	display: inline-block;
	height: 30%;
	width: 40%;
	display: list-item;
    text-align: -webkit-match-parent;
	padding: 0;
	margin:0;
	list-style: none;
}
.personUl{
	margin-top: 4px;
    margin-bottom: 16px;
    height: 228px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-flow: column wrap;
    -ms-flex-flow: column wrap;
    flex-flow: column wrap; 
    -webkit-align-content: flex-start;
    -ms-flex-line-pack: flex-start;
    align-content: flex-start;
    margin-right: -5px;
    margin-left: -5px;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    padding-left: 0px;
}
.personPic{
	float: left; 
	height: 50; 
	width: 50; 
	position: relative;
}
.personName{
	height: 50; 
	width: 60%; 
	display:flex;
	color: inherit;
    text-decoration: none; 
    align-items: center;
}
</style>
</head>
<body>
			<!-- HIDDEN -->
			movName:<input type="text" name="movName" id="movName" value="${movie.movName}">
			exReviewRate:<input type="text" name="exReviewRate" id="exReviewRate" value="${exReviewRate}">
			reviewRate:<input type="text" name="reviewRate" id="reviewRate" value="${review.reviewRate}">
			email:<input type="text" name="email" id="email" value="${email}">
			reviewNum<input type="text" id="reviewNum" name="reviewNum" value="${review.reviewNum}"><br>
			tvNum<input type="text" id="tvNum" name="tvNum" value="${tv.tvNum}">
			movNum<input type="text" id="movNum" name="movNum" value="${movie.movNum}">
			tvNum<input type="text" id="tvNum" name="tvNum" value="${review.tvNum}">
			movNum<input type="text" id="movNum" name="movNum" value="${review.movNum}">
	<div class="container" align="center">
		<table class="table">
			<tr>
				<td rowspan="6" width="30%" valign="top">
				<img
					alt=""
					src="<%=request.getContextPath()%>/images/${movie.movPic}"
					width="300"
					height="450">
				</td>
				<td>${movie.movName}</td>
			</tr>
			<tr>
				<td valign="top" height="15%">
					<p>
						<fmt:formatDate value="${movie.movDate}" pattern="yyyy" />
						· ${movie.prod} · ${movie.movGrade}
					</p>
					<p>${movie.movGenre1 }<c:if test="${movie.movGenre2 != null}">, ${movie.movGenre2 }</c:if>
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<section>
						<div style="margin-bottom: 20px;">
							<header>
								<h4 style="font-weight: bold;">출연/제작</h4>
							</header>
						</div>
						<div>
							<ul class="personUl">
								<li class="personLi">
									<a href="searchResult.do?search=${movie.movDirName}" class="personA">
										<div class="personPic">
											<img alt=""
												src="<%=request.getContextPath()%>/images/${movie.movDirPic}"
												width="50" height="50">
										</div>
										<div class="personName">${movie.movDirName}
											감독</div>
									</a>
								</li>
								<li class="personLi">
									<a href="searchResult.do?search=${movie.actName1}" class="personA">
										<div class="personPic">
											<img alt=""
												src="<%=request.getContextPath()%>/images/${movie.actPic1}"
												width="50" height="50">
										</div>
										<div class="personName">${movie.actName1}</div>
									</a>
								</li>
								<li class="personLi">
									<a href="searchResult.do?search=${movie.actName2}" class="personA">
										<c:if test="${movie.actName2 != null}">
											<div class="personPic">
												<img alt=""
													src="<%=request.getContextPath()%>/images/${movie.actPic2}"
													width="50" height="50">
											</div>
											<div class="personName">${movie.actName2}</div>
										</c:if>
									</a>
								</li>
								<li class="personLi">
									<a href="searchResult.do?search=${movie.actName3}" class="personA">
										<c:if test="${movie.actName3 != null}">
											<div class="personPic">
												<img alt=""
													src="<%=request.getContextPath()%>/images/${movie.actPic3}"
													width="50" height="50">
											</div>
											<div class="personName">${movie.actName3}</div>
										</c:if>
									</a>
								</li>
								<li class="personLi">
									<a href="searchResult.do?search=${movie.actName4}" class="personA">
										<c:if test="${movie.actName4 != null}">
											<div class="personPic">
												<img alt=""
													src="<%=request.getContextPath()%>/images/${movie.actPic4}"
													width="50" height="50">
											</div>
											<div class="personName">${movie.actName4}</div>
										</c:if>
									</a>
								</li>
								<li class="personLi">
									<a href="searchResult.do?search=${movie.actName5}" class="personA">
										<c:if test="${movie.actName5 != null}">
											<div class="personPic">
												<img alt=""
													src="<%=request.getContextPath()%>/images/${movie.actPic5}"
													width="50" height="50">
											</div>
											<div class="personName">${movie.actName5}</div>
										</c:if>
									</a>
								</li>
								<li class="personLi">
									<a href="searchResult.do?search=${movie.actName6}" class="personA">
										<c:if test="${movie.actName6 != null}">
											<div class="personPic">
												<img alt=""
													src="<%=request.getContextPath()%>/images/${movie.actPic6}"
													width="50" height="50">
											</div>
											<div class="personName">${movie.actName6}</div>
										</c:if>
									</a>
								</li>
								<li class="personLi">
									<a href="searchResult.do?search=${movie.actName7}" class="personA">
										<c:if test="${movie.actName7 != null}">
											<div class="personPic">
												<img alt=""
													src="<%=request.getContextPath()%>/images/${movie.actPic7}"
													width="50" height="50">
											</div>
											<div class="personName">${movie.actName7}</div>
										</c:if>
									</a>
								</li>
								
							</ul>
						</div>
					</section>
				</td>
			</tr>
			<tr>
				<td>
					<p>${movie.movDesc}</p>
				</td>
			</tr>
			<c:if test="${not empty email}">
		<tr>
			<td><%@ include file="../star.jsp" %></td>
		</tr>
		<tr>
			<td>
				<div class="hiddenComm" id="comm" style="float:left;">
				<c:if test="${review.reviewComm==null}">
						tvNum<input type="text" id="tvNum" name="tvNum" value="${review.tvNum}">
						movNum<input type="text" id="movNum" name="movNum" value="${review.movNum}">
						reviewNum<input type="text" id="reviewNum" name="reviewNum" value="${review.reviewNum}">
						<%@ include file="../review/modalCommentForm.jsp" %><button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg" style="float: left;" id="insertComm">코멘트 남기기</button>
				</c:if>
				</div>
					<c:if test="${empty pay.payState}">
						<input type="button" value="결제하기 (${movie.movPrice}원)"
							onclick="location.href='movPayForm.do?movNum=${movie.movNum}'"
							class="btn btn-default">
					</c:if>
					<c:if test="${pay.payState == 'y'}"> 
					<input type="button" value="감상하기"
							onclick="location.href='viewMovie.do?movNum=${movie.movNum}'">
					</c:if>
				
			</td>
		</tr>
		<tr>
			<td><%@ include file="../star.jsp" %></td>
		</tr>
		</c:if>
		</table>
	</div>

	<div class="container" align="left">
		<table class="table">
			<caption>다른 사용자들이 선택한 ${movie.movName}의 해시태그입니다</caption>
			<tr>
				<td>
					<p>
						<c:forEach var="hashtagList" items="${hashtagList }">
					#${hashtagList.hashName}
				</c:forEach>
					</p>
				</td>
			</tr>
		</table>
	</div>

	<div class="container">
		<table class="table" id="list">
			<caption>
				<strong>리뷰</strong>
			</caption>
			<c:if test="${empty movieReviewList}">
			<tr>
					<td colspan="3" id="comm">"리뷰가 없습니다"</td>
			</tr>
			</c:if>
			<c:forEach var="review" items="${movieReviewList}">
				<tr>
					<td rowspan="2" width="20%" style="text-align: center;"><a
						href="otherReviewList.do?email=${review.email}">${review.nickName}</a>
					</td>
					<c:if test="${review.reviewSpoiler=='n'}">
						<td colspan="3" id="comm">
						<c:url var="url" value="reviewDetail.do?reviewNum=${review.reviewNum}"></c:url>
							<a href="${url}">${review.reviewComm}</a></td>
					</c:if>
					<c:if test="${review.reviewSpoiler=='y'}">
						<td colspan="3" id="readmore">
						<span class="readmore">스포일러 있어요!!</span>
							<div class="comm" id="comm">${review.reviewComm}</div></td>
					</c:if>
				</tr>
				<tr>
					<td>#${review.hashName1 }
						<c:if test="${review.hashName2!=null }">
						#${review.hashName2 }
						</c:if>
						<c:if test="${review.hashName3!=null }">
						#${review.hashName3 }
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>