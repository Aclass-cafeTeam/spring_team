<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="memberList" value="${map.memberList}"/>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내일로, 기차로! 카페 전체 멤버 관리</title>
    <link rel="stylesheet" href="/resources/css/managerMain/ActivityStopMemberManager.css">
  
</head>
<body>
  <main>    
        <!-- ************************************* managerHeader ************************************************** -->
        <%-- 검색을 진행한 경우 --%>
        <c:if test="${not empty param}">
          <c:forEach var="pageParameter" items="${param}">
            <c:if test="${pageParameter.key != 'cp'}">
              
              <c:set var="sURL" value="${sURL}&${pageParameter.key}=${pageParameter.value}"/>
            </c:if>
          </c:forEach>
        </c:if>
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
                              <a href="../managerMain/menuManager.html"><img src="/resources/images/free-icon-menu-2550222.png">메뉴</a>
                          </li>
                          <!-- <li>
                              <a href="#"><img src="/resources/images/free-icon-edit-4386594.png">글•글양식</a>
                          </li> -->
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
      <div class="ActivityStopMember">
        <div class="section_top">
          <div class="StopMemFromtitle">
            <P>활동정지 멤버 관리</P>
          </div>
          <div class="StopSearchfieldset">
            <div class="noti_area">
              <ul class="lst_type">
              <li>운영자가 활동 정지한 멤버를 보여주며, 활동정지 해제 또는 강제탈퇴 시킬 수 있습니다.</li>
              <li>활동정지는 전체 멤버 관리에서 하실 수 있습니다.</li>
              </ul>
              
              <div class="btn">
                <a class="btn_type_ny ny_v1" href="/manager/totalMemberManager"><strong>활동정지 하러가기<span class="bu"></span></strong></a>
              </div>
              
            </div>
          
            <form name="findActivityStopForm" action="/manager/ActivityStopMemberManager" method="get">
              <div class="bx_srch bx_v1">
                <div class="bx_srch_inner">
                  <div class="srch_in">
                    <label for="searchMember">멤버 검색</label>
                    
                    
                    <input type="text" name="search.memberId" id="searchMember" value="아이디 검색" class="searchMember text2 off _focus(ManageActivityStopMemberView|SearchActivityStopMember) _keydown(ManageActivityStopMemberView|SearchActivityStopMember)">
                    <button type="submit" id="selectInputMember1" class="btn_type2_gn" >
                      검색
                    </button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>


        <div>
          <p class="board_tit">
            <strong>활동정지 멤버</strong>
            <em class="_memberCount">${stopMemberCount}</em><!-- ${memberStopCount} -->
            </p>
        </div>
        <!----------------------- 데이터 출력 -------------------------------------------------------------->
        <div class="board_action">
          <div class="action_in">
              선택 멤버를&nbsp;														
              <a class="btn_type _click(ManageActivityStopMemberView|ReleaseStopMember) _stopDefault" id ="ReleaseStopMember" href="#"><span>활동 정지 해제</span></a>
              <a class="btn_type _click(ManageActivityStopMemberView|Secede) _stopDefault " id ="_forceWithdrawal" href="#"><span>강제 탈퇴</span></a>
          </div>

          <div class="action_arr">
              <p>
                <form name = "sortActivityStopMemberFrm" action="/manager/ActivityStopMemberManager" method="get">
                  <select id="limit" name="limit" class="${pagination.limit}" value="${pagination.limit}">
                  <option id="limit15" value="15" selected="">15명 정렬</option>
                  <option id="limit30" value="30">30명 정렬</option>
                  <option id="limit50" value="50">50명 정렬</option>
                  <option id="limit100" value="100">100명 정렬</option>
                  </select>
                </form>
              </p>
          </div>
          <!-- ******************수정요망*********************** -->
          <div class="ly_type" id="ReleaseMemberLayer" style="display:none; overflow: visible; zoom: 1;">
            <div class="ly_cont w250">
              <p>
                <strong><span class="c_og">활동이 가능</span>하도록 처리하시겠습니까?</strong>
              </p>
              <div class="btn">
              
                <a href="#" id="releaseButtonAjax" class="btn_type3 _click(LayerManager|ClickLayer|ReleaseMemberLayer|Confirm) _stopDefault"><strong>확인</strong></a>
                <a href="#" class="btn_type3 _click(LayerManager|CloseLayer|ReleaseMemberLayer) _stopDefault _hideLayer"><span>취소</span></a>
              </div>
            </div>							
            <a href="#" id="_hideLayer" class="_hideLayer clse _click(LayerManager|CloseLayer|ReleaseMemberLayer) _stopDefault"><span class="blind">닫기</span></a>
          </div>
          <!-- ******************수정요망*********************** -->
        </div>
          <!-- 데이터 출력--------------------------- ---------------------------------------------------------------->
          <form name="releaseActivityStopForm" action="/ManageActivityStopRelease.nhn" method="post">
            <input type="hidden" name="clubid" value="30828148">
            <input type="hidden" name="callback" value="reload">
            <input type="hidden" name="perPage" value="30">
            <input type="hidden" name="page" value="1">
            
            <table border="1" cellspacing="0" class="tbl_lst_type">	
              <caption><span class="blind">활동정지 멤버 목록</span></caption>				
              <colgroup>
              <col width="23">
              <col width="*">
              <col width="285">
              <col width="81">
              <col width="163">
              </colgroup>
              <thead>
              <tr id="listHeader">
              <th scope="col" class="frst"><input type="checkbox" name="checkAllMember" id="checkAllMember" title="선택" class="check _click(ManageActivityStopMemberView|CheckAllMember) _checkAll"></th>
              <th scope="col"><strong class="line_r">별명(아이디)</strong></th>

              <th scope="col"><strong class="line_r">사유</strong></th>
              <th scope="col"><strong class="line_r">처리일</strong></th>
              <th scope="col" class="last"><strong class="line_r">처리자</strong></th>
              </tr>
              </thead>
              <tbody>

                <c:choose>
                  <c:when test="${empty memberList}">
                    <tr class="line_b none">
                      <td colspan="6">
                        <p>등록된 활동정지 멤버가 없습니다.</p>
                      </td>
                    </tr>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="member" items="${memberList}">
                      <tr id="${member.memberEmail}" class="_checkable" memberid="${member.memberEmail}">
                        <td class="tc">
 
                          <input type="checkbox" name="memberids" value="${member.memberEmail}" id="memberids" title="선택" class="check _click(ManageActivityStopMemberView|CheckMember) _checkMember">
                          
                        </td>
                        <td>
                          <div class="pers_nick_area">
                            <span class="img">
                              <img id="checkImg${member.memberEmail}" src="${member.profileImage}" width="20" height="20" alt="">
                            </span>
                            <a href="#" id="checkMember${member.memberEmail}" class="nick ellipsis _click(NicknameUI|OpenUI|${member.memberEmail}) _stopDefault">${member.memberNickname} (${member.memberEmail})</a>
                          </div>
                        </td>
                        <td class="tl">
                          <div class="ellipsis"><span class="txt5 c_gy2">
                            ${member.holdReason}</span></div>
                        </td>
                        <td class="tc">
                          <span class="num">${member.holdDate}.</span>
                        </td>
                        <td class="tl">
                          
                          <div class="ellipsis"><span class="txt5 _click(NicknameUI|OpenUI|${member.HManagerEmail}) _stopDefault">${member.HManagerNickname} (${member.HManagerEmail})</span></div>
                        </td>
                      </tr>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
              </tbody>
            </table>
          </form> 
        <div class="pagination-area">


          <ul class="pagination">
          
              <!-- 첫 페이지로 이동 -->
              <li><a href="/manager/ActivityStopMemberManager?cp=1">&lt;&lt;</a></li>

              <!-- 이전 목록 마지막 번호로 이동 -->
              <li><a href="/manager/ActivityStopMemberManager?cp=${pagination.prevPage}">&lt;</a></li>

    
              <!-- 특정 페이지로 이동 -->
              <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                <c:choose>
                  <c:when test="${i== pagination.currentPage}">
                    <!-- 현재 페이지인 경우 -->
                    <li><a class="current">${i}</a></li>
                  </c:when>
                  <c:otherwise>
                    <!-- 현재 페이지를 제외한 나머지 -->
                    <li><a href="/manager/ActivityStopMemberManager?cp=${i}">${i}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <!-- 다음 목록 시작 번호로 이동 -->
              <li><a href="/manager/ActivityStopMemberManager?cp=${pagination.nextPage}">&gt;</a></li>

              <!-- 끝 페이지로 이동 -->
              <li><a href="/manager/ActivityStopMemberManager?cp=${pagination.maxPage}">&gt;&gt;</a></li>

          </ul>
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
  
  <script src="/resources/js/managerMain/ActivityStopMamberManger.js"></script>
</body>
</html>