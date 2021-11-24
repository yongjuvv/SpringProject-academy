<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<title>star</title>
<script type="text/javascript">
$(function() {
	var tvNum = 0;
	var movNum = 0;
	var exReviewRate = $('#exReviewRate').val();
	$("#p" + exReviewRate).prop("checked", true);
	if($("input:checked").val() > 0) {
		$('#comm').removeClass('hiddenComm');
		$('#comm').show();
	}
	$("input:radio[name=star-input]").click(function() {
		if ("${email}" == "") {
			alert("평가를 저장하고 싶다면 로그인 하세요");
		} else {
			if ($('#tvNum').val() > 0) {
				tvNum = $('#tvNum').val();
			}
			else if ($('#movNum').val() > 0) {
				movNum = $('#movNum').val();
			}
			$.post("reviewRating.do", "tvNum="+tvNum+"&movNum="+movNum+"&reviewRate="+$(this).val(), function(data) {
				$('#reviewNum').val(data);
			});
			$('#comm').removeClass('hiddenComm');
			$('#comm').show();
		}
	});	
});
</script>
<style type="text/css">
@import url("${path}/css/star.css");
</style>
</head>
<body>
	<span class="star-input">
		<span class="input">
			<input type="radio" name="star-input" value="1" id="p1">
			<label for="p1">1</label>
			<input type="radio" name="star-input" value="2" id="p2">
			<label for="p2">2</label>
			<input type="radio" name="star-input" value="3" id="p3">
			<label for="p3">3</label>
			<input type="radio" name="star-input" value="4" id="p4">
			<label for="p4">4</label>
			<input type="radio" name="star-input" value="5" id="p5">
			<label for="p5">5</label>
			<input type="radio" name="star-input" value="6" id="p6">
			<label for="p6">6</label>
			<input type="radio" name="star-input" value="7" id="p7">
			<label for="p7">7</label>
			<input type="radio" name="star-input" value="8" id="p8">
			<label for="p8">8</label>
			<input type="radio" name="star-input" value="9" id="p9">
			<label for="p9">9</label>
			<input type="radio" name="star-input" value="10" id="p10">
			<label for="p10">10</label>
		</span> <!-- <span class="input"> -->
	</span> <!-- <span class="star-input"> -->
	<script src="star/js/jquery-1.11.3.min.js"></script>
	<script src="star/js/star.js"></script>
</body>
</html>