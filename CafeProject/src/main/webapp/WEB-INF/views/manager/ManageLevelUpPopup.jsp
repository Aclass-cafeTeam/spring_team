<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내일로, 기차로! 카페 전체 멤버 관리 등급 변경</title>
  <link rel="stylesheet" href="/resources/css/managerMain/ManageLevelUpPopup.css">
  
</head>
<body>


<div id="pop_wrap" class="pop_refuse">
	<form name="levelupfrm" method="post" action="/ManageLevelUp.nhn">
		<%-- <input type="hidden" name="m" value="update">
		<input type="hidden" name="model.clubid" value="30828148">
		<input type="hidden" name="model.acceptType" value="1">
		<input type="hidden" name="fromUpService" value="member">
		<input type="hidden" id="defaultComment" value="">
		<input type="hidden" name="model.memberid" value="shuxi91">
        <input type="hidden" name="model.memberLevelName" value="">
        <input type="hidden" name="callback" value="nhn.cafemanage.member.refreshMemberList"> --%>
		<c:if test="${not empty memberLevel}">
			<c:forEach var="memberLevels" items="${memberLevel}">
				<c:if test="${memberLevels.MEMBER_LEVEL_NO ge 2}">
					<input type="hidden" name="${memberLevels.MEMBER_LEVEL_NO}" value="${memberLevels.MEMBER_LEVEL_IMG}">
				</c:if>
			</c:forEach>
        </c:if>
		

	<div id="pop_header" class="blind">
		<h1>멤버 등급변경</h1>
	</div>
	<div id="pop_container">
		<div class="pop_content">

	
		<dl class="lst_type">
			<dt>변경대상<em id="memberCount"></em></dt>
			<dd class="txt_cont mr_b30">
				<div class="bx_area">
					<div class="bx_inner">
						<ul id="lst_member" class="lst_member">
							<%-- <li>
								<div class="pers_nick_area">
									<span class="img"><img src="https://ssl.pstatic.net/static/cafe/cafe_profile3_80x80.gif" width="20" height="20" alt=""></span><span class="nick">김서희(shuxi91)</span>
								</div>
							</li> --%>
							
						</ul>
					</div>
				</div>
			</dd>
			<dt class="fl">등급 변경</dt>
			<dd class="sel">
				<select name="model.memberLevel" style="width:145px;height:21px" id="memberLevelSelect">
					
					<c:if test="${not empty memberLevel}">
						<c:forEach var="memberLevels" items="${memberLevel}">
							<c:if test="${memberLevels.MEMBER_LEVEL_NO ge 2}">
								<option value="${memberLevels.MEMBER_LEVEL_NO}">${memberLevels.MEMBER_LEVEL_NAME}</option>
							</c:if>
						</c:forEach>
                	</c:if>
					
				</select>
			</dd>

			<dd class="hr2"></dd>
			<dt>변경 이유</dt>
            <dd class="txt_cont mr_b">
				<textarea id="comment" class="text _focus(ManageLevelUpView|Comment) _keyup(ManageLevelUpView|Comment)" cols="30" rows="5" name="model.comment"></textarea>
				<p class="t_byte"><strong id="txtLen">0</strong> / 100 byte</p>
			</dd>
			</dl>
			<div class="dsc">
				스탭 등급 변경은 <a href="#" class="_click(ManageLevelUpView|GoManageStaff)"><em class="t_und c_gn">멤버·스탭&gt;스탭관리</em></a>에서 스탭권한<br>
				해지 후 가능합니다. 등급을 조정하는 경우에는,<br>
				등급 변경 후 자동등업제외 멤버로 등록할 수 있습니다.
			</div>
	
	

		</div>
	</div>
	
	
	<div id="pop_footer">
		<a href="#" class="btn_type _click(ManageLevelUpView|Submit|false) _stopDefault" id="Submit"><strong>확인</strong></a>
		<a href="#" class="btn_type _click(ManageLevelUpView|Close) _stopDefault" id="_click(Close)"><span>취소</span></a>
	</div>
	</form>
</div>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  
  	<script src="/resources/js/managerMain/ManageLevelUpPopup.js"></script>
</body>
</html>