<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내일로, 기차로! 카페 멤버 등급 관리</title>
        <link rel="stylesheet" href="/resources/css/managerMain/gradeMemberManager.css">
    
</head>
<body>
    <main>
    <!-- ************************************* managerHeader ************************************************** -->
    <div class="managerHeader">
        <jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />

        <nav>
            <div class="nav_menu_back">
                <div class="nav_menu">
                    <ul>
                        <li clss="managerHome">
                            <a href="/manager/managerMain"><img src="/resources/images/free-icon-house-1835281.png">관리홈</a>
                        </li>
                        <li>
                            <a href="/manager/basicInfoManager"><img src="/resources/images/settings.png">카페운영</a>
                        </li>
                        <li>
                            <a href="/manager/totalMemberManager"><img src="/resources/images/free-icon-friends-7218085.png">멤버•스탭</a>
                        </li>
                        <li>
                            <a href="/manager/joinMemberManager"><img src="/resources/images/free-icon-add-friend-4458569.png">가입•등급</a>
                        </li>
                        <li>
                            <a href="/manager/menuManager"><img src="/resources/images/free-icon-menu-2550222.png">메뉴</a>
                        </li>
                        <!-- <li>
                            <a href="#"><img src="/resources/images/free-icon-edit-4386594.png">글•글양식</a>
                        </li> -->
                        <li>
                            <a href="/manager/manageRemoveArticleList"><img src="/resources/images/free-icon-spam-alert-5628585.png">삭제글</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <!-- ************************************* managerHeader ************************************************** -->
    <!-- menuSub 서브 네비-->
    <div class="lnb_sub" id="menuSub4">
        <ul>
            <li class="manager_joinMem">
                <a href="/manager/joinMemberManager" class="joinMem">가입 정보 관리</a>
            </li> 
            <li class="manager_joinMem">
                <p>|</p>
            </li>
            <li class="manager_joinMem">
                <a href="#" class="joinMem">멤버 등급 관리</a>
            </li>  
        </ul>
    </div>
    <!-- menuSub 서브 네비-->
    <div class="ManageCafeStaffView">
        <div id="content">
            <div class="section_top">
                <div class="h_cont">
                    <h2 class="menu2_sub4">멤버 등급 관리</h2>
                </div>
            <div class="tab_menu">
                <ul>
                    <li class="_manageAuth">등급 조건 관리</li>
                </ul>
            </div>
            <div class="noti_area">
                <ul class="lst_type">
                    <strong>자동등업</strong>
                    <li>카페 멤버별 등급 조건을 관리합니다.</li>
                    <li>멤버등급관리에서 자동등업조건을 설정합니다.</li>
                    <li>조건을 만족하는 멤버는 만족과 동시에 신청/수락 없이 등업이 됩니다.</li>
                </ul>
            </div>
        </div>

        <div class="section_cont">
			


            <form id="manageLevelForm" method="post" action="/manager/updateMemberLevelTable">
            <input type="hidden" name="clubid" value="30828148">
            <input type="hidden" name="memberLevelInfo.clubid" value="30828148">
            <input type="hidden" name="memberLevelInfo.useautolevel" value="true">
            <input type="hidden" name="memberLevelInfo.useboardcondition" value="false">
            <input type="hidden" name="memberLevelInfo.includeanswer" value="true">
            
            <div class="level_cont">
                <table cellspacing="0" border="1" class="tbl_level">	
                <caption><span class="blind">등급 조건 목록</span></caption>				
                <colgroup>
                <col width="33">
                <col width="135">
                <col width="*">
                </colgroup>
                <thead>
                <tr>
                <th scope="col"><strong class="blind">등급아이콘</strong></th>
                <th scope="col"><strong>등급명</strong></th>
                <th scope="col"><strong>설명</strong></th>
                </tr>
                </thead>
                <tbody>
                
                <c:if test="${!empty memberGrade}">
                    <c:forEach var="memberGradeIn" items="${memberGrade}">
                    <tr>
                        <td class="ico">
                            <img id="iconImg1" src="${memberGradeIn.memberLevelImg}" width="11" height="11">
                        </td>
                        <td class="level">
                            <input id="conditionName1" type="text" readonly name="memberLevelName" value="${memberGradeIn.memberLevelName}" maxlength="10" class="text2">
                        </td>
                        <td>
                            <input id="conditionDesc1" type="text" readonly name="firstLevel.memberleveldesc" value="<c:choose><c:when test="${memberGradeIn.memberLeverNo == 2}">가입 후, 별다른 승인을 받지 않은 초기 회원, 또는 활동이 없는 유령회원</c:when><c:when test="${memberGradeIn.memberLeverNo == 3}">기차로 카페 기본 등급</c:when><c:when test="${memberGradeIn.memberLeverNo == 4}">기차로 카페에서 회원들과 많은 이야기를 나누고 있는 회원</c:when><c:when test="${memberGradeIn.memberLeverNo == 5}">기차로 카페에서 오랜 기간, 활발하게 소통하고 활동하는 회원</c:when><c:when test="${memberGradeIn.memberLeverNo == 6}">기차로 카페에서 사는 회원</c:when></c:choose>" maxlength="50" class="text2">
                                <c:if test="${memberGradeIn.memberLeverNo gt 2}">
                                        <p id="condition2" class="detail">                    
                                            <label for="sum_write">게시글</label>
                                            <input type="text" name="boardCount" id="sum_write" class="text4" value="${memberGradeIn.boardCount}" maxlength="5"> 개,&nbsp;&nbsp;
                                            <label for="sum_reply">댓글</label>
                                            <input type="text" name="commentCount" id="sum_reply" class="text4" value="${memberGradeIn.commentCount}" maxlength="5"> 개,&nbsp;&nbsp;
                                            <label for="sum_visit">방문</label>
                                            <input type="text" name="visitCount" id="sum_visit" class="text4" value="${memberGradeIn.visitCount}" maxlength="5"> 회,&nbsp;&nbsp;
                                            <label for="sum_join">가입 0주 후 만족 시 등업 신청</label>
                                        </p>
                                </c:if>
                                <c:if test="${memberGradeIn.memberLeverNo == 2}">
                                        <p> 
                                            <input type="hidden" name="boardCount" id="sum_write" class="text4" value="${memberGradeIn.boardCount}" maxlength="5">
                                            <input type="hidden" name="commentCount" id="sum_reply" class="text4" value="${memberGradeIn.commentCount}" maxlength="5"> 
                                            <input type="hidden" name="visitCount" id="sum_visit" class="text4" value="${memberGradeIn.visitCount}" maxlength="5">
                                        </p>
                                </c:if>
                        </td>
                    </tr>
                    </c:forEach>
                </c:if>
                <!-- <tr>
                    <td class="ico"><img id="iconImg1" src="../../resources/images/manager/새내기.png" width="11" height="11">
                    </td>
                    <td class="level"><input id="conditionName1" type="text" readonly name="firstLevel.memberlevelname" value="새내기" maxlength="10" class="text2">
                    </td>
                    <td>
                        <input id="conditionDesc1" type="text" readonly name="firstLevel.memberleveldesc" value="가입 후, 별다른 승인을 받지 않은 초기 회원, 또는 활동이 없는 유령회원" maxlength="50" class="text2">
                    </td>
                </tr>
                
                <tr>
                    <td class="ico"><img id="iconImg2" src="../../resources/images/manager/일반여행자.png" width="11" height="11"></td>
                    <td class="level"><input id="conditionName2" type="text" readonly name="secondLevel.memberlevelname" value="일반여행자" maxlength="10" class="text2"></td>
                    <td>
                        <input id="conditionDesc2" type="text" readonly name="secondLevel.memberleveldesc" value="기차로 카페 기본 등급" maxlength="50" class="text2">
                        <p id="condition2" class="detail" style="">                    
                            <label for="sum_write">게시글</label>
                            <input type="text" name="secondLevel.articlecount" id="sum_write" class="text4" value="5" maxlength="5"> 개,&nbsp;&nbsp;
                            <label for="sum_reply">댓글</label>
                            <input type="text" name="secondLevel.commentcount" id="sum_reply" class="text4" value="10" maxlength="5"> 개,&nbsp;&nbsp;
                            <label for="sum_visit">방문</label>
                            <input type="text" name="secondLevel.visitcount" id="sum_visit" class="text4" value="20" maxlength="5"> 회,&nbsp;&nbsp;
                            <label for="sum_join">가입 0주 후 만족 시 등업 신청</label>
                        </p>
                    </td>
                </tr>
                
                <tr>
                    <td class="ico"><img id="iconImg3" src="../../resources/images/manager/성실여행자.png" width="11" height="11"></td>
                    <td class="level"><input id="conditionName3" type="text" readonly name="thirdLevel.memberlevelname" value="성실여행자" maxlength="10" class="text2"></td>
                    <td>
                        <input id="conditionDesc3" type="text" readonly name="thirdLevel.memberleveldesc" value="기차로 카페에서 회원들과 많은 이야기를 나누고 있는 회원" maxlength="50" class="text2">
                        <p id="condition3" class="detail" style="">                    
                            <label for="sum_write">게시글</label>
                            <input type="text" name="thirdLevel.articlecount" id="sum_write" class="text4" value="10" maxlength="5"> 개,&nbsp;&nbsp;
                            <label for="sum_reply">댓글</label>
                            <input type="text" name="thirdLevel.commentcount" id="sum_reply" class="text4" value="20" maxlength="5"> 개,&nbsp;&nbsp;
                            <label for="sum_visit">방문</label>
                            <input type="text" name="thirdLevel.visitcount" id="sum_visit" class="text4" value="30" maxlength="5"> 회,&nbsp;&nbsp;
                            <label for="sum_join">가입 0주 후 만족 시 등업 신청</label>
                        </p>
                    </td>
                </tr>
                
                <tr>
                    <td class="ico"><img id="iconImg5" src="../../resources/images/manager/우수여행자.png" width="11" height="11"></td>
                    <td class="level"><input id="conditionName5" type="text" readonly name="fifthLevel.memberlevelname" value="우수여행자" maxlength="10" class="text2"></td>
                    <td>
                        <input id="conditionDesc5" type="text" readonly name="fifthLevel.memberleveldesc" value="기차로 카페에서 오랜 기간, 활발하게 소통하고 활동하는 회원" maxlength="50" class="text2">
                        <p id="condition5" class="detail" style="">                    
                            <label for="sum_write">게시글</label>
                            <input type="text" name="fifthLevel.articlecount" id="sum_write" class="text4" value="20" maxlength="5"> 개,&nbsp;&nbsp;
                            <label for="sum_reply">댓글</label>
                            <input type="text" name="fifthLevel.commentcount" id="sum_reply" class="text4" value="30" maxlength="5"> 개,&nbsp;&nbsp;
                            <label for="sum_visit">방문</label>
                            <input type="text" name="fifthLevel.visitcount" id="sum_visit" class="text4" value="40" maxlength="5"> 회,&nbsp;&nbsp;
                            <label for="sum_join">가입 0주 후 만족 시 등업 신청</label>
                        </p>
                    </td>
                </tr>
                
                <tr>
                    <td class="ico"><img id="iconImg6" src="../../resources/images/manager/감사멤버.png" width="11" height="11"></td>
                    <td class="level"><input id="conditionName6" type="text" readonly name="sixthLevel.memberlevelname" value="감사멤버" maxlength="10" class="text2"></td>
                    <td>
                        <input id="conditionDesc6" type="text" readonly name="sixthLevel.memberleveldesc" value="기차로 카페에서 사는 회원" maxlength="50" class="text2">
                        <p id="condition6" class="detail" style="">                    
                            <label for="sum_write">게시글</label>
                            <input type="text" name="sixthLevel.articlecount" id="sum_write" class="text4" value="30" maxlength="5"> 개,&nbsp;&nbsp;
                            <label for="sum_reply">댓글</label>
                            <input type="text" name="sixthLevel.commentcount" id="sum_reply" class="text4" value="40" maxlength="5"> 개,&nbsp;&nbsp;
                            <label for="sum_visit">방문</label>
                            <input type="text" name="sixthLevel.visitcount" id="sum_visit" class="text4" value="50" maxlength="5"> 회,&nbsp;&nbsp;
                            <label for="sum_join">가입 0주 후 만족 시 등업 신청</label>
                        </p>
                    </td>
                </tr> -->
                </tbody>
                </table>
            </div>
            <div class="btn_area">
                <button type="reset" class="btn_type_edt2 _click(ManageMemberLevel|Cancel) _stopDefault" ><strong>취소</strong></button> <button type ="submit" class="btn_type_edt _click(ManageMemberLevel|Submit) _stopDefault"><strong>저장하기</strong></button>
            </div>
            </form>
        </div>

    </div>



    </main>
    <!-- 푸터 -->
    <footer>
        <p class="cr">
            <em>Since 2022.10.14. © </em> 
            <span> 내일로, 기차로! 카페</span>
        </p>
        <c:if test="${not empty message}">
            <script>
                alert("${message}");
            </script>
            <%-- message 1회 출력 후 모든 scope 삭제 --%>
            <c:remove var="message" />
        </c:if>
    </footer>
    <!-- 푸터 -->
</body>
</html>