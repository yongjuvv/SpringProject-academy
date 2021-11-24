<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HASHTAG::MyView</title>
<script type="text/javascript">
$(function() {
	$('.TopNavTab').addClass('TopNavTabScroll');
	$('.loginButtonCss').addClass('loginButtonCssScroll');
	$('.NavLogoCss').addClass('NavLogoCssScroll');
	$('.NavBasicFormInput').addClass('NavBasicFormInputScroll');
	$('.InputFormSearch').addClass('InputFormSearchScroll');
});
	function readonlyFalse(btn, objId) {
		var obj = document.getElementById(objId);
		var flag = obj.readOnly;
		var nickName = $('#nickName1').val();
 		var memBirth = $('#memBirth').val(); 		
 		
	 	 if (btn.value == "수정완료") {
			$.ajax({
				data : {
					nickName : nickName,
					memBirth : memBirth
				},
				url : "memUpdate.do",
				success : function(data) {
					if (data == '1')
						alert("수정완료");
					else
						alert("수정실패");
				},
				error : function(data) {
					alert("error");
				}
			});
	 		$(obj).attr('readonly',true)
			btn.value='수정';
		}
		
	 	 else if(btn.value == '수정'){
	 		 $(obj).attr('readonly',false)
	 		 btn.value = "수정완료"
	 	 }
	}
