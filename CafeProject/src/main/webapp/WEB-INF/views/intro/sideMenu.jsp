<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SideMenu</title>
</head>
<body>
    <!-- **************************************카페 카페정보/나의활동 상단************************************** -->
        <section id="sideMenu">
            <div id="content">
                <ul id="ul-1">
                    <li>
                        <a href="#"><img src="/resources/images/즐찾.PNG" width="26px" height="26px"></a>
                    </li>
                    <li><a href="#" id="btn1">
                            <p>카페정보</p>
                        </a></li>
                    <li><a href="#" id="btn2">
                            <p>나의활동</p>
                        </a></li>
                </ul>

                <c:choose>
                <c:when test="${empty sessionScope.loginMember}">
                
                <div>
                    <span>
                        <div id="cafe">
                            <ul>
                                <li id="logo"><a href="#"><img src="/resources/images/고양아.jpg" width="58px"
                                            height="58px" /></a></li>
                                <li id="name">
                                    <div id="inline">
                                        <div id="manager">매니저</div>
                                        <div><a href="#">카페팀</a></div>
                                    </div>
                                    <div id="since">since 2022.10.18.</div>
                                </li>
                            </ul>
                            <c:choose>
                            <c:when test="${sessionScope.loginMember.authorityNo==0 ||sessionScope.loginMember.authorityNo==1 }">
                            <div class="managerLink">
                                <div class="managerLinkBox">
                                    <a href="/manager/managerMain.jsp"><img src="/resources/images/settings.png" width="10px" height="10px" />카페관리</a>
                                </div>
                            </div>
                            </c:when>
                            </c:choose>
                        </div>

                        <div id="cafe-member">
                            <div id="cafe-grade">
                                <img src="/resources/images/카페등급.PNG" width="17px">
                                <a><a href="#">나무3단계
                            </div>

                            <div id="member-count">
                                <img src="/resources/images/회원수.PNG" height="16px">
                                <a href="#" id="count">657,879</a>
                                <a href="#" id="count1">초대하기</a>
                            </div>
                        </div>

                        <div id="count-3">
                            <div id="star">
                                <div id="star-img"><img src="/resources/images/즐찾한 멤버.PNG" width="15px" height="14px"></div>
                                <div id="star1">즐겨찾는 멤버</div>
                                <div id="star-count">76,289명</div>
                            </div>
                        </div>

                        <div id="cafe-type">
                            <div>팀프로젝트</div>
                            <div>주제 > 카페</div>
                        </div>
                    </span>
                </div>
                </c:when>
                </c:choose>
                



                <c:choose>
                <c:when test="${!empty sessionScope.loginMember}">
                    
    
                    <div  class="basicCafe-info cafe-info" id="cafe-info"><%-- tyrtyrtyrttyyyytttttttttttttttttttttttttttttttttttttttttttttttttttt --%>
                        <span>
                            <div id="cafe">
                                <ul>
                                    <li id="logo"><a href="#"><img src="/resources/images/고양아.jpg" width="58px"
                                                height="58px" /></a></li>
                                    <li id="name">
                                        <div id="inline">
                                            <div id="manager">매니저</div>
                                            <div><a href="#">카페팀</a></div>
                                        </div>
                                        <div id="since">since 2022.10.18.</div>
                                    </li>
                                </ul>
                                <c:choose>
                                <c:when test="${sessionScope.loginMember.authorityNo==0 ||sessionScope.loginMember.authorityNo==1 }">
                                <div class="managerLink">
                                    <div class="managerLinkBox">
                                        <a href="/manager/managerMain"><img src="/resources/images/settings.png" width="10px" height="10px" />카페관리</a>
                                    </div>
                                </div>
                                </c:when>
                                </c:choose>
                            </div>
            
                            <div id="cafe-member">
                                <div id="cafe-grade">
                                    <img src="/resources/images/카페등급.PNG" width="17px">
                                    <a><a href="#">나무3단계
                                </div>
            
                                <div id="member-count">
                                    <img src="/resources/images/회원수.PNG" height="16px">
                                    <a href="#" id="count">657,879</a>
                                    <a href="#" id="count1">초대하기</a>
                                </div>
                            </div>
            
                            <div id="count-3">
                                <div id="star">
                                    <div id="star-img"><img src="/resources/images/즐찾한 멤버.PNG" width="15px" height="14px"></div>
                                    <div id="star1">즐겨찾는 멤버</div>
                                    <div id="star-count">76,289명</div>
                                </div>
                            </div>
            
                            <div id="cafe-type">
                                <div>팀프로젝트</div>
                                <div>주제 > 카페</div>
                            </div>
                        </span>
                    </div>
                    
                <!------------------------- 나의활동 ------------------------->
                
                <div class="basicMy-active my-active" id="my-active">
                    <span>
                        <div id="side-profile-main">
                            <div id="side-profile1">
                                <ul>
                                    <li>
                                        <div id="side-profile">
                                            <a href="/member/myPage/profile"><img src="/resources/images/settings.png"
                                                    id="setting-icon"></a>
                                            <div id="profile-box"><img src="/resources/images/고양아.jpg"
                                                    id="profile-img"></div>
                                        </div>
                                        <div id="profile-name">
                                            <a href="/member/myPage/info" id="memberNickname">${loginMember.memberNickname}</a>
                                        </div>
                                    </li>

                                    <li id="signUp-date">가입일 <em>${loginMember.enrollDate}</em></li>
                                    <li id="profile-grade">${loginMember.memberLevelName} <img id="levelImage" src="${loginMember.memberLevelImage}" alt="memberLevelImage">
                                    <a href="/cafe/memberLevel" onclick="window.open(this.href, '_blank', 'width=800, height=500 top=300, left=600'); return false;">멤버등급 안내</a></li>

                                </ul>
                            </div> 
                            <div id="side-profile2">
                                <ul>
                                    <li>
                                        <span id="info-data"><img src="/resources/images/게시판.PNG">방문</span>
                                        <em>${loginMember.logHistoryCount}<span>회</span></em>
                                    </li>
                                    <li>
                                        <span id="info-data"><img src="/resources/images/게시판.PNG">내가 쓴 글
                                            보기</span>
                                        <em>${loginMember.memberBoardCount}<span>개</span></em>
                                    </li>
                                    <li>
                                        <span id="info-data"><img src="/resources/images/게시판.PNG">내가 쓴
                                            댓글보기</span>
                                        <em>${loginMember.memberCommentCount}<span>개</span></em>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </span>
                </div>
                </c:when>
                

                </c:choose>
                <!------------------------- 나의활동 ------------------------->


            </div>

            <c:choose>
            <c:when test="${empty sessionScope.loginMember}">
                <div id="signUpbtn">
                    <a href="/member/login" id="signUp">로그인</a>
                </div>
            </c:when>
            <c:otherwise>
                <div id="signOutbtn">
                    <a href="/member/logout" id="signOut">로그아웃</a>
                </div>
            </c:otherwise>
            </c:choose>

            <!-- **************************************카페 카페정보/나의활동 상단************************************** -->
            <div id="search">
                <form action="#" method="get">
                    <input type="text" id="inputsearch">
                    <button id="searchbtn">검색</button>
                </form>
            </div>

            <!-- **************************************카페 사이드 메뉴************************************** -->
            <div id="board">


                <div id="cafe-menu">
                    <ul id="cafe-menu-top">
                        <li id="total-post"><img src="/resources/images/게시판.PNG" id="border-img"><a href="#">전체글보기</a>
                        </li>
                        <li id="best-post"><img src="/resources/images/게시판.PNG" id="border-img"><a href="#">베스트게시글</a>
                        </li>
                    </ul>
                </div>
                <!-- <div id="calender">
                    <ul>
                        <li><img src="../resources/images/캘린더.PNG" id="border-img"><a href="#">캘린더</a></li>
                    </ul>
                </div> -->

                <section id="board-basic">
                    <div name="board-title">■ 기본 게시판</div>
                </section>


                <div id="cafe-menu">
                    <ul id="cafe-menu-basic">
                        <li id="notice"><img src="/resources/images/게시판.PNG" id="border-img"><a href="#">공지사항</a>
                        </li>
                        <li id="board-any"><img src="/resources/images/게시판.PNG" id="border-img"><a href="#">자유게시판</a>
                        </li>
                        <li id="board-gradeup"><img src="/resources/images/게시판.PNG" id="border-img"><a href="#">등업게시판</a>
                        </li>
                    </ul>
                </div>

                <section id="board-basic">

                    <div name="board-title">■ 여행 정보</div>

                    <div>
                        <ul id="board-menu">
                            <li class="board">
                                <img src="/resources/images/게시판.PNG" id="border-img">
                                <a href="#">제주 여행지</a>
                            </li>
                            <li class="board">
                                <img src="/resources/images/게시판.PNG" id="border-img">
                                <a href="#">충청권 여행지</a>
                            </li>
                            <li class="board">
                                <img src="/resources/images/게시판.PNG" id="border-img">
                                <a href="#">강원권 여행지</a>
                            </li>
                            <li class="board">
                                <img src="/resources/images/게시판.PNG" id="border-img">
                                <a href="#">전라권 여행지</a>
                            </li>
                            <li class="board">
                                <img src="/resources/images/게시판.PNG" id="border-img">
                                <a href="#">경상권 여행지</a>
                            </li>
                            <li class="board">
                                <img src="/resources/images/게시판.PNG" id="border-img">
                                <a href="#">서울/수도권 나들이</a>
                            </li>
                        </ul>
                    </div>
                </section>

                <section id="board-basic">
                    <div name="board-title">■ 질문 코너</div>

                    <ul id="board-menu">
                        <li class="board">
                            <img src="/resources/images/게시판.PNG" id="border-img">
                            <a href="#">국내 여행 Q/A</a>
                        </li>
                        <li class="board">
                            <img src="/resources/images/게시판.PNG" id="border-img">
                            <a href="#">기타 Q/A</a>
                        </li>
                    </ul>
                </section>

                <section id="board-basic">
                    <div name="board-title">■ 갤러리 자료</div>
                    <ul id="board-menu">
                        <li class="board">
                            <img src="/resources/images/앨범.PNG" id="border-img">
                            <a href="#">여행 후기</a>
                        </li>
                        <li class="board">
                            <img src="/resources/images/앨범.PNG" id="border-img">
                            <a href="#">맛집 사진 공유</a>
                        </li>
                    </ul>
                </section>

            </div>


            <!-- **************************************카페 사이드 메뉴*************************************** -->

            <!-- **************************************카페 사이드 랭킹 쪽************************************** -->
            <div id="invite">
                <div>
                    <div id="invite_today">
                        <span>오늘</span>
                        <div>3</div>
                    </div>
                    <div id="invite_total">
                        <span>전체</span>
                        <div>40</div>
                    </div>
                </div>
            </div>

            <div id="ranking">
                <div id="ranking_title">
                    지난주 멤버 랭킹
                </div>

                <div id="ranking_category">
                    <ul>
                        <li><a href="#">댓글</a></li>
                        <div id="ranking_line"></div>
                        <li><a href="#">게시글</a></li>
                        <div id="ranking_line"></div>
                        <li><a href="#">방문</a></li>
                    </ul>
                </div>

                <div id="member_ranking">
                    <ul>
                        <li id="ranking-member">
                            <span>1.</span>
                            <div>
                                <span id="member_id"><a href="#">김서희</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <span>2.</span>
                            <div>
                                <span id="member_id"><a href="#">김지윤</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <span>3.</span>
                            <div>
                                <span id="member_id"><a href="#">강민규</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <span>4.</span>
                            <div>
                                <span id="member_id"><a href="#">한지훈</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <span>5.</span>
                            <div>
                                <span id="member_id"><a href="#">정지윤</a></span>
                            </div>
                        </li>
                    </ul>

                </div>
            </div>


            <div id="ranking">
                <div id="ranking_title">
                    지난주 게시글 랭킹
                </div>

                <div id="ranking_category">
                    <ul>
                        <li><a href="#">좋아요 횟수</a></li>
                        <div id="ranking_line"></div>
                        <li><a href="#">댓글수</a></li>
                    </ul>
                </div>

                <div id="member_ranking">
                    <ul>
                        <li id="ranking-member">
                            <span>1.</span>
                            <div>
                                <span id="member_id"><a href="#">이빨다뽑힘</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <span>2.</span>
                            <div>
                                <span id="member_id"><a href="#">JH</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <span>3.</span>
                            <div>
                                <span id="member_id"><a href="#">상남자</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <span>4.</span>
                            <div>
                                <span id="member_id"><a href="#">김지윤1010</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <span>5.</span>
                            <div>
                                <span id="member_id"><a href="#">김서희</a></span>
                            </div>
                        </li>
                    </ul>

                </div>
            </div>



            <div id="ranking">
                <div id="ranking_title">
                    멤버 소식
                </div>

                <div id="ranking_category">
                    <ul>
                        <li><a href="#">방문</a></li>
                        <div id="ranking_line"></div>
                        <li><a href="#">신입</a></li>
                    </ul>
                </div>

                <div id="member_ranking">
                    <ul>
                        <li id="ranking-member">
                            <div>
                                <span id="member_id"><a href="#">나왔다</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <div>
                                <span id="member_id"><a href="#">6시32분</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <div>
                                <span id="member_id"><a href="#">집가세요</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <div>
                                <span id="member_id"><a href="#">휴무입니다</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <div>
                                <span id="member_id"><a href="#">공휴일입니다</a></span>
                            </div>
                        </li>
                    </ul>

                </div>
            </div>

            <div id="ranking">
                <div id="ranking_title">
                    최근 댓글 / 답글
                </div>

                <div id="ranking_category">
                    <ul>
                        <li><a href="#">방문</a></li>
                        <div id="ranking_line"></div>
                        <li><a href="#">신입</a></li>
                    </ul>
                </div>

                <div id="member_ranking">
                    <ul>
                        <li id="ranking-member">
                            <div>
                                <span id="member_id">ㆍ<a href="#">하하</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <div>
                                <span id="member_id">ㆍ<a href="#">호호</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <div>
                                <span id="member_id">ㆍ<a href="#">히히</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <div>
                                <span id="member_id">ㆍ<a href="#">후후</a></span>
                            </div>
                        </li>
                        <li id="ranking-member">
                            <div>
                                <span id="member_id">ㆍ<a href="#">쿠쿸</a></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- **************************************카페 사이드 랭킹 쪽************************************** -->

            <c:if test="${!empty sessionScope.loginMember}">
                <section id="delete">
                    <p><a href="/member/myPage/secession">카페탈퇴하기</a></p>
                </section>
            </c:if>


        </section>
</body>
</html>

