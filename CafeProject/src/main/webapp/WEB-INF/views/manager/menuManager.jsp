<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="boardType" value="${map.boardType}"/>
<c:set var="mainCategory" value="${map.mainCategory}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내일로, 기차로! 카페 메뉴관리</title>
    <link rel="stylesheet" href="/resources/css/managerMain/menuManager.css">
    
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
                <a href="#" class="joinMem">메뉴관리</a>
            </li> 
        </ul>
        </div>
        <!-- menuSub 서브 네비-->
        <div id="app">
        <div id="content">
            <div class="admin_menu_management">
                <div class="section_top">
                    <div class="h_cont">
                        <h2 class="menu4_sub">메뉴관리</h2>
                    </div>
                </div>

                <div class="section_cont">
                    <div class="group_menu">
                        <!--  -->
                        <div class="group-row">
                            <!-- 메뉴 추가 부분 -->
                            <div class="add_group" style="height: 696px;">
                                <div class="add_lst">
                                    <!-- <h3>기본메뉴</h3> -->
                                    <ul>
                                        <li class="off">
                                            <a class="ba_v1 B">
                                                <span>전체글보기</span>
                                            </a>
                                        </li>
                                        <li class="off">
                                            <a class="ba_v2 B">
                                                <span class="">베스트게시글</span>
                                            </a>
                                        </li>
                                        <h3>기본 게시판</h3>
                                        <li class="off">
                                            <a class="be_v3 B">
                                                <span class="">공지 사항</span>
                                            </a>
                                        </li>
                                        <li class="off">
                                            <a class="be_v4 B">
                                                <span class="">자유 게시판</span>
                                            </a>
                                        </li>
                                        <li class="off">
                                            <a class="be_v4 B">
                                                <span class="">등업 게시판</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="add_lst  add_lst_btn">
                                    <h3>일반메뉴</h3>
                                    <ul>
                                        <li class="">
                                            <a href="#" class="ge_v1 A">
                                                <span class="mainCategory.A" title="A">앨범형 통합게시판</span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="#" class="ge_v13 B">
                                                <span class="mainCategory.B" title="B">게시글형 통합게시판</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="add_lst last add_lst_btn2">
                                    <h3>관리도구</h3>
                                    <ul>
                                        <li class="">
                                            <a href="#" class="ad_v1">
                                                <span class="filImg">그룹 제목</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <!---->
                            </div>
                            <!-- 더하기 부분 -->
                            <div class="btn_add" id="plusBtn">
                                <a href="#" id="BoardPlusBtn">추가</a>
                                <input type="hidden" id = "mainCategoryNameIn" name="mainCategoryNameIn" value=""><!-- 메인 카테고리 추가 -->
                                <input type="hidden" id = "mainCategoryNameIn2" name="mainCategoryNameIn2" value=""><!-- 메인 카테고리 추가 -->
                                <input type="hidden" id="bordTitleNameIn" name="bordTitleNameIn" value=""><!-- 게시판 추가 -->
                                <input type="hidden" id="bordTitleFormIn" name="bordTitleFormIn" value=""><!-- 게시판 추가 -->
                                <input type="hidden" name="" value=""><!-- 게시판이 추가되는 메인카테고리 -->
                                <input type="hidden" id="boardOrderIn" name="boardOrderIn" value=""><!-- 게시판이 순서-->
                                <input type="hidden" id="boardCodeIn" name="boardCodeIn" value=""><!-- 게시판이 순서-->
                            </div>
                            <div class="edit_set_group">
                                <!-- 게시판 순서 -->
                                <div class="edit_area">
                                    <div class="edit_btn_area">
                                        <ul> 
                                            <li class="bt_v1">
                                                <a href="#" class="none">아래로</a>
                                            </li>
                                            <li class="bt_v2"><a href="#" class="none">위로</a>
                                            </li>
                                            <li class="bt_v3 txt"><a href="#" class="delete">삭제</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="edit_lst_area">
                                        <div class="edit_lst_box">
                                            <div class="add_lst borderNone">
                                                <ul> 
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="전체글보기" class="ba_v2None B"><span data-v-bd0068e8="">전체글보기</span></a></li><!-- DB에서 꺼내오지 않는 고정값 클릭 이벤트 X -->
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="베스트게시글" class="ba_v2None B"><span data-v-bd0068e8="">베스트게시글</span></a></li><!-- DB에서 꺼내오지 않는 고정값 클릭 이벤트 X boardType-->
                                                </ul>
                                                <!-- <ul> -->
                                                    <c:if test="${not empty mainCategory}">
                                                        <c:forEach items="${mainCategory}" var="mainVar" >
                                                            <c:if test="${mainVar.mainCategoryNo == 1}"><ul id="mainCategory.${mainVar.mainCategoryNo}" class="mainCategory" title="${mainVar.mainCategoryName}"></c:if>
                                                            <c:if test="${mainVar.mainCategoryNo > 1}"><ul id="mainCategory.${mainVar.mainCategoryNo}" class="mainCategory mainCategoryOn" title="${mainVar.mainCategoryName}"></c:if>
                                                            <li data-v-bd0068e8="" class="h_menu_tit"><a><span data-v-bd0068e8="" title="그룹 제목" id="${mainVar.mainCategoryName}" class="${mainVar.mainCategoryNo}">■ ${mainVar.mainCategoryName}</span></a></li>
                                                        <c:forEach items="${boardType}" var="var">
                                                            <c:if test="${var.mainCategoryNo eq mainVar.mainCategoryNo}">
                                                                <input type="hidden" id="varboardCode" name="varboardCode" value="${var.boardCode}">
                                                                <input type="hidden" id="varboardName" name="varboardName" value="${var.boardName}">
                                                                <input type="hidden" id="titleTagYN" name="titleTagYN" value="${var.titleTagYN}">
                                                                <input type="hidden" id="boardLikeYN" name="boardLikeYN" value="${var.boardLikeYN}">
                                                                <input type="hidden" id="boardMemberLevelNo" name="boardMemberLevelNo" value="${var.boardMemberLevelNo}">
                                                                <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" class="ge_v1 ${var.boardForm}" id="${var.boardName}" title="${var.boardOrder}" name="${var.boardCode}"><span data-v-bd0068e8="">${var.boardName}</span></a></li>
                                                            </c:if>
                                                        </c:forEach>
                                                        </ul>
                                                        </c:forEach>
                                                    </c:if>
                                                    
                                                    <!-- <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v1"><span data-v-bd0068e8="">공지사항</span></a></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v1"><span data-v-bd0068e8="">자유게시판</span></a></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="간편게시판" class="ge_v13"><span data-v-bd0068e8="">등업게시판</span></a></li>


                                                    <li data-v-bd0068e8="" class="h_menu_tit"><span data-v-bd0068e8="" title="그룹 제목">■ 여행 정보</span></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v1"><span data-v-bd0068e8="">제주 여행지</span></a></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v1"><span data-v-bd0068e8="">충청권 여행지</span></a></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v1"><span data-v-bd0068e8="">강원권 여행지</span></a></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v1"><span data-v-bd0068e8="">전라권 여행지</span></a></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v1"><span data-v-bd0068e8="">경상권 여행지</span></a></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v1"><span data-v-bd0068e8="">서울/수도권 나들이</span></a></li>
                                                    
                                                    <li data-v-bd0068e8="" class="h_menu_tit"><span data-v-bd0068e8="" title="그룹 제목">■ 질문 코너</span></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v1"><span data-v-bd0068e8="">국내 여행 Q/A</span></a></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v1"><span data-v-bd0068e8="">기타 Q/A</span></a></li>

                                                    <li data-v-bd0068e8="" class="h_menu_tit"><span data-v-bd0068e8="" title="그룹 제목">■ 갤러리 자료</span></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v4"><span data-v-bd0068e8="">여행 후기</span></a></li>
                                                    <li data-v-bd0068e8="" class=""><a data-v-bd0068e8="" title="통합게시판" class="ge_v4"><span data-v-bd0068e8="">맛집 사진 공유</span></a></li> -->
                                                    
                                                <!-- </ul> -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ly_loading" style="top: 1px; left: 1px; display: none;">
                                        <div class="loading_area"><img src="https://cafe.pstatic.net/img/manage/img_loading.gif" width="50" height="50" alt="로딩중" class="img_loading">
                                        </div>
                                    </div>
                                    <div class="drag_ly" style="position: absolute; top: -1000px;">
                                        <div class="drag_area"></div>
                                        <div class="drag_area2">
                                            <p class="drag_txt"></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- 에디터 부분 -->
                                <form>
                                
                                <div class="set_area">
                                <div class="set_box set_boxBasic">
                                    <h3 class="set_tit">메뉴 설정 안내</h3>
                                    <ul class="set_lst_type">
                                        <li>드래그 앤 드롭으로 게시판 순서를 변경할 수 있습니다.</li>
                                        <li>단축키(ctrl)를 이용해 여러 개의 게시판을 선택한 후<br>일괄 설정 변경 할 수 있습니다.</li>
                                        <li><span style="color:#2e9901;!important">메뉴를 편집한 후에 저장하기 버튼을 꼭 클릭해야 	변경된<br>내용이 메뉴에 반영됩니다.</span></li>
                                    </ul>
                                </div>
                                <input type="hidden" id="boardCodeUpdate" name="boardCodeUpdate" value="">
                                    <div class="set_box">
                                        <h3 class="set_tit">통합게시판</h3><%-- 통합게시판 --%>
                                        <ul class="set_lst_type">
                                            <li>- 용도에 따라 다양한 형태로 사용 가능한 일반 게시판입니다.</li>
                                            <li>- 공지게시판으로 사용하려면 글쓰기 권한을 스탭 이상으로 설정하세요.</li>
                                        </ul>
                                        <div class="detail_area">
                                            <table border="1" cellspacing="0" width="100%" summary="메뉴관리 설정">
                                                <caption style="display: none;">메뉴관리 설정 정보</caption>
                                                <colgroup><col width="130"><col width="*"></colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th>메뉴명</th>
                                                        <td>
                                                            <input type="text" class="ipt_type" id="settingboardName"><!---->
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row" colspan="2" class="line"></th>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">권한 설정</th>
                                                        <td class="">
                                                            <div class="type_box">
                                                                <p class="">
                                                                    <strong> 모든 </strong>
                                                                    <select id="LevelNo" name="LevelNo" style="width: 145px;">
                                                                        <option value="2">새내기</option>
                                                                        <option value="3">일반여행자</option>
                                                                        <option value="4">성실여행자</option>
                                                                        <option value="5">우수여행자</option>
                                                                        <option value="150">감사멤버</option>
                                                                    </select>
                                                                    이상<!----></p>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <th scope="row" colspan="2" class="line"></th>
                                                    </tr><!----><!---->
                                                    <tr>
                                                        <th scope="row" class="solo">좋아요 기능</th>
                                                        <td class="solo"><input id="in_type6" type="checkbox" class="check"><label for="in_type6">사용</label></td>
                                                    </tr>
                                                
                                                    <tr>
                                                        <th scope="row" colspan="2" class="line"></th>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row" class="solo">말머리</th>
                                                        <td class="solo"><input id="in_type7" type="checkbox" class="check"><label for="in_type7">사용</label><!----></td>
                                                    </tr><!----><!---->
                                                    <tr>
                                                        <th scope="row" colspan="2" class="line"></th>
                                                    </tr>
                                                </tbody>
                                            </table><!---->
                                        </div>
                                    </div>
                                    <div class="ly_loading" style="height: 624px; display: none;">
                                        <div class="loading_area">
                                        <img src="https://cafe.pstatic.net/img/manage/img_loading.gif" width="50" height="50" alt="로딩중" class="img_loading">
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                        <!--  -->
                    </div>
                    <div class="edit_btn_box">
                        <a href="#" class="btn_type_edt2">
                            <strong>취소</strong>
                        </a>
                        <a href="#" class="btn_type_edt">
                            <strong>저장하기</strong>
                        </a>
                    </div>

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
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <script src="/resources/js/managerMain/menuManager.js"></script>
</body>
</html>