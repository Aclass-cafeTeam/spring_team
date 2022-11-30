<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내일로, 기차로! 카페 전체 멤버 관리 강제 탈퇴</title>

    <link rel="stylesheet" href="/resources/css/managerMain/ManageSecedePopup.css">
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
			<dt>강제 탈퇴 멤버<em id="memberCount"></em></dt>			
			<dd class="txt_cont tooltip_cont">			
				<div class="bx_area">
					<div class="bx_inner">
						<ul class="lst_member pers_layer" id="lst_member">
							
													
						</ul>
					</div>
				</div>
				
			
				<div class="j_chk">
					<input type="checkbox" name="rejectchk" id="rejectchk" class="check" value="1"> 
					<label for="rejectchk">우리 카페에 재가입 불가하도록 합니다.</label>
				</div>
			</dd>	
			</dd>			
			<dt>강제 탈퇴 사유</dt>
			<dd class="txt_cont mr_b">
				<ul class="lst_reason"> 
				<li><input id="reason0" name="rejecttype" type="radio" value="0" class="check _click(ManageActivityStopPopupView|Reason)" checked="checked"><label for="reason0">성인/도박 등 불법광고 및 스팸 활동</label></li>
				<li><input id="reason1" name="rejecttype" type="radio" value="1" class="check _click(ManageActivityStopPopupView|Reason)"><label for="reason1">바람직하지 않은 활동 <span class="c_gy">(광고, 도배, 욕설, 비방 등)</span></label></li>
				<li><input id="reason2" name="rejecttype" type="radio" value="2" class="check _click(ManageActivityStopPopupView|Reason)"><label for="reason2">우리 카페 내 자체 운영 원칙에 위배되는 활동</label></li>
				<li><input id="reason3" name="rejecttype" type="radio" class="check _click(ManageSecedePopupView|Reason)" value="3"><label for="reason3">카페폐쇄를 위한 탈퇴 진행</label></li>
				<li class="etc">
					<input type="radio" id="reason4" name="rejecttype" value="4" class="check _click(ManageActivityStopPopupView|OtherReason)"><label for="reason4" class="blind">기타</label>
					<textarea id="rejectreason" name="rejecttype" class="off _focus(ManageActivityStopPopupView|ReasonDetail) _keydown(ManageActivityStopPopupView|Submit)">기타 - 한글 25자 이내로 작성해 주세요.</textarea><!-- [D] 활성화 시 off 클래스 제거 -->
				</li>
				</ul>
			</dd>
			</dl>
			<div class="dsc" style="margin-top:-9px">  
				<p>탈퇴사유를 선택하지 않으시면 강퇴가 불가능하며
				<br>선택하신 사유는 탈퇴 관리 페이지에 저장됩니다
				</p>
			</div>
			</form>
		</div>
	</div>
	<div id="pop_footer">
		<a href="#" class="btn_type _click(ManageActivityStopPopupView|Submit) _stopDefault Submitbtn" id="Submit"><strong>확인</strong></a>
		<a href="#" class="btn_type _click(ManageActivityStopPopupView|Close) _stopDefault" id="_click(Close)"><span>취소</span></a>
	</div> 
</div>




    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  	<script src="/resources/js/managerMain/ManageSecedePopup.js"></script>
</body>
</html>