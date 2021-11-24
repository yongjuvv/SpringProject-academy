<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${tv.tvName}</title>
<script type="text/javascript">
function reviewComForm() {
	var reviewNum;
	reviewNum=$('#reviewNum').val();
	location.href='commentForm.do?reviewNum='+reviewNum;
}
</script>
<style type="text/css">
.hidden{
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

.br-theme-fontawesome-stars .br-widget a {
  font: normal normal normal 30px/1 FontAwesome;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  text-decoration: none;
  margin-right: 2px;
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
<script type="text/javascript">
function ch() {
	$('#button').removeClass('hidden');
	 var tvNum = $('#tvNum').val();
	 var tvEpNum = $('#chkep').val();
	$('#show').text('EPISODE'+$('#chkep').val()); 
	$.post("tvPayConfirm.do","tvNum="+tvNum+"&tvEpNum="+tvEpNum, function(data) {
			if(data == '1') {
				$('#playButton').show(); 
				$('#payButton').hide();				
			}
			else if(data == '0'){
				$('#playButton').hide(); 
				$('#payButton').show();				
			}
	});
}
function payFormClick() {
	var ten = $('#chkep').val();
	var tn = $('#tvNum').val();
	location.href='tvPayForm.do?tvNum='+tn+'&tvEpNum='+ten;
}
function viewTvClick() {
	var ten = $('#chkep').val();
	var tn = $('#tvNum').val();
	location.href='viewTv.do?tvNum='+tn+'&tvEpNum='+ten;
}
</script>
</head>
<body>
		<input type="text" id="tvNum" value="${tv.tvNum}">
		<input type="text" id="movNum" value="${movie.movNum}">
		<input type="text" id="exReviewRate" value="${exReviewRate}"> 
<div class="container" align="center">
	<table class="table">
		<tr>
			<td rowspan="5" width="30%" valign="top">
				<img alt="" src="<%=request.getContextPath()%>/images/${tv.tvPic}" width="300" height="450">
			</td>
			<td><h2>${tv.tvName} <span id="show" style="font-size: 20px;"></span></h2></td>
		</tr>
		<tr>
			<td valign="top">
				<p>
					<fmt:formatDate value="${tv.tvDate}" pattern="yyyy-MM-dd" />
					· ${tv.channel} · ${tv.tvGrade}
				</p>
			</td>
		</tr>
		<tr>
			<td>
			<section>
			<div style="margin-bottom: 20px;">
			<header><h4 style="font-weight: bold;">출연/제작</h4></header>
			</div>
			<div>
			<ul class="personUl">
			<li class="personLi">
				<a href="searchResult.do?search=${tv.tvDirName}" class="personA">
					<div class="personPic">
					<img alt="" src="<%=request.getContextPath()%>/images/${tv.tvDirPic}" width="50" height="50"></div> 
					<div class="personName">${tv.tvDirName} 감독</div>
				</a>
			</li>
			<li class="personLi">
				<a href="searchResult.do?search=${tv.actName1}" class="personA">
					<div class="personPic">
					<img alt="" src="<%=request.getContextPath()%>/images/${tv.actPic1}" width="50" height="50"></div>
					<div class="personName">${tv.actName1}</div>
				</a>
			</li>
			<li class="personLi">
 				<a href="searchResult.do?search=${tv.actName2}" class="personA">
					<c:if test="${tv.actName2 != null}">
						<div class="personPic">
						<img alt="" src="<%=request.getContextPath()%>/images/${tv.actPic2}" width="50" height="50"></div>
						<div class="personName">${tv.actName2}</div>
					</c:if>
				</a>
			</li>
			<li class="personLi">
 				<a href="searchResult.do?search=${tv.actName3}" class="personA">
					<c:if test="${tv.actName3 != null}">
						<div class="personPic">
						<img alt="" src="<%=request.getContextPath()%>/images/${tv.actPic3}" width="50" height="50"></div>
						<div class="personName">${tv.actName3}</div>
					</c:if>
				</a>
			</li>
			<li class="personLi">
 				<a href="searchResult.do?search=${tv.actName4}" class="personA">
					<c:if test="${tv.actName4 != null}">
						<div class="personPic">
						<img alt="" src="<%=request.getContextPath()%>/images/${tv.actPic4}" width="50" height="50"></div>
						<div class="personName">${tv.actName4}</div>
					</c:if>
				</a>
			</li>
			<li class="personLi">
 				<a href="searchResult.do?search=${tv.actName5}" class="personA">
					<c:if test="${tv.actName5 != null}">
						<div class="personPic">
						<img alt="" src="<%=request.getContextPath()%>/images/${tv.actPic5}" width="50" height="50"></div>
						<div class="personName">${tv.actName5}</div>
					</c:if>
				</a>
			</li>	
			<li class="personLi">
 				<a href="searchResult.do?search=${tv.actName6}" class="personA">
					<c:if test="${tv.actName6 != null}">
						<div class="personPic">
						<img alt="" src="<%=request.getContextPath()%>/images/${tv.actPic6}" width="50" height="50"></div>
						<div class="personName">${tv.actName6}</div>
					</c:if>
				</a>
			</li>	 	
				<c:if test="${tv.actName7 != null}">
			<li class="personLi">
 				<a href="searchResult.do?search=${tv.actName7}" class="personA">
					<div class="personPic">
					<img alt="" src="<%=request.getContextPath()%>/images/${tv.actPic7}" width="50" height="50"></div>
					<div class="personName">${tv.actName7}</div>
					
				</a>
			</li>
			</c:if>
			</ul>
			</div>
			</section>
			</td>
		</tr>
		<tr>
			<td>
				<p>${tv.tvDesc}</p>
			</td>
		</tr>
						
					

				
		<tr>
			<td>
			<input type="hidden" id="reviewNum" value="${review.reviewNum }">
				<c:if test="${not empty email}">
						<button onclick="reviewComForm()" class="btn btn-primary" style="float: left;">코멘트 남기기</button>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-sm" style="float: left;">에피소드 선택</button>
		<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-sm">
    		<div class="modal-content">
    			<div class="modal-header">
        			<h5 class="modal-title">에피소드 선택</h5>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
        			</button>
      			</div>
      			<div class="modal-body">
       				<select name="tvEpNum" id="chkep">
					<c:forEach var="tvep" items="${tvEpList}">
					<option value="${tvep.tvEpNum}">EPISODE ${tvep.tvEpNum} (${tvep.tvEpPrice}원)</option>
					</c:forEach>
					</select>
				</div>
				<div class="modal-footer">
    		   		<button type="button" class="btn btn-primary" id="ep" onclick="ch()" data-dismiss="modal" >선택</button>
    		    	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
    		  	</div>
    		</div>
  		</div>
		</div>
		
					<div id="button" class="hidden">
					<button type="button" class="btn btn-primary" id=payButton onclick="payFormClick()">결제하기</button>
					<button type="button" class="btn btn-primary" id=playButton onclick="viewTvClick()">감상하기</button>
					</div>
				</c:if>
			</td>
		</tr>
		<tr>
			<td><%@ include file="../star.jsp" %></td>
		</tr>
	</table>
	

		<section>
		<table class="table">
			<caption>다른 사용자들이 선택한 ${tv.tvName}의 해시태그입니다</caption>
			<tr>
				<td>
					<p>
					<c:forEach var="hashtaglist" items="${hashtaglist }">
						#${hashtaglist.hashName}
					</c:forEach>
					</p>
				</td>
			</tr>
		</table>
	</section>
			 
	 	<section>
	 		<table class="table" id="list">
			<caption><strong>리뷰</strong></caption>
			
				<c:forEach var="review" items="${tvReviewList}">
					<tr>
						<td rowspan="2" width="20%" style="text-align: center;">
							<a href="otherReviewList.do?email=${review.email}">
							<span id="review_nickName">${review.nickName}</span>
							</a>
						</td>
						<c:if test="${not empty review.reviewComm}">
							<c:if test="${review.reviewSpoiler=='n'}">
								<td colspan="3" id="comm">${review.reviewComm}</td>
							</c:if>
							<c:if test="${review.reviewSpoiler=='y'}">
								<td colspan="3" id="readmore" style="border-right: none;">
									<span class="readmore">스포일러가 있는 리뷰입니다
									</span>
									<div class="comm" id="comm">${review.reviewComm}</div>
								</td>
							</c:if>
						</c:if>
						<c:if test="${empty review.reviewComm}">
							<td colspan="3" id="comm">"리뷰가 없습니다"</td>
						</c:if>
					</tr>
					<tr id="bold16">
						<td id="review_fin" style="border-right: none;">
							<span id="review_hashtag">#${review.hashName1 }</span>
						<c:if test="${review.hashName2!=null }">
							<span id="review_hashtag">#${review.hashName2 }</span>
						</c:if>
						<c:if test="${review.hashName3!=null }">
							<span id="review_hashtag">#${review.hashName3 }</span>
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
	</section>
	
	
</div>
</body>
</html>