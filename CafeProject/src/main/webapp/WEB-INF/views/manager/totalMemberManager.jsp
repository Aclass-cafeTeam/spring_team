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
    <link rel="stylesheet" href="/resources/css/managerMain/totalMemberManager.css">
  
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
      <div class="totalMemberMain">
        <div class="totalMemFromtitle">
            <P>전체 멤버 관리</P>
        </div>
            <div class="totalSearchfieldset">
              <div class="bx_srch">
                <div class="bx_srch_inner">
                  
                    <div class="srch_in">
                      <form action ="/manager/totalMemberManager/selectInputMember" class="totalfrmSearch" method="get" name="totalfrmSearch" id="totalfrmSearch">
                        <label for="mem_srch" class="lb_srch">
                          멤버 검색
                        </label> 
                        <select  id = "srchOption" class="${srchOption}" name="srchOption" >
                          <option value="0" selected="">아이디</option>
                          <option value="1">닉네임</option>
                        </select>
                        <input type="text" name="inputMember" id="inputMember" class="inputMember">
                        <!-- <input type="hidden" name="where"> -->
                        <button type="submit" id="selectInputMember1" class="btn_type2_gn" >
                          검색
                        </button>
                      </form> 
                      <a class="btn_type2 _showDetailSearch" href="#">
                        <span>
                          상세 검색
                          <span class="bu">▼</span>
                        </span>
                      </a>
                    </div>
                  
                  <!-- 멤버상세검색 -->
						      <div class="srch_detail">
                    <ul>
                      <li>
                        <input type="radio" class="check _searchDetailItem" checked="" name="srch_detail" id="srch_write" value="0"><%-- postspace --%>
                        <label for="srch_write">게시글 수</label>
                      </li>
                      <li>
                        <input type="radio" class="check _searchDetailItem" name="srch_detail" id="srch_comment" value="1"><%-- commentspace --%>
                        <label for="srch_comment">댓글 수</label>
                      </li>
                      <li>
                        <input type="radio" class="check _searchDetailItem" name="srch_detail" id="srch_visit" value="2"><%-- visitspace --%>
                        <label for="srch_visit">방문 수</label>
                      </li>
                      <li>
                        <input type="radio" class="check _searchDetailItem" name="srch_detail" id="srch_date" value="3"><%-- datespace --%>
                        <label for="srch_date">가입/최종방문일</label>
                      </li>
                    </ul>
                    <!-- 게시글 수 체크 하면 나오는 화면 -->
                    <div class="srch_info">
                      <form action ="/manager/totalMemberManager/selectDetailBoard" class="BoardfrmSearch" method="get" name="BoardfrmSearch" id="BoardfrmSearch">
                      <input type="hidden" name="countBy" class="_countBy" value="0">
                      <select class="${periodOption} _period periodBoard" name="periodOption" id="periodOption">
                      <option value="0" selected="">전체기간</option>
                      <option value="1">최근1개월</option>
                      </select>
                      <span class="txt txt2 _txtPeriod"> 동안</span>
                      <label for="_articleCountInput">게시글수</label>
                      <input type="number" min="0" class="text _articleCount _count" id="_articleCountInput" name="articleCountInput" maxlength="4" value="0"> <span class="txt">개</span>
                      <select class="${aboveOption} _above 
                      aboveBoard" name="aboveOption" id="aboveOption">
                      <option value="1" selected="">이상</option>
                      <option value="0">이하</option>
                      </select>
                      <span class="txt">인 멤버</span>
                      <button type="submit" class="btn_type2_gn _submitPost _submitDetail" searchtype="postspace">검색</button>
                    </form>
                    </div>
                    <!-- 댓글 수 -->
                    <div class="srch_info">
                      <form action ="/manager/totalMemberManager/selectDetailComment" class="CommentfrmSearch" method="get" name="CommentfrmSearch" id="CommentfrmSearch">
                        <input type="hidden" name="countBy" class="_countBy" value="1">
                        <select class="${periodOption} _period periodComment" name="periodOption" id="periodOption">
                        <option value="0" selected="">전체기간</option>
                        <option value="1">최근1개월</option>
                        </select>
                        <span class="txt txt2 _txtPeriod">동안</span>
                        <label for="_commentCountInput">댓글수</label>
                        <input type="number" min="0" name="commentCountInput" class="text _commentCount _count" id="_commentCountInput" maxlength="5" value="0"> <span class="txt">개</span>
                        <select class="${aboveOption} _above aboveComment" name="aboveOption" id="aboveOption">
                        <option value="1" selected="">이상</option>
                        <option value="0">이하</option>
                        </select>
                        <span class="txt">인 멤버</span>
                        <button type="submit" class="btn_type2_gn _submitComment _submitDetail" searchtype="commentspace">검색</button>
                      </form>
                    </div>
                    <!-- 방문수 검색  -->
                    <div class="srch_info">
                      <form action ="/manager/totalMemberManager/selectDetailVisitCount" class="VisitCountfrmSearch" method="get" name="VisitCountfrmSearch" id="VisitCountfrmSearch">
                        <input type="hidden" name="countBy" class="_countBy" value="2">
                        <select class="${periodOption} _period periodVisit" name="periodOption" id="periodOption">
                        <option value="0" selected="">전체기간</option>
                        <option value="1">최근1개월</option>
                        </select>
                        <span class="txt txt2 _txtPeriod">동안</span>
                        <label for="_visitCountInput">방문수</label>
                        <input type="number" min="0" name="visitCountInput" class="text _visitCount _count" id="_visitCountInput" maxlength="5" value="0"> <span class="txt">회</span>
                        <select  class="${aboveOption} _above aboveVisit" name="aboveOption" id="aboveOption">
                        <option value="1" selected="">이상</option>
                        <option value="0">이하</option>
                        </select>
                        <span class="txt">인 멤버</span>
                        <button type="submit" class="btn_type2_gn _submitVisit _submitDetail" searchtype="visitspace">검색</button>
                      </form>
                    </div>
                    <!-- 가입/최종방문일 -->
                    <div class="srch_info">
                      <form action ="/manager/totalMemberManager/selectDetailDate" class="DatefrmSearch" method="get" name="DatefrmSearch" id="DatefrmSearch">
                        <input type="hidden" name="countBy" class="_countBy" value="3">
                        <span class="date _startDate" id="_startDateButton">
                          <input type="date" class="text cal _startDate" name="startDateInput" id="_startDateInput" max="2022-11-10">
                        </span>
                        <span class="txt">부터</span>
                        <span class="date _endDate" id="_endDateButton">
                          <input type="date" class="text cal _endDate" id="_endDateInput" name="endDateInput">
                        </span>
                        <span class="txt">까지</span>
                        <select  class="_entryType ${entryType}" name="entryType" id="_entryType">
                          <option value="0" selected="">가입</option>
                          <option value="1">최종방문</option>
                        </select>
                        <span class="txt">한 멤버</span>
                        <button type="submit" class="btn_type2_gn _submitDate _submitDetail" searchtype="datespace">검색</button>
                      </form>
                    </div>
                  </div>
                  <!-- 멤버 상세 검색 -->
                </div>
              </div>
            </div>
        <div>
          <div>
            <p class="board_tit">
              <strong>카페 멤버 수</strong>
              <em class="_memberCount">${memberCount}</em>
            </p>
          </div>
          <!----------------------- 데이터 출력 -------------------------------------------------------------->
          <div class="board_action">
            <div class="action_in">
              선택 멤버를&nbsp;
              <span class="_noLevelCafe">
              <select class="_selectMemberLevel" id="_selectMemberLevel">
                <c:if test="${not empty memberLevel}">
                  <c:forEach var="memberLevels" items="${memberLevel}">
                    <c:if test="${memberLevels.MEMBER_LEVEL_NO ge 2}">
                      <option value="${memberLevels.MEMBER_LEVEL_NO}">${memberLevels.MEMBER_LEVEL_NAME}</option>
                    </c:if>
                  </c:forEach>
                </c:if>
              </select>
              (으)로&nbsp;
              <a class="btn_type _changeLevel" id="_changeLevel" href="#"><span class="_changeLevel">변경</span></a>
              <span class="bar"></span>
              </span>
              <a class="btn_type _stopActivity" id="_stopActivity"  href="#"><span class="_stopActivity">활동 정지</span></a>
              <a class="btn_type _forceWithdrawal" id="_forceWithdrawal"  href="#"><span class="_forceWithdrawal">강제 탈퇴</span></a>
            </div>
            <div class="action_arr">
              <p>
                <form name = "sortMemberLevelFrm" action="/manager/totalMemberManager/sortMemberLevel" method="get">
                  <select  id="_sortMemberLevel" class="${memberLevelNoResult}" name="memberLevelNo">
                  <option value="0" selected="">전체 멤버</option>
                  <option value="${memberLevel[2].MEMBER_LEVEL_NO}">${memberLevel[2].MEMBER_LEVEL_NAME}</option><option value="${memberLevel[3].MEMBER_LEVEL_NO}">${memberLevel[3].MEMBER_LEVEL_NAME}</option><option value="${memberLevel[4].MEMBER_LEVEL_NO}">${memberLevel[4].MEMBER_LEVEL_NAME}</option><option value="${memberLevel[5].MEMBER_LEVEL_NO}">${memberLevel[5].MEMBER_LEVEL_NAME}</option><option value="${memberLevel[6].MEMBER_LEVEL_NO}">${memberLevel[6].MEMBER_LEVEL_NAME}</option></select>
                <!-- </form>
                <form name = "limitFrm" action="/manager/totalMemberManager" method="get"> -->
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
            <div class="ly_type _layerChangeLevel" id="_layerChangeLevel" style="display:none;left:209px;top:33px;z-index:100;">
              <div class="ly_cont ly_cont_v2 w250">
                <p>
                  스탭등급 변경은 <em class="c_gn">멤버·스탭&gt;스탭관리</em>에서<br>
                  스탭권한 해지 후 가능합니다.<br>
                  <strong><span class="c_og">스탭 권한을 변경</span> 하시겠습니까?</strong>
                </p>
                <div class="btn">
                  <a href="/manager/ManageCafeStaffView" class="btn_type3 _changeCafeStaff" manager="true"><strong class="_changeCafeStaff" manager="true">스탭 권한 변경하러 가기</strong></a>
                  <a href="#" class="btn_type3 _hideLayer"><span class="_hideLayer">취소</span></a>
                </div>
              </div>
              <a href="#" class="clse _hideLayer"><span class="blind">닫기</span></a>
            </div>
  
            <div class="ly_type _layerStopActivity" id="_layerStopActivity" style="display:none;left:261px;top:33px;z-index:100;">
              <div class="ly_cont ly_cont_v2 w250">
                <p>
                  카페스탭은 활동정지 할 수 없습니다.<br>
                  <em class="c_gn">멤버·스탭&gt;스탭관리</em>에서 스탭권한 해지 후<br>
                  가능합니다.<br>
                  <strong><span class="c_og">스탭 권한을 변경</span> 하시겠습니까?</strong>
                </p>
                <div class="btn btn2">
                  <a href="/manager/ManageCafeStaffView" class="btn_type4 _changeCafeStaff" manager="true"><strong class="_changeCafeStaff" manager="true">스탭 권한 변경하러 가기</strong></a>
                  <a href="#" class="btn_type4 _hideLayer"><span class="_hideLayer">취소</span></a>
                </div>
              </div>
              <a href="#" class="clse _hideLayer"><span class="blind">닫기</span></a>
            </div>
            <!-- ******************수정요망*********************** -->
          </div>
          <!-- 데이터 출력--------------------------- ---------------------------------------------------------------->
          <div id="_tableContent"><table border="1" cellspacing="0" class="tbl_lst_type">	
            <caption><span class="blind">전체 멤버 관리 정보</span></caption>				
            <colgroup>
              <col width="23"><col width="*"><col width="142"><col width="81"><col width="81"><col width="86"><col width="86"><col width="85">
            </colgroup>
            <thead>
              <tr>
            <th scope="col" class="frst"><input name="c1" id="c1" title="선택" class="check _checkAll" type="checkbox"></th>
            
            <th scope="col"><strong class="line_n">별명(아이디)</strong></th>
             
            <th scope="col"><strong class="line_n">멤버 등급</strong></th>
            
            <th scope="col" class="selected "><strong class="line_r"><a href="#" class="_sortType" code="0">가입일<span class="bu _sortType buNone" code="0">▼</span></a></strong></th>
            
            <th scope="col" class=""><strong class="line_r"><a href="#" class="_sortType" code="1">최종방문일<span class="bu _sortType buNone" code="1">▼</span></a></strong></th>
            
            <th scope="col" class=""><a href="#" class="_sortType" code="2">방문수<span class="bu _sortType buNone" code="2">▼</span></a></strong></th>
            
            <th scope="col" class=""><strong class="line_r"><a href="#" class="_sortType" code="3">게시글수<span class="bu _sortType buNone" code="3">▼</span></a></strong></th>
            
            <th scope="col" class="last"><strong><a href="#" class="_sortType" code="4">댓글수<span class="bu _sortType buNone" code="4">▼</span></a></strong></th>
            
          </tr>
            </thead>
            <tbody id = "selecttbody">

              <c:choose>

                <c:when test="${empty memberList}">
                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                  <tr class="line_b noneSelect">
                    <td class="tc" colspan="8">검색 조건에 해당하는 멤버가 없습니다.</td>
                  </tr>
                </c:when>

                <c:otherwise>
                  <!-- 게시글 목록 조회 결과가 있다면 -->
                  <c:forEach var="member" items="${memberList}">
                    <tr class="_checkable " memberid="${member.memberEmail}">
                      <td class="tc">
                        <input type="checkbox" name="c1" id="c1" title="선택" class="check _checkMember" value="${member.memberEmail}" manager="false" staff="false">
                      </td>
                      <td>
                        <div class="pers_nick_area">
                          <span class="img">
                            <img id="checkImg${member.memberEmail}" src="${member.profileImage}"  alt="">
                          </span>
                          <a href="#" id="checkMember${member.memberEmail}" class="nick _userInfo _click(NicknameUI|OpenUI|${member.memberEmail}) _stopDefault" memberid="${member.memberEmail}">${member.memberNickname} (${member.memberEmail})</a>
                        </div>
                      </td>
                      <td>
                        <span class="txt c_gy2">
                          <c:choose>
                            <c:when test="${(member.authorityName eq '카페매니저') or (member.authorityName eq '부매니저')}">
                              <img alt="" src="${member.authorityImg}" class="ico_level" >
                              <%-- ${member.authorityName} --%>
                              <div id="ico_level${member.memberEmail}" class ="ico_level_div">${member.authorityName}</div>
                            </c:when>
                            <c:otherwise>
                              <img alt="" src="${member.memberLevelImg}" class="ico_level" id="ico_img${member.memberEmail}">
                              <%-- ${member.memberLevelName} --%>
                              <div id="ico_level${member.memberEmail}" class ="ico_level_div">${member.memberLevelName}</div>
                            </c:otherwise>
                          </c:choose>
                        </span>
                      </td>
                      <td class="tc">                  
                        <span class="num">${member.enrollDate}.</span>
                      </td>
                      <td class="tc">
                        <span class="num">${member.loginDate}.</span>
                      </td>
                      <td class="tr">
                        <span class="num">${member.logHistoryCount}</span>
                      </td>
                      <td class="tr">
                        <span class="num">${member.commentCount}</span>
                      </td>
                      <td class="tr">
                        <span class="num">${member.boardCount}</span>
                        <input type="hidden" id="memberDeleteFlag${member.memberEmail}" name="memberDeleteFlag" value="${member.memberDeleteFlag}">
                      </td>                
                    </tr>
                  </c:forEach>
                </c:otherwise>
              </c:choose>

            </tbody>
          </table></div>
        </div>
        <div class="pagination-area">


          <ul class="pagination">
          
              <!-- 첫 페이지로 이동 -->
              <li><a href="/manager/totalMemberManager${requestURL}?cp=1${sURL}">&lt;&lt;</a></li>

              <!-- 이전 목록 마지막 번호로 이동 -->
              <li><a href="/manager/totalMemberManager${requestURL}?cp=${pagination.prevPage}${sURL}">&lt;</a></li>

    
              <!-- 특정 페이지로 이동 -->
              <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                <c:choose>
                  <c:when test="${i== pagination.currentPage}">
                    <!-- 현재 페이지인 경우 -->
                    <li><a class="current">${i}</a></li>
                  </c:when>
                  <c:otherwise>
                    <!-- 현재 페이지를 제외한 나머지 -->
                    <li><a href="/manager/totalMemberManager${requestURL}?cp=${i}${sURL}">${i}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <!-- 다음 목록 시작 번호로 이동 -->
              <li><a href="/manager/totalMemberManager${requestURL}?cp=${pagination.nextPage}${sURL}">&gt;</a></li>

              <!-- 끝 페이지로 이동 -->
              <li><a href="/manager/totalMemberManager${requestURL}?cp=${pagination.maxPage}${sURL}">&gt;&gt;</a></li>

          </ul>
      </div>

      </div>


  <!-- 푸터 -->
  <footer>
    <p class="cr">
        <em>Since 2022.10.14. © </em> 
        <span> 내일로, 기차로! 카페</span>
    </p>
  </footer>
  </main>
  
  <!-- 푸터 -->
  <!-- jQuery  -->
  <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  
  <script src="/resources/js/managerMain/totalMamberManger.js"></script>
</body>
</html>