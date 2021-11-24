<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	// 해시태그 선택 제한
	$(document).ready(function() {
		$("input[type='checkbox']").on("click", function() {
			var count = $("input:checked[type='checkbox']").length;
			if (frm.reviewSpoiler.checked == true)
				count = count - 1;
			if (count > 3) {
				$(this).attr("checked", false);
				alert("해시태그는 3개까지만 선택할 수 있어요");
				return false;
			}
		});
	});
	
	// 해시태그 선택 안 하고 리뷰 등록했을 때 막기
	function chk() {
		var n = $('input:checkbox[name="hashtags"]:checked').length;
		if (n == 0) {
			alert("해시태그 1개는 꼭 선택해야 해요.");
			return false;
		}
	}
	
	// 리뷰 글자 수 표시
	$(function() {
		$('#reviewComm').keyup(function(e) {
			var reviewComm = $(this).val();
			$('#counter').html(reviewComm.length + '/300');
		});
		$('#reviewComm').keyup();
	});
</script>
<style type="text/css">
input[type="checkbox"] {
	display: none;
}
input[type="checkbox"]:checked+label {
	padding: 6px;
	color: #ffffff;
	font-size: 20px;
	background-color: #aaaaff;
	border-radius: 6px;
}
label {
	font-weight: normal;
	font-size: 15px;
}
.hashlabel {
	font-weight: normal;
	font-size: 15px;
	border-radius: 6px;
	padding: 6px;
}
#close{
	font-size: 30px;
	padding-bottom: 5px;
}
form{
	margin: 0;
}
</style>
	<form action="commentSubmit.do" name="frm" onsubmit="return chk()">
		<div class="modal fade bd-example-modal-lg" id="commentForm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-lg">
    		<div class="modal-content">
    			<div class="modal-header">
        			<h3 id="modal-title" class="modal-title" style="width: 80%; float:left;"></h3>
        			<button type="button" id="close" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
        			</button>
        		<div class="col-4" style="height: 25px;"></div>
        		<div class="col-4"></div>
      			</div>
      			<div class="modal-body">
      			<input type="hidden" name="email" value="${email}">
				<input type="hidden" name="reviewNum" value="${review.reviewNum}">
				<input type="hidden" name="movNum" value="${review.movNum}">
				<input type="hidden" name="tvNum" value="${review.tvNum}">
				<input type="hidden" name="reviewFirstChk" value="${review.reviewFirstChk}">
       				<div class="row">
					<div class="col-4"></div>
					<div class="col-4"></div>
					<div class="col-4"></div>
			</div>
			<div class="row">
				<div class="col-4"></div>
				<div class="col-4">
						<textarea
								rows="5"
								name="reviewComm"
								id="reviewComm"
								placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요"
								maxlength="300"
								class="form-control"><c:if test="${review.reviewComm != null}">${review.reviewComm}</c:if></textarea>
				</div>
				<div class="col-4"></div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-2">
					<span id="counter" class="counter">###</span>
				</div>
				<div class="col-2"></div>
				<div class="col-4">
						<input type="checkbox" name="reviewSpoiler" id="reviewSpoiler" value="y" />
						<label for="reviewSpoiler">스포일러 있어요</label>
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row">
				<div class="col-4"></div>
				<div class="col-sm-9">
				<c:forEach var="hashtag" items="${list}">
					<c:if test="${hashtag.hashNum==review.hashNum1 || hashtag.hashNum==review.hashNum2 || hashtag.hashNum==review.hashNum3}">
						<input type="checkbox" id="${hashtag.hashNum}" name="hashtags" value="${hashtag.hashNum}" checked="checked">
						<label for="${hashtag.hashNum}">${hashtag.hashName}</label>
					</c:if>
					<c:if test="${hashtag.hashNum!=review.hashNum1 && hashtag.hashNum!=exmovie.hashNum2 && hashtag.hashNum!=review.hashNum3}">
					<input type="checkbox" id="${hashtag.hashNum}" name="hashtags" value="${hashtag.hashNum}">
					<label for="${hashtag.hashNum}">${hashtag.hashName}</label>
					</c:if>
				</c:forEach>
				</div>
				<div class="col-4"></div>
			</div>
				</div>
				<div class="modal-footer" >
					<input type="submit" class="btn btn-primary" value="남기기">
    		   		<!-- <button type="button" class="btn btn-primary" id="comm" onclick="commSubmit()" data-dismiss="modal" >남기기</button> -->
    		    	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
    		  	</div>
    		</div>
  		</div>
	</div>
</form>