<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내일로, 기차로! 카페 전체 멤버 관리</title>
  
</head>
<body>
  <main>    
        <!-- ************************************* managerHeader ************************************************** -->
        
        <div class="managerHeader">
          <header>
              <div class="managerHeader-gnb">

                  <div class="tit_area">
                      <h1><a href="#" class="go_nvr">NEVER</a>
                          <a href="#" class="go_adm">카페관리</a></h1>
                      <p><a href="../main.html" class="title">내일로, 기차로! 카페</a></p>
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
                              <a href="../managerMain/managerMain.html"><img src="../../resources/images/free-icon-house-1835281.png">관리홈</a>
                          </li>
                          <li>
                              <a href="../managerMain/basicInfoManager.html"><img src="../../resources/images/settings.png">카페운영</a>
                          </li>
                          <li>
                              <a href="../managerMain/totalMemberManager.html"><img src="../../resources/images/free-icon-friends-7218085.png">멤버•스탭</a>
                          </li>
                          <li>
                              <a href="../managerMain/joinMemberManager.html"><img src="../../resources/images/free-icon-add-friend-4458569.png">가입•등급</a>
                          </li>
                          <li>
                              <a href="../managerMain/menuManager.html"><img src="../../resources/images/free-icon-menu-2550222.png">메뉴</a>
                          </li>
                          <li>
                              <a href="#"><img src="../../resources/images/free-icon-edit-4386594.png">글•글양식</a>
                          </li>
                          <li>
                              <a href=""><img src="../../resources/images/free-icon-spam-alert-5628585.png">삭제글</a>
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
                <a href="#" class="totalMem">전체 멤버 관리</a>
            </li> 
            <li class="manager_totalMem">
              <p>|</p>
            </li>
            <li class="manager_totalMem">
              <a href="#" class="totalMem">활동정지 멤버 관리</a>
            </li> 
            <li class="manager_totalMem">
              <p>|</p>
            </li>
            <li class="manager_totalMem">
              <a href="#" class="totalMem">강제탈퇴 멤버 관리</a>
            </li>
            <li class="manager_totalMem">
              <p>|</p>
            </li>
            <li class="manager_totalMem">
              <a href="#" class="totalMem">스탭 관리</a>
            </li>  
        </ul>
      </div>
      <!-- menuSub 서브 네비-->

      <div class="totalMemberMain">
        <div class="totalMemFromtitle">
            <P>전체 멤버 관리</P>
        </div>
        <form class="_submit()" method="get" name="totalfrmSearch" id="totalfrmSearch">
            <fieldset class="totalSearchfieldset">
              <div class="bx_srch">
                <div class="bx_srch_inner">
                  <div class="srch_in">
                    <label for="mem_srch" class="lb_srch">
                      멤버 검색
                    </label> 
                    <select class="srchOption">
                      <option value="0">아이디</option>
                      <option value="1">별명</option>
                    </select>
                    <input type="text" id="mem_srch" class="text2"  autocomplete="off">
                    <input type="hidden" name="where">
                    <a class="btn_type2_gn" href="#">
                      <span>검색</span>
                    </a>
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
                        <input type="radio" class="check _searchDetailItem" checked="" name="srch_detail" id="srch_write" value="postspace">
                        <label for="srch_write">게시글 수</label>
                      </li>
                      <li>
                        <input type="radio" class="check _searchDetailItem" name="srch_detail" id="srch_comment" value="commentspace">
                        <label for="srch_comment">댓글 수</label>
                      </li>
                      <li>
                        <input type="radio" class="check _searchDetailItem" name="srch_detail" id="srch_visit" value="visitspace">
                        <label for="srch_visit">방문 수</label>
                      </li>
                      <li>
                        <input type="radio" class="check _searchDetailItem" name="srch_detail" id="srch_date" value="datespace">
                        <label for="srch_date">가입/최종방문일</label>
                      </li>
                    </ul>
                    <!-- 게시글 수 체크 하면 나오는 화면 -->
                    <div class="srch_info">
                      <input type="hidden" name="countBy" class="_countBy" value="0">
                      <select class="_period">
                      <option value="0">전체기간</option>
                      <option value="1">최근1개월</option>
                      </select>
                      <span class="txt txt2 _txtPeriod"> 동안</span>
                      <label for="_articleCountInput">게시글수</label>
                      <input type="text"class="text _articleCount _count" id="_articleCountInput" maxlength="4" value="0"> <span class="txt">개</span>
                      <select class="_above">
                      <option value="1">이상</option>
                      <option value="0">이하</option>
                      </select>
                      <span class="txt">인 멤버</span>
                      <a href="#" class="btn_type2_gn _submitPost _submitDetail" searchtype="postspace"><span class="_submitPost _submitDetail" searchtype="postspace">검색</span></a>
                    </div>
                    <!-- 댓글 수 -->
                    <div class="srch_info">
                      <input type="hidden" name="countBy" class="_countBy" value="1">
                      <select class="_period">
                      <option value="0">전체기간</option>
                      <option value="1">최근1개월</option>
                      </select>
                      <span class="txt txt2 _txtPeriod">동안</span>
                      <label for="_commentCountInput">댓글수</label>
                      <input type="text" class="text _commentCount _count" id="_commentCountInput" maxlength="5" value="0"> <span class="txt">개</span>
                      <select class="_above">
                      <option value="1">이상</option>
                      <option value="0">이하</option>
                      </select>
                      <span class="txt">인 멤버</span>
                      <a href="#" class="btn_type2_gn _submitComment _submitDetail" searchtype="commentspace"><span class="_submitComment _submitDetail" searchtype="commentspace">검색</span></a>
                    </div>
                    <!-- 방문수 검색  -->
                    <div class="srch_info">
                      <input type="hidden" name="countBy" class="_countBy" value="2">
                      <select class="_period">
                      <option value="0">전체기간</option>
                      <option value="1">최근1개월</option>
                      </select>
                      <span class="txt txt2 _txtPeriod">동안</span>
                      <label for="_visitCountInput">방문수</label>
                      <input type="text" class="text _visitCount _count" id="_visitCountInput" maxlength="5" value="0"> <span class="txt">회</span>
                      <select  class="_above">
                      <option value="1">이상</option>
                      <option value="0">이하</option>
                      </select>
                      <span class="txt">인 멤버</span>
                      <a href="#" class="btn_type2_gn _submitVisit _submitDetail" searchtype="visitspace"><span class="_submitVisit _submitDetail" searchtype="visitspace">검색</span></a>
                    </div>
                    <!-- 가입/최종방문일 -->
                    <div class="srch_info">
                      <span class="date _startDate" id="_startDateButton">
                        <input type="date" class="text cal _startDate" id="_startDateInput" max="2022-11-10">
                      </span>
									    <span class="txt">부터</span>
									    <span class="date _endDate" id="_endDateButton">
                        <input type="date" class="text cal _endDate" id="_endDateInput" >
                      </span>
									    <span class="txt">까지</span>
                      <select  class="_entryType">
                        <option value="0">가입</option>
                        <option value="1">최종방문</option>
                      </select>
                      <span class="txt">한 멤버</span>
                      <a href="#" class="btn_type2_gn _submitDate" searchtype="datespace"><span class="_submitDate" searchtype="datespace">검색</span></a>
                    </div>
                  </div>
                  <!-- 멤버 상세 검색 -->
                </div>
              </div>
            </fieldset>
        </form>
        <div>
          <div>
            <p class="board_tit">
              <strong>카페 멤버 수</strong>
              <em class="_memberCount">5</em>
            </p>
          </div>
          <!----------------------- 데이터 출력 -------------------------------------------------------------->
          <div class="board_action">
            <div class="action_in">
              선택 멤버를&nbsp;
              <span class="_noLevelCafe">
              <select class="_selectMemberLevel"><option value="1">새내기</option><option value="110">일반여행자</option><option value="120">성실여행자</option><option value="140">우수여행자</option><option value="150">감사멤버</option></select>
              (으)로&nbsp;
              <a class="btn_type _changeLevel" href="#"><span class="_changeLevel">변경</span></a>
              <span class="bar"></span>
              </span>
              <a class="btn_type _stopActivity" href="#"><span class="_stopActivity">활동 정지</span></a>
              <a class="btn_type _forceWithdrawal" href="#"><span class="_forceWithdrawal">강제 탈퇴</span></a>
            </div>
            <div class="action_arr">
              <p>
                <select  id="_sortMemberLevel" class="_noLevelCafe">
                <option value="0">전체 멤버</option>
                <option value="1">새내기</option><option value="110">일반여행자</option><option value="120">성실여행자</option><option value="140">우수여행자</option><option value="150">감사멤버</option></select>
                <select id="_sortPerPage">
                <option value="15">15명 정렬</option>
                <option value="30" selected="">30명 정렬</option>
                <option value="50">50명 정렬</option>
                <option value="100">100명 정렬</option>
                </select>
              </p>
            
            </div>
            <!-- ******************수정요망*********************** -->
            <div class="ly_type _layerChangeLevel" style="display:none;left:209px;top:33px;z-index:100;">
              <div class="ly_cont ly_cont_v2 w250">
                <p>
                  스탭등급 변경은 <em class="c_gn">멤버·스탭&gt;스탭관리</em>에서<br>
                  스탭권한 해지 후 가능합니다.<br>
                  <strong><span class="c_og">스탭 권한을 변경</span> 하시겠습니까?</strong>
                </p>
                <div class="btn">
                  <a href="/ManageCafeStaffView.nhn?clubid=30828148" class="btn_type3 _changeCafeStaff" manager="true"><strong class="_changeCafeStaff" manager="true">스탭 권한 변경하러 가기</strong></a>
                  <a href="#" class="btn_type3 _hideLayer"><span class="_hideLayer">취소</span></a>
                </div>
              </div>
              <a href="#" class="clse _hideLayer"><span class="blind">닫기</span></a>
            </div>
  
            <div class="ly_type _layerStopActivity" style="display:none;left:261px;top:33px;z-index:100;">
              <div class="ly_cont ly_cont_v2 w250">
                <p>
                  카페스탭은 활동정지 할 수 없습니다.<br>
                  <em class="c_gn">멤버·스탭&gt;스탭관리</em>에서 스탭권한 해지 후<br>
                  가능합니다.<br>
                  <strong><span class="c_og">스탭 권한을 변경</span> 하시겠습니까?</strong>
                </p>
                <div class="btn">
                  <a href="/ManageCafeStaffView.nhn?clubid=30828148" class="btn_type3 _changeCafeStaff" manager="true"><strong class="_changeCafeStaff" manager="true">스탭 권한 변경하러 가기</strong></a>
                  <a href="#" class="btn_type3 _hideLayer"><span class="_hideLayer">취소</span></a>
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
            
            <th scope="col"><strong>별명(아이디)</strong></th>
             
            <th scope="col"><strong class="line_r">멤버 등급</strong></th>
            
            <th scope="col" class="selected "><strong class="line_r"><a href="#" class="_sortType" code="0">가입일<span class="bu _sortType" code="0">▼</span></a></strong></th>
            
            <th scope="col" class=""><strong class="line_r"><a href="#" class="_sortType" code="1">최종방문일<span class="bu _sortType" code="1">▼</span></a></strong></th>
            
            <th scope="col" class=""><strong class="line_r"><a href="#" class="_sortType" code="2">방문수<span class="bu _sortType" code="2">▼</span></a></strong></th>
            
            <th scope="col" class=""><strong class="line_r"><a href="#" class="_sortType" code="3">게시글수<span class="bu _sortType" code="3">▼</span></a></strong></th>
            
            <th scope="col" class="last"><strong><a href="#" class="_sortType" code="4">댓글수<span class="bu _sortType" code="4">▼</span></a></strong></th>
            
          </tr>
            </thead>
            <tbody>
              <tr class="_checkable " memberid="shuxi91">
            <td class="tc">
              <input type="checkbox" name="c1" id="c1" title="선택" class="check _checkMember" value="shuxi91" manager="false" staff="false">
            </td>
            <td>
              <div class="pers_nick_area">
                <span class="img"><img src="https://ssl.pstatic.net/static/cafe/cafe_profile3_40x40.gif" width="20" height="20" alt="" onerror="this.onerror=null;this.src='https://ssl.pstatic.net/static/cafe/cafe_profile3_45x45.gif'"></span><a href="#" class="nick _userInfo _click(NicknameUI|OpenUI|shuxi91) _stopDefault" memberid="shuxi91">김서희 (shuxi91)</a>
              </div>
            </td>
               
            <td>
              <span class="txt c_gy2"><img width="11" height="11" alt="" src="https://cafe.pstatic.net/levelicon/1/1_1.gif" class="ico_level">새내기</span>
            </td>
            
            
            <td class="tc">
              
              <span class="num">2022.11.03.</span>
              
            </td>
            
            <td class="tc">
              
              <span class="num">2022.11.11.</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">16</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">22</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">2</span>
              
            </td>
            
          </tr><tr class="_checkable " memberid="rkdalsrb65">
            <td class="tc">
              <input type="checkbox" name="c1" id="c1" title="선택" class="check _checkMember" value="rkdalsrb65" manager="false" staff="false">
            </td>
            <td>
              <div class="pers_nick_area">
                <span class="img"><img src="https://ssl.pstatic.net/static/cafe/cafe_profile3_40x40.gif" width="20" height="20" alt="" onerror="this.onerror=null;this.src='https://ssl.pstatic.net/static/cafe/cafe_profile3_45x45.gif'"></span><a href="#" class="nick _userInfo _click(NicknameUI|OpenUI|rkdalsrb65) _stopDefault" memberid="rkdalsrb65">상남자 (rkdalsrb65)</a>
              </div>
            </td>

            <td>
              <span class="txt c_gy2"><img width="11" height="11" alt="" src="https://cafe.pstatic.net/levelicon/1/1_1.gif" class="ico_level">새내기</span>
            </td>
            
            
            <td class="tc">
              
              <span class="num">2022.10.24.</span>
              
            </td>
            
            <td class="tc">
              
              <span class="num">2022.11.11.</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">11</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">3</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">3</span>
              
            </td>
            
          </tr><tr class="_checkable " memberid="wldbs4166">
            <td class="tc">
              <input type="checkbox" name="c1" id="c1" title="선택" class="check _checkMember" value="wldbs4166" manager="false" staff="true">
            </td>
            <td>
              <div class="pers_nick_area">
                <span class="img"><img src="https://ssl.pstatic.net/static/cafe/cafe_profile3_40x40.gif" width="20" height="20" alt="" onerror="this.onerror=null;this.src='https://ssl.pstatic.net/static/cafe/cafe_profile3_45x45.gif'"></span><a href="#" class="nick _userInfo _click(NicknameUI|OpenUI|wldbs4166) _stopDefault" memberid="wldbs4166">김지윤1010 (wldbs4166)</a>
              </div>
            </td>

            <td>
              <span class="txt c_gy2"><img width="11" height="11" alt="" src="https://cafe.pstatic.net/levelicon/1/1_888.gif" class="ico_level">부 매니저</span>
            </td>
            
            
            <td class="tc">
              
              <span class="num">2022.10.24.</span>
              
            </td>
            
            <td class="tc">
              
              <span class="num">2022.11.13.</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">46</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">2</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">0</span>
              
            </td>
            
          </tr><tr class="_checkable " memberid="o_oyoon97">
            <td class="tc">
              <input type="checkbox" name="c1" id="c1" title="선택" class="check _checkMember" value="o_oyoon97" manager="false" staff="false">
            </td>
            <td>
              <div class="pers_nick_area">
                <span class="img"><img src="https://ssl.pstatic.net/static/cafe/cafe_profile3_40x40.gif" width="20" height="20" alt="" onerror="this.onerror=null;this.src='https://ssl.pstatic.net/static/cafe/cafe_profile3_45x45.gif'"></span><a href="#" class="nick _userInfo _click(NicknameUI|OpenUI|o_oyoon97) _stopDefault" memberid="o_oyoon97">이빨다뽑힘 (o_oyoon97)</a>
              </div>
            </td>

            <td>
              <span class="txt c_gy2"><img width="11" height="11" alt="" src="https://cafe.pstatic.net/levelicon/1/1_150.gif" class="ico_level">감사멤버</span>
            </td>
            
            
            <td class="tc">
              
              <span class="num">2022.10.17.</span>
              
            </td>
            
            <td class="tc">
              
              <span class="num">2022.11.11.</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">29</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">3</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">5</span>
              
            </td>
            
          </tr><tr class="_checkable  line_b" memberid="wish0827">
            <td class="tc">
              <input type="checkbox" name="c1" id="c1" title="선택" class="check _checkMember" value="wish0827" manager="true" staff="false">
            </td>
            <td>
              <div class="pers_nick_area">
                <span class="img"><img src="https://ssl.pstatic.net/static/cafe/cafe_profile3_40x40.gif" width="20" height="20" alt="" onerror="this.onerror=null;this.src='https://ssl.pstatic.net/static/cafe/cafe_profile3_45x45.gif'"></span><a href="#" class="nick _userInfo _click(NicknameUI|OpenUI|wish0827) _stopDefault" memberid="wish0827">JH (wish0827)</a>
              </div>
            </td>

            <td>
              <span class="txt c_gy2"><img width="11" height="11" alt="" src="https://cafe.pstatic.net/levelicon/1/1_999.gif" class="ico_level">카페매니저</span>
            </td>
            
            
            <td class="tc">
              
              <span class="num">2022.10.14.</span>
              
            </td>
            
            <td class="tc">
              
              <span class="num">2022.11.11.</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">70</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">22</span>
              
            </td>
            
            <td class="tr">
              
              <span class="num">20</span>
              
            </td>
            
          </tr>
            </tbody>
          </table></div>
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
  
  <script src="../../resources/js/managerMain/totalMamberManger.js"></script>
</body>
</html>