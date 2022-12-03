<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내일로, 기차로! 카페 전체 멤버 관리</title>
    <link rel="stylesheet" href="/resources/css/managerMain/ManageCafeStaffView.css">
  
</head>
<body>
  <main>    
        <!-- ************************************* managerHeader ************************************************** -->
        <%-- 검색을 진행한 경우 --%>
        <div class="managerHeader">
          <header>
              <div class="managerHeader-gnb">

                  <div class="tit_area">
                      <h1><a href="#" class="go_nvr">NEVER</a>
                          <a href="/manager/managerMain" class="go_adm">카페관리</a></h1>
                      <p><a href="/" class="title">내일로, 기차로! 카페</a></p>
                  </div>

                  <div class="tit_menu">
                      <label for="header-menu-toggle">
                          지윤
                          <!-- <i class="fa-solid fa-caret-down"></i> -->
                      </label>
  
                      <input class="header__menu-btn" type="checkbox" id="header-menu-toggle">
                      <div class="header__nav">
                          <a href="#">내정보</a>
                          <a href="#">로그아웃</a>
                      </div>
                  </div>

              </div>
          </header>

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
                              <a href="../managerMain/menuManager.html"><img src="/resources/images/free-icon-menu-2550222.png">메뉴</a>
                          </li>
                          <li>
                              <a href="#"><img src="/resources/images/free-icon-edit-4386594.png">글•글양식</a>
                          </li>
                          <li>
                              <a href=""><img src="/resources/images/free-icon-spam-alert-5628585.png">삭제글</a>
                          </li>
                      </ul>
                  </div>
              </div>
          </nav>
      </div>

      <!-- ************************************* managerHeader ************************************************** -->
      <!-- menuSub 서브 네비-->
      <div class="lnb_sub" id="menuSub3">
        <ul>
            <li class="manager_totalMem">
                <a href="/manager/totalMemberManager" class="totalMem">전체 멤버 관리</a>
            </li> 
            <li class="manager_totalMem">
              <p>|</p>
            </li>
            <li class="manager_totalMem">
              <a href="/manager/ActivityStopMemberManager" class="totalMem">활동정지 멤버 관리</a>
            </li> 
            <li class="manager_totalMem">
              <p>|</p>
            </li>
            <li class="manager_totalMem">
              <a href="/manager/ForcedSecessionMemberManager" class="totalMem">강제탈퇴 멤버 관리</a>
            </li>
            <li class="manager_totalMem">
              <p>|</p>
            </li>
            <li class="manager_totalMem">
              <a href="/manager/ManageCafeStaffView" class="totalMem">스탭 관리</a>
            </li>  
        </ul>
      </div>
      <!-- menuSub 서브 네비-->
      <div class="ManageCafeStaffView">
        <div id="content">
          <div class="section_top">
            <div class="h_cont">
              <h2 class="menu2_sub4">스탭 관리</h2>
            </div>
            <div class="tab_menu">
              <ul>
                <li class="_manageAuth">스탭 선정</li>
              </ul>
            </div>
            <div class="noti_area">
              <ul class="lst_type">
                <li>그동안 혼자 카페 운영하시느라 힘드셨죠? 부 매니저와 역할을 나누어 운영해 보세요.</li>
                <li>카페는 함께 만들어가는 공간입니다.</li>
              </ul>
            </div>
              <table border="1" cellspacing="0" class="tbl_lst_type2">
                <caption><span class="blind">스탭 선정 목록</span></caption>
                <colgroup>
                  <col width="101">
                  <col width="*">
                </colgroup>
                <tbody>
                  <tr>
                    <th><strong>스탭 역할</strong></th>
                    <td>
                      <div class="inner">
                        <input type="text" id="staffType" class="_change(ManageCafeStaff|StaffType)" value="부 매니저" disabled style="width: 143px; height: 21px">
                          
                        <div id="staffRoleDesc" class="staff_txt" style="display: block;">카페 폐쇄, 매니저 위임을 제외한 카페 매니저의 모든 권한을 함께 가지고있습니다.<br>신중하게 선정해 주세요. 부매니저는 1명만 선정하실 수 있습니다.<br>부매니저 임명시 기존 스탭 권한은 자동으로 삭제됩니다.
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr class="last">
                    <th><strong>스탭 추가</strong>
                    </th>
                    <td>
                      <div class="group_input_frm">
                        <div class="srch_in">
                          <select id="searchType" name="searchType" style="width: 86px; height: 19px">
                            <option value="0">아이디</option>
                            <option value="1">닉네임</option>
                          </select> 
                          <input type="text" id="mem_srch" name="SearchMember" class="text _keydown(ManageCafeStaff|SearchMember)" style="width: 248px; padding-left: 7px"> 
                          <a class="btn_type _click(ManageCafeStaff|SearchMember) _stopDefault" href="#" id="searchmemberBtn">
                          <span>검색</span>
                          </a>
                        </div>

                        <%-- 검색하면 보이고 아니면 보이지 않음 --%>
                        <div id="memberInfoList" class="memberInfoList memberInfoListnone">
      
                          <ul id="search_result" class="mem_choice">
                           <%--  <c:choose>
                              <c:when test="${empty searchMember}">
                                <li id="memberInfo_null" name="memberInfo">
                                    <p>검색한 회원의 정보가 없습니다.</p>
                                </li>
                              </c:when>
                              <c:otherwise>
                              <li id="memberInfo_{${searchMember.memberEmail}}" name="memberInfo">
                                <div class="info">
                                  <input type="radio" id="electedStaffId_${searchMember.memberEmail}" name="electedStaffId" class="check _click(ManageCafeStaff|MemberInfo)" value="${searchMember.memberEmail}">
                                        <img src="https://ssl.pstatic.net/static/cafe/cafe_profile3_45x45.gif" width="20" height="20" alt="" class="thmb">
                                        <label for="r1" class="item _name _click(ManageCafeStaff|MemberInfo) _stopDefault">${searchMember.memberNickname} (${searchMember.memberEmail})</label>
                                </div>
                              </li>
                              </c:otherwise>
                            </c:choose> --%>
                          </ul>
                          <ul id="save_txt" class="bu_lst_type2">
                            <li>선택한 멤버를 스탭으로 선정하시려면 '저장'을 눌러주세요.</li>
                          </ul>
                        
                        </div>
                        <%-- 검색하면 보이고 아니면 보이지 않음 --%>
                      </div></td>
                  </tr>
                </tbody>
              </table>
              <%-- 검색하면 보이고 아니면 보이지 않음 --%>
              <div id="smt_btn" class="btn_area btn_areanone">
                <a href="#" class="btn_type_ny _click(ManageCafeStaff|SubmitForm) _stopDefault"><strong>저장</strong></a>
              </div>
              <%-- 검색하면 보이고 아니면 보이지 않음 --%>
            <%-- 위에 저장 폼인데 사용할지 안할지 미정 --%>
            <form name="staffFrm" action="/ManageCafeStaffView/updateSubManagerSelect" method="post">
            <input type="hidden" name="loginMember" value="${loginMember.memberEmail}">
            <input type="hidden" name="loginMemberauthorityNo" value="${loginMember.authorityNo}"><%-- 카페매니저만 매니저 임명 권한 --%>
            <input type="hidden" id="electedStaffId" name="electedStaffId" value="">
            <input type="hidden" id="electedStaffStopFL" name="memberDeleteFlag" value=""><%-- 활동정지 멤버 --%>
            <input type="hidden" id="electedStaffauthorityNo" name="authorityNo" value=""><%-- 매니저면 안됨 --%>
            <c:if test="${!empty stepMember}">
              <c:forEach var="member" items="${stepMember}">
                <c:if test="${member.authorityNo == 1}">
                  <input type="hidden" id="subManagerFL" name="subManagerFL" value="true"><%-- 부매니저가 있으면 안됨 --%>
                </c:if>
              </c:forEach>
            </c:if>
            <input type="hidden" id="wholeMessageSendAuth" name="cafeStaff.wholeMessageSendAuth" value="false">
            </form>

          </div>
          <div class="section_cont">
            <div class="board_area bd_n">
              <div class="board_top">
                <p class="board_tit">
                  <strong>전체 스탭 </strong> <em>${stepMemberCount}</em>
                </p>
              </div>
              <div id="DeleteLayer" style="display:none;left:595px;top:109px;" class="ly_type">
                <div style="width:267px" class="ly_cont ly_cont_v2">
                  <p class="c_gy2">권한을 삭제하시면, 해당 멤버는 스탭이 아닌<br><span class="c_gy5">일반 카페 멤버</span>로 돌아갑니다.<br><strong class="c_gy5"><span class="c_og">스탭 권한을 삭제</span>하시겠습니까?</strong></p>
                <div class="btn">
                  <a class="btn_type3 _click(LayerManager|ClickLayer|DeleteLayer|Confirm) _stopDefault" href="#"><strong>확인</strong></a>
                  <a class="btn_type3 _click(LayerManager|CloseLayer|DeleteLayer) _stopDefault" id="closeLayerBtn" href="#"><span>취소</span></a>
                </div>
                </div>
                <a class="clse _click(LayerManager|CloseLayer|DeleteLayer) _stopDefault" id="stopLayerBtn" href="#"><span class="blind">닫기</span></a>
              </div>
              
              <form id="staffListFrm" name="deletestafffrm" action="/ManageCafeStaffView/deleteSubManagerSelect" method="post">
              <input type="hidden" name="cafeStaff" value="${loginMember.memberEmail}">
              <input type="hidden" name="cafeStaffauthorityNo" value="${loginMember.authorityNo}">
              <table border="1" cellspacing="0" class="tbl_lst_type">
                <caption><span class="blind">스탭 선정 목록</span></caption>
                <colgroup>
                  <col width="121">
                  <col width="*">
                  <col width="150">
                  <col width="120">
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col" class="frst"><strong class="line_r">스탭역할</strong></th>
                    <th scope="col"><strong class="line_r">별명(아이디)</strong></th>
                    <th scope="col"><strong class="line_r">방문일</strong></th>
                    <th scope="col" class="last"><strong>스탭삭제</strong></th>
                  </tr>
                </thead>
                <tbody>
                  
                  
                  <c:choose>
                  <c:when test="${empty stepMember}">
                    <tr class="line_b none">
                      <td colspan="6">
                        <p>카페 스탭 멤버가 없습니다.</p>
                      </td>
                    </tr>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="member" items="${stepMember}">
                    <tr>
                      <td class="tl"><span class="txt c_gy2">전체 스탭</span></td>
                      <td class="pers_nick_area">
                        <span class="thmb">
                          <img src="${member.profileImage}"  alt="">
                        </span>
                        <a href="#" class="nick _click(NicknameUI|OpenUI|${member.memberEmail}) _stopDefault _userInfo">${member.memberNickname}(${member.memberEmail})</a>
                      </td>
                      <td class="tc"><span class="num">${member.loginDate}.</span></td>
                  
                      <td class="tc">
                        <c:if test="${member.authorityNo == 1}">
                          <a href="#" id="staffDelete" class="btn_type _click(ManageCafeStaff|ShowDeleteLayer|${member.memberEmail}|${member.authorityNo}) _stopDefault">
                            <span>삭제</span>
                            <input type="hidden" name="subManagerDelete" value="${member.memberEmail}">
                          </a>
                        </c:if>
                      </td>
                    </tr>
                    </c:forEach>
                  </c:otherwise>
                  </c:choose>
                  
                  
                </tbody>
              </table>
              </form>
            </div>
          </div>
        </div>

      </div>



  </main>
  <!-- 푸터 -->
  <footer>
    <p class="cr">
        <em>Since 2022.10.14. © </em> 
        <span> 내일로, 기차로! 카페</span>
    </p>
  </footer>
  <!-- 푸터 -->
  <!-- jQuery  -->
  <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  
  <script src="/resources/js/managerMain/ManageCafeStaffView.js"></script>
</body>
</html>