</script>
<style>
div {
    display: block;
}
.AppMyPage{
}
.NavTapManager_NavContainer{
	position: relative;
    width: 100%;
    overflow: hidden;
}
.NavTapManager_Main{
	padding-top: 60;
    padding-bottom: 0;
}
.UserPage{
	flex-direction: column;
    min-height: calc(100vh - 72px);
    background: #f8f8f8;
    overflow: hidden;
}
.UserPage_Container{
	-webkit-flex: 1;
    -ms-flex: 1;
    flex: 1;
    margin: 28px 0 30px;
}
.MaxWidthGrid{
	max-width: 640px;
	margin: 0 auto;
}
.RoundedCornerBlock{
	border: 1px solid;
    border-radius: 6px;
    background: #fff;
    border-color: #e3e3e3 !important;
    overflow: hidden;
}
.UserPage_MyPage{
	background: #fff;
}
.UserPage_WallPaper{
    position: relative;
    background-color: #BD24A9;
    background-size: 180px 177px;
    height: 0;
    padding-top: 32%;
    margin: 0;
}
.UserPage_WallPaper::before{
	    content: "";
    display: block;
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    background-image: linear-gradient( -180deg,rgba(0,0,0,0.4) 0%,rgba(0,0,0,0) 100% );
    height: 44px;
}
.UserPage_WallPaperTopRightButton{
	position: absolute;
    top: 10px;
    right: 10px;
    width: 24px;
    height: 24px;
    padding: 0;
    border: none;
    margin: 0;
    cursor: pointer;
    color: white;
    background: transparent;
    margin: 6px;
    outline: none;
}
.UserPageGrid{
}
.UserPageRow{
	margin: 0 20px;
}
.UserPage_ProfileHeader{
	position: relative;
    padding-bottom: 26px;
    border-bottom: 1px solid #ededed;
}
.ProfilePhoto{
	display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    position: relative;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    width: 56px;
    height: 56px;
    overflow: hidden;
    border: solid 1px rgba(0,0,0,0.08);
    border-radius: 50%;
}
.ProfilePhoto_ProfilePhotoImage{
	position: relative;
    z-index: 1;
    background: url(https://d3sz5r0rl9fxuc.cloudfront.net/assets/default/user/photo_file_name_small-bc8b334….jpg) no-repeat center;
    background-size: cover;
    width: 100%;
    height: 100%;
}
.ProfilePhoto_DefaultImageContainer{
	display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 0;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    background: #f8f8f8;
    width: 100%;
    height: 100%;
    margin-right: 10;
}
.defaultImage_ProfileImg{
	vertical-align: top;
	width: 24px;
    height: 24px;
    border-style: none;
}
.UserPage_NameBlock{
	display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    padding-top: 20px;
}
.UserPage_Name{
	font-size: 25px;
    font-weight: 700;
    -webkit-letter-spacing: -0.9px;
    -moz-letter-spacing: -0.9px;
    -ms-letter-spacing: -0.9px;
    letter-spacing: -0.9px;
    line-height: 30px;
    color: #000;
    width: 100%;
    word-break: break-all;
    margin: 0;
    margin-top: 5;
}
.UserPage_PhotoButtonContainer{
	font-size: 13px;
    font-weight: 400;
    -webkit-letter-spacing: -0.2px;
    -moz-letter-spacing: -0.2px;
    -ms-letter-spacing: -0.2px;
    letter-spacing: -0.2px;
    line-height: 18px;
    display: block;
    position: absolute;
    right: 10px;
    bottom: 13px;
    color: #fff !important;
    text-align: right;
    text-decoration: none;
    background-color: transparent;
}
.UserPage_PhotoIcon{
	vertical-align: bottom;
    width: 24px;
    height: 24px;
    display: inline-block;
    padding-top: 7px;
    margin-right: 5;
}
.VisualUl{
	list-style: none;
    padding: 0;
    margin: 0;
}
.UserPage_AnalysisListItem{
	display: list-item;
    text-align: -webkit-match-parent;
}
.AnalysisListItemA{
	font-size: 17px;
    font-weight: 400;
    letter-spacing: -0.7px;
    line-height: 22px;
    display: flex;
    align-items: center;
    color: #000;
    text-decoration: none;
    height: 48px;
    background-color: transparent;
}
.UserPage_TasteImage{
	margin: 0 7px 0 0;
	display: inline-block;
    width: 24px;
    height: 24px;
    font-size: 20px;
    color: #BD24A9;
}
.UserPage_AnalysisListItemTitleFirst{
	-webkit-flex: 1;
    -ms-flex: 1;
    flex: 1;
    padding: 13px 0;
}
.UserPage_AnalysisListItemTitleSecond{
	-webkit-flex: 1;
    -ms-flex: 1;
    flex: 1;
    padding: 13px 0;
    border-bottom: 1px solid #ededed;
}
.HorizontalScrollbarContainer{
	position: relative;
    -webkit-transform: translate3d(0,0,0);
    -ms-transform: translate3d(0,0,0);
    transform: translate3d(0,0,0);
}
.ScrollingInner{
    transition: 500ms;
}
.ScrollRow{
	margin: 0 20px;
}
.UserPage_CategoryUl{
	margin: 24px -5px 24px;
	white-space: nowrap;
    margin-right: -5px !important;
    margin-left: -5px !important;
    list-style: none;
    padding: 0;
}
.UserPage_CategoryList{
	position: relative;
    width: 50%;
    display: inline-block;
    vertical-align: top;
    box-sizing: border-box;
    padding: 0 5px;
   	white-space: nowrap;
}
.UserPage_CategoryLinkMovie{
	display: inline-block;
    position: relative;
    background: linear-gradient(45deg,#82d957 40%,#bfe874 100%);
    vertical-align: middle;
    width: 100%;
    padding-top: 100%;
    border-radius: 6px;
}
.UserPage_CategoryArchivesMovie{
	background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zd…0zLjI2NS0zLjMwOC0zLjI2NXoiIG1hc2s9InVybCgjYikiLz4KICAgIDwvZz4KPC9zdmc+Cg==);
    background-size: contain;
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    color: #fff;
    padding: 6.9px 11px 26.5px;
    overflow: hidden;
    list-style: none;
    margin: 0;
}
.UserPage_CategoryArchivesName{
	font-size: 17px;
    font-weight: 400;
    -webkit-letter-spacing: -0.7px;
    -moz-letter-spacing: -0.7px;
    -ms-letter-spacing: -0.7px;
    letter-spacing: -0.7px;
    line-height: 22px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: list-item;
    text-align: -webkit-match-parent;
}
.UserPage_CategoryArchivesRatedCount{
	font-size: 19px;
    font-weight: 700;
    -webkit-letter-spacing: -0.7px;
    -moz-letter-spacing: -0.7px;
    -ms-letter-spacing: -0.7px;
    letter-spacing: -0.7px;
    line-height: 28px;
    overflow: hidden;
    text-overflow: ellipsis;
}
.UserPage_CategoryLinkTv{
	display: inline-block;
    position: relative;
    background: linear-gradient(45deg,#ffbf66 40%,#ffc89e 100%);
    vertical-align: middle;
    width: 100%;
    padding-top: 100%;
    border-radius: 6px;
}
.UserPage_CategoryArchivesTv{
	background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zd…A1IDQuNTA2LTQuNDc5IDQuNTA2eiIgbWFzaz0idXJsKCNiKSIvPgogICAgPC9nPgo8L3N2Zz4K);
    background-size: contain;
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    color: #fff;
    padding: 6.9px 11px 26.5px;
    overflow: hidden;
    list-style: none;
    margin: 0;
}
.Footer{
	display: block;
    background: #fff;
    box-sizing: border-box;
    width: 100%;
    padding: 24px 0 32px;
}
.MaxWidthGridFooter{
	max-width: 640px;
	margin: 0 auto;
}
.FooterSection{
	display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
}
.FooterContainer{
	-webkit-flex: 1;
    -ms-flex: 1;
    flex: 1;
}
.Footer_RatingSummery{
	font-size: 14px;
    font-weight: 400;
    -webkit-letter-spacing: -0.3px;
    -moz-letter-spacing: -0.3px;
    -ms-letter-spacing: -0.3px;
    letter-spacing: -0.3px;
    line-height: 19px;
}
.HashCount{
	color: #ffa136;
	font-style: normal;
}
.Footer_FrogramsInfo{
	font-size: 11px;
    font-weight: 400;
    -webkit-letter-spacing: -0.1px;
    -moz-letter-spacing: -0.1px;
    -ms-letter-spacing: -0.1px;
    letter-spacing: -0.1px;
    line-height: 14px;
    margin: 36px 0 16px;
    list-style: none;
    padding: 0;
}
.Footer_FrogramsInfoList{
	color: inherit;
    cursor: text;
    display: inline-block;
    vertical-align: top;
    font-size: 11px;
    font-weight: 400;
    letter-spacing: -0.1px;
    line-height: 14px;
    color: #a0a0a0;
}
.Footer_FrogramsInfoUnder{
	font-size: 11px;
    font-weight: 400;
    -webkit-letter-spacing: -0.1px;
    -moz-letter-spacing: -0.1px;
    -ms-letter-spacing: -0.1px;
    letter-spacing: -0.1px;
    line-height: 14px;
    color: #a0a0a0;
    margin: 6px 0;
    list-style: none;
    padding: 0;
}
.Footer_FooterLogo{
	vertical-align: top;
    margin: 0 6px 0 0;
    color: #a0a0a0;
    font-size: 13px;
    font-weight: 900;
}
.ConfigButton{
	font-size: 20px;
}
.myPoint{
	position: absolute;
    top: 10px;
    left: 10px;
    background-size: cover;
    width: 24px;
    height: 24px;
    padding: 0;
    border: none;
    margin: 0;
    cursor: pointer;
    color: white;
    background: transparent;
    margin-left: 10px;
    font-size: 15px;
    width: 350px;
}
.myPointLarge{
	font-size: 30px;
}
.settinModalContent{
	display: inline-block;
    position: relative;
    vertical-align: middle;
    text-align: left;
    width: 375px;
    height: auto;
    min-height: 540px;
    border-radius: 6px;
    overflow: auto;
    background: #fff;
}
.settingModalDialog{
	width: 375px;
}
.settingModalHeader{
	position: absolute;
    top: 0;
    text-align: left;
    height: auto;
    letter-spacing: -0.5px;
    line-height: 22px;
    font-size: 17px;
    font-weight: 700;
    left: 0;
    z-index: 50;
    background: #fff;
    box-sizing: border-box;
    width: 100%;
    padding: 0 16px;
    border-bottom: 1px solid #e3e3e3;
    
}
.ShrinkHeaderBar_Button{
	display: flex;
	justify-content: space-between;
}
.ShrinkHeaderBar_LargeTitleBlock{
	display: flex;
	transform: translate3d(0,0,0);
    -webkit-box-pack: center;
   	justify-content: center;
   	-webkit-box-align: center;
   	align-items: center;
    height: 52px;
    margin: 0 4px;
    opacity: 1;
    transition: 150ms ease;
}
.ShrinkHeaderBar_LargeTitle{
	font-size: 33px;
    font-weight: 700;
    letter-spacing: -1.2px;
    line-height: 40px;
    display: inline-block;
    white-space: nowrap;
    width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.ModalWithShrinkHeaderBar_ChildrenContainer{
	height: auto;
    overflow: auto;
    padding: 96px 0 0;
    box-sizing: border-box;
    text-align: left;
}
.settingModalGrid{
	
}
.settingModalRow{
	margin: 0 20px;
}
.SettingModal_SettingSection{
	margin: 32px 0;
}
.SubCategoryTitle{
	font-size: 14px;
    font-weight: 400;
    letter-spacing: -0.3px;
    line-height: 19px;
    color: #8c8c8c;
    padding: 5px 0;
}
.settingModalVisualUl{
	list-style: none;
    padding: 0;
    margin: 0;
}
.settingModalBasicList{
	font-size: 17px;
    font-weight: 400;
    letter-spacing: -0.7px;
    line-height: 22px;
    flex-direction: column;
    color: #000000;
    text-align: left;
    box-sizing: border-box;
    min-height: 48px;
}
.settingModalBasicList_Inner{
	display: flex;
	flex: 1;
	-webkit-box-align: center;
	align-items: center;
    box-sizing: border-box;
    min-height: 48px;
    border-bottom: 1px solid #f0f0f0;
}
.settingModalBasicList_Title{
	flex: 1;
    white-space: pre-wrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.container{
	width: 100%;
	padding: 0;
}
.noPointList{
	text-align: center;
}
.UserPage_WallPaperRow{
	top: 40;
    position: absolute;
    width: 638;
    padding: 0 80;
}
.UserPage_WallPaperTitle{
	width: 100%;
}
.myPointListTitle{
	font-family: 'Noto Sans KR', sans-serif;
    color: white;
    font-size: 30;
    font-weight: 600;
    text-align: left;
    letter-spacing: -3px;
    line-height: 1;
    padding: 0 0 20 0;
}
.pageList{
	padding-bottom: 20px;
}
.myPointListTitle_Title{
	color: wheat;
    font-weight: 600;
    font-size: 40;
}
.NextButton{
	padding-top: 12px;
	text-align: center;
}
.NextButtonCss{
	color:#BD24A9;
	font-weight: 600;
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
.NextButtonCss:hover{
	background-color: #BD24A9;
	color: white;
}
.viewTable{
	margin-top: 20px;
}
.table{
	font-size: 16px;
}
.topLine{
	border-top: none;
}
</style>
</head>
<body>
<div class="AppMyPage">
	<div class="NavTapManager_NavContainer">
		<%@include file="../header.jsp" %>
		<section class="NavTapManager_Main">
			<div class="UserPage">
				<div class="UserPage_Container">
					<div class="MaxWidthGrid">
						<div class="RoundedCornerBlock">
							<section class="UserPage_MyPage">
								<div class="UserPage_WallPaper">
									<div class="UserPage_WallPaperRow">
										<div class="UserPage_WallPaperTitle">
											<h2 class="myPointListTitle">
													내<br> <span class="myPointListTitle_Title">정보 보기</span>
											</h2>
										</div>
									</div>
								</div>
								<div class="UserPageGrid">
										<div class="UserPageRow">
											<div class="container" align="center">
												<table class="table viewTable" style="font-size: 14px;">
													<tr>
														<th>프로필 사진</th>
														<td colspan="3" class="topLine">${pmember.memPic}</td>
													</tr>
													<tr>
														<th>이메일</th>
														<td colspan="3">${pmember.email}</td>
													</tr>
													<tr>
														<th>이름</th>
														<td colspan="3">${pmember.memName}</td>
													</tr>
													<tr>
														<th>별명</th>
														<td><input type="text" value="${pmember.nickName }"
															name="nickName" class="form-control" id="nickName1"
															readonly="readonly"></td>
														<td><input type="button" class="NextButtonCss" value="수정"
															id="nickUp" onclick="readonlyFalse(this,'nickName1')">
														</td>
													</tr>
													<tr>
														<th>가입일</th>
														<td colspan="3"><fmt:formatDate
																value="${pmember.regDate}" pattern="yyyy년 M월 d일" /></td>
													</tr>
													<tr>
														<th>생일</th>
														<td><input type="date" value="${pmember.memBirth }"
															readonly="readonly" name="memBirth" id="memBirth"
															class="form-control"></td>
														<td><input type="button" class="NextButtonCss" value="수정"
															id="birthUp" onclick="readonlyFalse(this,'memBirth')"></td>
													</tr>
													<tr>
														<th>포인트</th>
														<td>${pmember.memPoint}</td>
														<td><input type="button" class="NextButtonCss" value="충전"
															onclick="location.href ='pChargeForm.do'"></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
							</section>
						</div>
					</div>
				</div>
			</div>
			<footer class="Footer">
				<div class="MaxWidthGridFooter">
					<section class="FooterSection">
						<div class="FooterContainer">
							<div class="Footer_RatingSummery">
								지금까지 <em class="HashCount">${count}개의 #해시태그가 </em>쌓였어요.
							</div>
							<ul class="Footer_FrogramsInfo">
								<li class="Footer_FrogramsInfoList">
									사업자 등록 번호 <span>(123-45-67890)</span>
								</li>
								<li class="Footer_FrogramsInfoList">
									고객센터 <span>cs@hash.tag</span>
								</li>
							</ul>
							<ul class="Footer_FrogramsInfoUnder">
								<span class="Footer_FooterLogo">HASHTAG</span>
								<li class="Footer_FrogramsInfoList">
									© 2018–2019 by Hashtag. Inc
								</li>
							</ul>
						</div>
					</section>
				</div>
			</footer>
		</section>
	</div>
</div>
</body>
</html>