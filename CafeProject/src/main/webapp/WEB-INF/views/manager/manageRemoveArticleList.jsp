<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="removeBoardList" value="${map.removeBoardList}"/>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내일로, 기차로! 카페 전체 멤버 관리</title>
    <link rel="stylesheet" href="/resources/css/managerMain/manageRemoveArticleList.css">
  
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

      <!-- ************************************* managerHeader ************************************************** /댓글 보기-->
      <!-- menuSub 서브 네비-->
      <div class="lnb_sub" id="menuSub3">
        <ul>
            <li class="manager_totalMem">
                <a href="/manager/manageRemoveArticleList" class="totalMem">삭제 글</a>
            </li> 
        </ul>
      </div>
      <!-- menuSub 서브 네비-->


      <div id="container">
		
        <div id="content">
          <div class="section_top">
            <div class="manage_remove_top">
              <h2 class="manage_remove_title">
                삭제 글<!-- /댓글 보기 -->
              </h2>
              <ul class="manage_remove_tab_list">
                <li class="manage_remove_tab_item">
                  <a href="/manager/manageRemoveArticleList" class="manage_remove_tab_link is_active">삭제한 게시글 보기</a>
                </li>
                <!-- <li class="manage_remove_tab_item">
                  <a href="/manager/manageRemoveCommentList" class="manage_remove_tab_link">삭제한 댓글 보기</a>
                </li> -->
              </ul>
            </div>
            <div class="noti_area">
              <p class="dsc2 c_gn">최근 1개월 동안 카페 매니저 또는 스탭에 의해 삭제된 게시글 목록입니다.</p>
            </div>
          </div>
          <div class="section_cont">
            <div class="board_area bd_n">
              <div class="board_top board_top_v1">
                <form id="searchForm" action="">
                  
                  <input type="hidden" name="search.page" value="1">
                  <input type="hidden" name="search.writerid" value="">
                  <input type="hidden" name="search.deleteid" value="">
                  <input type="hidden" name="search.searchStartDate">
                  <input type="hidden" name="search.searchEndDate">
                  <input type="hidden" name="search.searchBaseDate">
                  <input type="hidden" name="search.direction">
                    <p class="board_tit">
                      <strong>삭제된 게시글</strong> <em>${map.listCount}</em> <strong>건</strong>
                      
                    </p>
                   <!--  <div class="action_arr">
                      <div class="srch_info">
                        <select id="searchType" name="searchType" style="width:80px;height:21px" class="_change(ManageRemoveArticleList|SearchType)">
                        <option value="1">작성자</option>
                        <option value="2">삭제일</option>
                        </select>
                        <input type="text" id="searchKeyword" name="search.searchkeyword" class="text _keydown(ManageRemoveArticleList|SearchKeyword)" style="width:178px;" value="">
                        <span id="searchKeywordDate" style="display:none;">
                        <span class="date" id="startButton"><input id="startDate" type="text" class="text cal" value="2022.11.25." style="width:65px" readonly=""></span>
                        <span class="txt">~</span>
                        <span class="date" id="endButton"><input id="endDate" type="text" class="text cal" value="2022.12.08." style="width:65px" readonly=""></span>
                        </span>
                        <a href="#" class="btn_type _click(ManageRemoveArticleList|SearchKeyword) _stopDefault"><span>검색</span></a>
                      </div>
                    </div> -->
                </form>
              </div>
              <table border="1" cellspacing="0" class="tbl_lst_type tbl_v2">
                <caption><span class="blind">삭제된 게시글 목록</span></caption>
                <colgroup>
                <col width="146">
                <col width="*">
                <col width="144">
                <col width="144">
                <col width="100">
                </colgroup>
                <thead>
                    <tr>
                    
                    <th scope="col" class="frst"><strong class="line_r">메뉴명</strong></th>
                    <th scope="col"><strong class="line_r">제목</strong></th>
                    <th scope="col"><strong class="line_r">작성자</strong></th>
                    <th scope="col"><strong class="line_r">삭제일</strong></th>
                    
                    <th scope="col" class="last"><strong>복구</strong></th>
                    </tr>
                </thead>
                <tbody> 
                  <c:choose>

                    <c:when test="${empty removeBoardList}">
                    <!-- 게시글 목록 조회 결과가 비어있다면 -->
                      <tr class="line_b noneSelect">
                        <td class="tc" colspan="5">검색 조건에 해당하는 게시글이 없습니다.</td>
                      </tr>
                    </c:when>
                    <c:otherwise>
                      <c:forEach var="Board" items="${removeBoardList}">
                        <tr class="tr${Board.boardCode}" id="tr${Board.boardCode}">
                          <input type="hidden" class="TypeDelFL${Board.boardCode}" id="TypeDelFL${Board.boardCode}" name="TypeDelFL${Board.boardCode}" value="${Board.getTypeDelFL()}">
                          <input type="hidden" class="boardCode" id="boardCode" name="boardCode" value="${Board.boardCode}">
                          <td class="tl">
                            <div class="ellipsis"><span class="txt4 c_gy2">${Board.boardName}</span></div>
                          </td>
                          <td> 
                            <a href="#" class="tit c_gy3 _click(ManageRemoveArticleList|ArticleRead|${Board.boardCode}) _stopDefault" id="${Board.boardNo}">${Board.boardTitle}</a>
                          </td>
                          <td class="tl">
                            <div class="ellipsis"><a href="#" class="txt4 c_gy _click(NicknameUI|OpenUI|${Board.memberEmail}) _stopDefault" disabled='true'>${Board.memberNickname}(${Board.memberEmail})</a></div>
                          </td>
                          <td class="tc">
                            <span class="num">${Board.BCreateDate}.</span>
                          </td>
                          <td class="tc">
                            <a href="#" id="reBtn" title="${Board.boardCode}" class="reBtn btn_type _click(ManageRemoveArticleList|Restore|16|${Board.boardCode}) _stopDefault"><span>복구</span></a>
                          </td>
                        </tr>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>



                  <!--   <tr>
                      <td class="tl">
                        <div class="ellipsis"><span class="txt4 c_gy2">여행 후기</span></div>
                      </td>
                      <td> 
                        <a href="#" class="tit c_gy3 _click(ManageRemoveArticleList|ArticleRead|62) _stopDefault">11</a>
                      </td>
                      <td class="tl">
                        <div class="ellipsis"><a href="#" class="txt4 c_gy _click(NicknameUI|OpenUI|o_oyoon97) _stopDefault">이빨다뽑힘(o_oyoon97)</a></div>
                      </td>
                      <td class="tc">
                        <span class="num">2022.11.27.</span>
                      </td>
                      <td class="tc">
                        <a href="#" class="btn_type _click(ManageRemoveArticleList|Restore|16|62) _stopDefault"><span>복구</span></a>
                      </td>
                    </tr> -->
                
                </tbody>
              </table>
            </div>
            

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


                          <form id="restoreForm" action="/ManageRemoveArticleRestore.nhn" method="post">
                          <input type="hidden" name="redirectUrl" value="/ManageRemoveArticleList.nhn">
                          <input type="hidden" name="menuid" value="">
                          <input type="hidden" name="articleid" value="">
                          <input type="hidden" name="search.clubid" value="30828148">
                          <input type="hidden" name="search.searchtype" value="0">
                          <input type="hidden" name="search.page" value="1">
                          <input type="hidden" name="search.writerid" value="">
                          <input type="hidden" name="search.deleteid" value="">
                          <input type="hidden" name="search.searchStartDate" value="20221125">
                          <input type="hidden" name="search.searchEndDate" value="20221208">
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
  
  <script src="/resources/js/managerMain/manageRemoveArticleList.js"></script>
</body>
</html>