<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
/*  function list() {
	var collectList = $('#collectList').val();
	location.href="list.do?collectList="+collectList;
}  */
$(function () {
	$('#searchButton').click(function() {
		var searchCollect = $('#searchCollect').val();
		$.post("list.do", "searchCollect="+searchCollect, function(data) {
			$('#list').html(data);
		});
	});
});
$(function() {
	$('#submitCollectList').click(function() {
		var email = $('#email').val();
		$.post("cartList.do", "email="+email, function(data) {
			$('#AddedCartList').html(data);
		});
	});
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
.searchCollectInput{
    display: inline-block;
	height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
.searchButtonCss{
	color:#BD24A9;
	font-weight: 400;
	letter-spacing: -1px;
    margin-bottom: 5px;
    background-color: transparent;
    display: inline-block;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    user-select: none;
    background-image: none;
    border-radius: 4px;
    border: 1px solid #BD24A9;
}
.searchButtonCss:hover{
	background-color: #BD24A9;
	color: white;
}
.searchButtonCss:focus{
	outline: none;
}
.addedCollectUl{
	list-style: none;
    padding: 0;
    margin: 0;
}
</style>

		<div class="modal fade bd-example-modal-lg" id="commentForm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-lg">
    		<div class="modal-content">
    			<div class="modal-header">
        			<h3 id="modal-title" class="modal-title" style="width: 80%; float:left;">콜렉션 담기</h3>
        			<button type="button" id="close" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
        			</button>
        		<div class="col-4" style="height: 25px;"></div>
        		<div class="col-4"></div>
      			</div>
      			<div class="modal-body">
       			<div class="row">
				<div class="col-4"></div>
				<div class="col-4"></div>
				<div class="col-4"></div>
				</div>
				<div class="row">
					<div class="col-4">
						<input type="text" class="searchCollectInput" name="searchCollect" id="searchCollect" 
						placeholder="작품 제목, 배우, 감독을 검색해보세요." style="width: 300px;">
						<button id="searchButton" class="searchButtonCss">검색</button>
					</div>
					<div class="col-4"></div>
					<div class="col-4">
						<div id="list"></div>
					</div>
				</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-2">
				</div>
				<div class="col-2"></div>
				<div class="col-4">

				</div>
				<div class="col-2"></div>
			</div>
			<div class="row">
				<div class="col-4"></div>
				<div class="col-sm-9">
				<div id="addedCollectList">
				<div id="addedCollect">
					<ul id="addedCollectUl">
					
					</ul>
				</div>
				</div>
				</div>
				<div class="col-4"></div>
			</div>
				</div>
				<div class="modal-footer" >
					<button type="button" class="searchButtonCss" id="submitCollectList" data-dismiss="modal">남기기</button>
    		  	</div>
    		</div>
  		</div>
	</div>
