<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내일로, 기차로! 카페 전체 멤버 관리 활동 정지</title>

    <link rel="stylesheet" href="/resources/css/managerMain/ManageActivityStopPopup.css">
</head>
<body>
    <!-- 전체 팝업사이즈 : 500x476 -->
<div id="pop_wrap" class="pop_stop">
	<div id="pop_header" class="blind">
		<h1>활동 정지 시키기</h1>
	</div>
	<div id="pop_container">
		<div class="pop_content">
			<form name="frm" action="/ManageActivityStopProcess.nhn" method="post" onsubmit="return false;">
			<input type="hidden" name="clubid" value="30828148">
			<input type="hidden" name="activityStop.executorId" value="wldbs4166">
			
				<input type="hidden" name="callback" value="nhn.cafemanage.member.refreshMemberList">
			
			<dl class="lst_type">
			<dt>활동 정지 대상 멤버<em id="memberCount"></em></dt>			
			<dd class="txt_cont tooltip_cont">			
				<div class="bx_area">
					<div class="bx_inner">
						<ul class="lst_member pers_layer" id="lst_member">
							
													
						</ul>
					</div>
				</div>
				
				
	               <!-- [D]tooltip 영역을 따로 분리/hidden 클래스 사용하여 화면 표시 유무 처리 -->
	               <div class="ui_tooltip shuxi91 hidden" style="position:absolute">
	                   <span class="ico_sdk ico_arrow"><span class="blind">레이어박스화살표</span></span>
	                   <div class="box_help">
	                       <div class="tooltip_help">
	                           <div class="inner_help">
	                           
	                           </div>
	                       </div>
	                   </div>
	               </div>
				
                
				<div class="desc">
					<p class="tip_dsc">스탭과 이미 활동 정지 상태인 멤버는 제외되었습니다.</p>
				</div>
			</dd>			
			<dt>활동 정지 사유</dt>
			<dd class="txt_cont mr_b">
				<ul class="lst_reason"> 
				<li><input id="reason0" name="activityStop.violationCode" type="radio" value="3" class="check _click(ManageActivityStopPopupView|Reason)" checked="checked"><label for="reason0">성인/도박 등 불법광고 및 스팸 활동</label></li>
				<li><input id="reason1" name="activityStop.violationCode" type="radio" value="4" class="check _click(ManageActivityStopPopupView|Reason)"><label for="reason1">바람직하지 않은 활동 <span class="c_gy">(광고, 도배, 욕설, 비방 등)</span></label></li>
				<li><input id="reason2" name="activityStop.violationCode" type="radio" value="1" class="check _click(ManageActivityStopPopupView|Reason)"><label for="reason2">우리 카페 내 자체 운영 원칙에 위배되는 활동</label></li>
				<li class="etc">
					<input type="radio" id="reason4" name="activityStop.violationCode" value="2" class="check _click(ManageActivityStopPopupView|OtherReason)"><label for="reason4" class="blind">기타</label>
					<textarea id="rejectreason" name="activityStop.reason" class="off _focus(ManageActivityStopPopupView|ReasonDetail) _keydown(ManageActivityStopPopupView|Submit)">기타 - 한글 25자 이내로 작성해 주세요.</textarea><!-- [D] 활성화 시 off 클래스 제거 -->
				</li>
				</ul>
			</dd>
			</dl>
			<p class="dsc" style="padding-bottom:17px">대상 멤버를 활동 정지 하시겠습니까?</p>
			</form>
		</div>
	</div>
	<div id="pop_footer">
		<a href="#" class="btn_type _click(ManageActivityStopPopupView|Submit) _stopDefault Submitbtn" id="Submit"><strong>활동정지</strong></a>
		<a href="#" class="btn_type _click(ManageActivityStopPopupView|Close) _stopDefault" id="_click(Close)"><span>취소</span></a>
	</div> 
</div>




    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  	<script src="/resources/js/managerMain/ManageActivityStopPopup.js"></script>
</body>
</html>