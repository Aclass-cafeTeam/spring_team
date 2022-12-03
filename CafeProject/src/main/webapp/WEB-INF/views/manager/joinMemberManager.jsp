<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내일로, 기차로! 카페 가입 정보 관리</title>
    <link rel="stylesheet" href="../../resources/css/managerMain/joinMemberManager.css">
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
    <div class="lnb_sub" id="menuSub4">
      <ul>
          <li class="manager_joinMem">
              <a href="#" class="joinMem">가입 정보 관리</a>
          </li> 
          <li class="manager_joinMem">
            <p>|</p>
          </li>
          <li class="manager_joinMem">
            <a href="/manager/gradeMemberManager" class="joinMem">멤버 등급 관리</a>
          </li>  
      </ul>
    </div>
    <!-- menuSub 서브 네비-->

    <div class="joinMemberMain">
        <div class="joinMemMainFromtitle">
            <P>가입 정보 관리</P>
        </div>
        <form action="joinMemberManager/updateJoin" method="POST" 
                    name="cafeJoin-frm"
                    onsubmit="return JoinSubmit()">
            <fieldset class="joinfieldset">

                <div class="joinTablecol">
                    <div class="joinTablerow1">
                        <p>가입 안내</p>
                    </div>
                    <div class="joinTablerow2">
                        <div class="joinTablerow2Box">
                          <div>
                            <textarea cols="30" rows="10" class="input_information" disabled>여행하는 사람과 사람이 만나고, 인연을 함께 만드는 공간. 내일로, 기차로입니다. 내일로, 기차로의 회원이기만 해도 받을 수 있는 혜택도 마련되어 있어요!</textarea>
                          </div>
                          <div class="input_informationExplan">
                            <p class="">· 멤버의 카페 가입 시 안내 문구로 수정 불가능합니다.</p>
                          </div>
                            
                        </div>
                    </div>
                </div>
                <div class="joinTablecol">
                    <div class="joinTablerow1">
                        <p>가입 신청 받기</p>
                    </div>
                    <div class="joinTablerow2">
                        <div class="joinTablerow2Box">
                              <div class="totalaccept">
                                <div class="accept_y">
                                  <input id="join_get01" type="radio" name="join_get" class="use_check ${cafeInfo.cafeJoinFL}" value="Y">
                                <label for="join_get01">가입신청을 받습니다.</label>
                                </div>
                                <div class="accept_n">
                                  <input id="join_get02" type="radio" name="join_get" class="use_check ${cafeInfo.cafeJoinFL}" value="N">
                                  <label  for="join_get02">당분간 가입신청을 받지 않습니다.</label>
                                </div>
                              </div>                            
                        </div>
                    </div>
                </div>
                <div class="joinTablecol">
                  <div class="joinTablerow1">
                    <P>
                      가입조건 성별
                    </P>
                  </div>
                  <div class="joinTablerow2">
                    <div class="joinTablerow2Box">
                      <p class="joinText">모두</p>
                    </div>
                  </div>  
                </div>
                <div class="joinTablecol last">
                  <div class="joinTablerow1">
                    <P>
                      가입조건 연령
                    </P>
                  </div>
                  <div class="joinTablerow2">
                    <div class="joinTablerow2Box">
                      <p class="joinText">모두</p>
                    </div>
                  </div>  
                </div>
              
                <div class="joinButton">
                  <div class="joinbuttonBox">
                    <button type="reset" class="joincancel">취소</button>
                    <button type="submit" class="joinSave">저장하기</button>
                  </div>
                </div>
            </fieldset>
        </form>
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

  <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  
  <script src="/resources/js/managerMain/joinMemberManager.js"></script>
</body>
</html>