<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta property="og:title" content="내일로 기차 여행 카페">
    <meta property="og:description" content="내일로 여행 가고 싶은 사람들 모여라!"> -->
    <title>내일로, 기차로! 카페 관리자 메인화면</title>
    <link rel="stylesheet" href="/resources/css/managerMain/managerMain.css">
    

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
                            <li>
                                <a href=""><img src="/resources/images/free-icon-spam-alert-5628585.png">삭제글</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>

         <!-- ************************************* managerHeader ************************************************** -->

        <!-- 관리자 홈페이지 메인 관리 홈 -->
        <section id="container">
            <div id="content">
                <div class="cafe_info_area">
                    <div class="cafe_thumb_wrap">
						<div class="cafe_thumb_img">
                            <c:if test="${empty mainCafeInfo.profileImg}">    
                                <img id="profile-image" src="\resources\images\프로필.PNG">
                            </c:if> 

                            <c:if test="${not empty mainCafeInfo.profileImg}">    
                                <img id="profile-image" src="${mainCafeInfo.profileImg}">
                            </c:if> 
						</div>
					</div>

                    <div class="cafe_info_cont">
						<h3>
                            <a href="/manager/managerMain">내일로, 기차로! 카페</a>
                        </h3>
						
						<ul class="info_lst">
                            <li>
                                <span class="ico_mem">
                                    <img src="/resources/images/free-icon-multiple-users-silhouette-33308.png" alt="멤버수" class="blind">
                                </span>
                                <em class="thm">${memberCount}</em>
                            </li>
                            <li>
                                <span class="ico_cnt">
                                    <img src="/resources/images/free-icon-chat-5465360.png" alt="게시글수" class="blind">
                                </span>
                                <em class="thm">${boardCount}</em>
                            </li>
						</ul>

						<ul class="info_lst2">
                            <li>
                                <strong>카페성격</strong>
                                <p>|</p>
                                <span>공개카페</span>
                            </li>
                            <li>
                                <strong>멤버관리</strong>
                                <p>|</p>
                                <span>닉네임사용</span>
                            </li>
						</ul>
					</div>

                </div>


                <div class="content_bx">
                    <div class="content_bx1">
                        <div class="menu_lst_area">
                            <strong class="tit">카페 운영</strong>
                            <ul>
                                <li class="_manageAuth">
                                    <a id="menu1" href="/manager/basicInfoManager" class="N=a:LNB*a.list">기본 정보</a>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_lst_area">
                            <strong class="tit2">가입 · 등급</strong>
                            <ul>
                                <li class="_manageAuth(WelcomeStaff)">
                                    <a id="menu2" href="/manager/joinMemberManager" class="N=a:LNB*a.list">가입 정보 관리</a>
                                </li>
                                <li class="_manageAuth(MemberStaff)">
                                    <a id="menu3" href="/manager/gradeMemberManager" class="N=a:LNB*a.list">멤버 등급 관리</a>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_lst_area">
                            <strong class="tit3">멤버 · 스탭</strong>
                            <ul>
                                <li class="_manageAuth(MemberStaff)">
                                    <a id="menu4" href="/manager/totalMemberManager" class="N=a:LNB*a.list">전체 멤버 관리</a>
                                </li>
                                <li class="_manageAuth(BoardStaff|OptionalBoardStaff)">
                                    <a id="menu5" href="/manager/ActivityStopMemberManager" class="N=a:LNB*a.list">활동정지 멤버 관리</a>
                                </li>
                                <li class="_manageAuth(MemberStaff)">
                                    <a id="menu6" href="/manager/ForcedSecessionMemberManager" class="N=a:LNB*a.list">강제탈퇴 멤버 관리</a>
                                </li>
                                <li class="_manageAuth(OptionalBoardStaff)">
                                    <a id="menu7" href="/manager/ManageCafeStaffView" class="N=a:LNB*a.list">스탭 관리</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="content_bx2">
                        <div class="menu_lst_area">
                            <strong class="tit4">메뉴</strong>
                            <ul class="lst">
                                <li class="_manageAuth(BoardStaff)">
                                    <a id="menu8" href="/manager/menuManager" class="N=a:LNB*a.list">메뉴 관리</a>
                                </li>
                            </ul>
                        </div>
                        
                        <!-- <div class="menu_lst_area">
                            <strong class="tit5">글 · 글양식</strong>
                            <ul>
                                <li class="_manageAuth(BoardStaff)">
                                    <a id="menu9" href="" class="N=a:LNB*a.list">글양식</a>
                                </li>
                            </ul>
                        </div> -->

                        <div class="menu_lst_area">
                            <strong class="tit6">삭제글</strong>
                            <ul>
                                <li class="_manageAuth(BoardStaff)">
                                    <a id="menu10" href="" class="N=a:LNB*a.list">삭제 글/댓글 보기</a>
                                </li>  
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
            
        </section>    
        <!-- 관리자 홈페이지 메인 관리 홈 -->
    </main>
    <footer>
        <p class="cr">
            <em>Since 2022.10.14. © </em> 
            <span> 내일로, 기차로! 카페</span>
        </p>
    </footer>
</body>
</html>