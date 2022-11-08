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
    <title>바이트레인</title>
    <link rel="shortcut icon" href="../resources/images/free-icon-train.png" type="image/x-icon">
    <a href="https://www.flaticon.com/kr/free-icons/" title="기차 아이콘" id="free-icon-train">기차 아이콘 제작자: Shahid-Mehmood -
        Flaticon</a>
    <link rel="stylesheet" href="../resources/css/main.css">
    <style>
        #free-icon-train {
            display: none;
            opacity: 0;
            visibility: hidden;
        }
    </style>

</head>

<body>

    <main>
        <!-- **************************************헤더************************************** -->
        <header>
            <!-- 헤더 왼쪽 상단 로고 -->
            <div id="header-top">
                <div id="never-gnb" class="__web-inspector-hide-shortcut__">
                    <a href="http://www.naver.com" class="link_never">
                        <img src="https://ssl.pstatic.net/static/cafe/icon_naver_190423.png" width="52" height="10"
                            alt="NAVER">
                    </a>
                </div>
                <div id="header-top-menu">
                    <a href="/"> 카페홈 </a>
                    <span>|</span>
                    <a href="#"> 강민규 </a>
                </div>
            </div>
            <!-- 헤더 오른쪽 상단 메뉴 -->

            <section id="pic">

                <img src="../resources/images/mainIMG.png">
                <section class="cafe_project_size">
                    <div class="cafe_project">
                        <div id="cafe_project_name">Train_Koraila</div>
                        <div id="cafe_project_names">Team_project Cafe</idv>
                        </div>
                </section>

            </section>

        </header>
        <!-- **************************************헤더************************************** -->

        <!-- **************************************네비************************************** -->
        <nav>
            <ul class="special-menu">
                <li id="special-menu-0"><a class="link_special" href="#">전체글보기</a></li>
                <li id="special-menu-1"><a class="link_special" href="#">📣 카페 이용..</a></li>
                <li id="special-menu-2"><a class="link_special" href="#">👩 생활 이야..</a></li>
            </ul>
        </nav>

        <!-- **************************************네비************************************** -->


        <!-- **************************************카페 사이드!!!!!!!!!!!!!!!!!!!!!!!!************************************** -->

        <!-- **************************************카페 카페정보/나의활동 상단************************************** -->
        <section id="sideMenu">
            <div id="content">

                <ul id="ul-1">
                    <li>
                        <a href="#"><img src="../resources/images/즐찾.PNG" width="26px" height="26px"></a>
                    </li>
                    <li><a href="#">
                            <p>카페정보</p>
                        </a></li>
                    <li><a href="#">
                            <p>나의활동</p>
                        </a></li>
                </ul>

                <div id="cafe">
                    <ul>
                        <li id="logo"><a href="#"><img src="../resources/images/고양아.jpg" width="58px"
                                    height="58px" /></a></li>
                        <li id="name">
                            <div id="inline">
                                <div id="manager">매니저</div>
                                <div><a href="#">카페팀</a></div>
                            </div>
                            <div id="since">since 2022.10.18.</div>
                        </li>
                    </ul>
                </div>

                <div id="cafe-member">
                    <div id="cafe-grade">
                        <img src="../resources/images/카페등급.PNG" width="17px">
                        <a><a href="#">나무3단계
                    </div>

                    <div id="member-count">
                        <img src="../resources/images/회원수.PNG" height="16px">
                        <a href="#" id="count">657,879</a>
                        <a href="#" id="count1">초대하기</a>
                    </div>
                </div>

                <div id="count-3">
                    <div id="star">
                        <div id="star-img"><img src="../resources/images/즐찾한 멤버.PNG" width="15px" height="14px"></div>
                        <div id="star1">즐겨찾는 멤버</div>
                        <div id="star-count">76,289명</div>
                    </div>
                </div>

                <div id="cafe-type">
                    <div>팀프로젝트</div>
                    <div>주제 > 카페</div>
                </div>


                <!------------------------- 나의활동 ------------------------->
                <!-- <div id="side-profile-main">
                    <div id="side-profile1">
                        <ul>
                            <li>
                                <div id="side-profile">
                                    <a href="#"><img src="/src/main/webapp/resources/images/프로필 변경.PNG"
                                            id="setting-icon"></a>
                                    <div id="profile-box"><img src="/src/main/webapp/resources/images/프로필.PNG"
                                            id="profile-img"></div>
                                </div>
                                <div id="profile-name">
                                    이빨다뽑힘
                                </div>
                            </li>
                            <li id="signUp-date">가입 <em>2022.10.17.</em></li>
                            <li id="profile-grade">감사멤버 <a href="">멤버등급 안내</a></li>
                        </ul>
                    </div>
                    <div id="side-profile2">
                        <ul>
                            <li>
                                <span id="info-data"><img src="/src/main/webapp/resources/images/방문일.PNG">방문</span>
                                <em>14<span>회</span></em>
                            </li>
                            <li>
                                <span id="info-data"><img src="/src/main/webapp/resources/images/작성한 게시글 수.PNG">내가 쓴 글
                                    보기</span>
                                <em>0<span>개</span></em>
                            </li>
                            <li>
                                <span id="info-data"><img src="/src/main/webapp/resources/images/작성한 댓글 수.PNG">내가 쓴
                                    댓글보기</span>
                                <em>0<span>개</span></em>
                            </li>
                        </ul>
                    </div>
                </div> -->
                <!------------------------- 나의활동 ------------------------->


            </div>


            <div id="signUpbtn">
                <a href="#" id="signUp">로그인</a>
            </div>


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
                        <li id="total-post"><img src="../resources/images/게시판.PNG" id="border-img"><a href="#">전체글보기</a>
                        </li>
                        <li id="best-post"><img src="../resources/images/게시판.PNG" id="border-img"><a href="#">베스트게시글</a>
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
                        <li id="notice"><img src="../resources/images/게시판.PNG" id="border-img"><a href="#">공지사항</a></li>
                        <li id="board-any"><img src="../resources/images/게시판.PNG" id="border-img"><a href="#">자유게시판</a>
                        </li>
                        <li id="board-gradeup"><img src="../resources/images/게시판.PNG" id="border-img"><a
                                href="#">등업게시판</a></li>
                    </ul>
                </div>

                <section id="board-basic">

                    <div name="board-title">■ 여행 정보</div>

                    <div>
                        <ul id="board-menu">
                            <li class="board">
                                <img src="../resources/images/게시판.PNG" id="border-img">
                                <a href="#">제주 여행지</a>
                            </li>
                            <li class="board">
                                <img src="../resources/images/게시판.PNG" id="border-img">
                                <a href="#">충청권 여행지</a>
                            </li>
                            <li class="board">
                                <img src="../resources/images/게시판.PNG" id="border-img">
                                <a href="#">강원권 여행지</a>
                            </li>
                            <li class="board">
                                <img src="../resources/images/게시판.PNG" id="border-img">
                                <a href="#">전라권 여행지</a>
                            </li>
                            <li class="board">
                                <img src="../resources/images/게시판.PNG" id="border-img">
                                <a href="#">경상권 여행지</a>
                            </li>
                            <li class="board">
                                <img src="../resources/images/게시판.PNG" id="border-img">
                                <a href="#">서울/수도권 나들이</a>
                            </li>
                        </ul>
                    </div>
                </section>

                <section id="board-basic">
                    <div name="board-title">■ 질문 코너</div>

                    <ul id="board-menu">
                        <li class="board">
                            <img src="../resources/images/게시판.PNG" id="border-img">
                            <a href="#">국내 여행 Q/A</a>
                        </li>
                        <li class="board">
                            <img src="../resources/images/게시판.PNG" id="border-img">
                            <a href="#">기타 Q/A</a>
                        </li>
                    </ul>
                </section>

                <section id="board-basic">
                    <div name="board-title">■ 갤러리 자료</div>
                    <ul id="board-menu">
                        <li class="board">
                            <img src="../resources/images/앨범.PNG" id="border-img">
                            <a href="#">여행 후기</a>
                        </li>
                        <li class="board">
                            <img src="../resources/images/앨범.PNG" id="border-img">
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

            <section id="delete">
                <p><a href="#">카페탈퇴하기</a></p>
            </section>


        </section>

        <!-- **************************************카페 사이드!!!!!!!!!!!!!!!!!!!!!!!!************************************** -->


    </main>

    <!-- **************************************푸터************************************** -->
    <footer class="footer">

        <h2 class="cafe_name">내일로,기차여행 커뮤니티 - 바이트레인 (게스트하우스, 게하)</h2>
        <span class="cafe_nbsp">|</span>
        <a href="#" class="cafe_link">https://cafe.never.com/hkct
        </a>
        <h2>
            <a href="#" class="never_cafe">
                <span class="blind">NEVER 카페</span>
            </a>
        </h2>

    </footer>

    <!-- **************************************푸터************************************** -->
</body>

</html>