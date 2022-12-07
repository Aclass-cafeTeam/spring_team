<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SideMenu</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
    <!-- **************************************카페 카페정보/나의활동 상단************************************** -->
        <section id="sideMenu">
            <div id="content">

                <ul id="ul-1">
                    <li><a href="#" id="btn1" onclick="return false;">
                            <p>카페정보</p>
                        </a></li>
                    <li><a href="#" id="btn2" onclick="return false;">
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
                                                height="58px"/></a></li>
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
                                    <img src="/resources/images/intro/kh-logo.jpg" width="17px">
                                    <a><a href="#">KH정보교육원
                                </div>

                                <div id="member-count">
                                    <img src="/resources/images/회원수.PNG" height="16px">
                                    <a href="#" id="count">${memberCount}</a>
                                    <%-- <a href="#" id="count1">초대하기</a> --%>
                                </div>
                            </div>

                            <div id="count-3">
                                <div id="star">
                                    <div id="star-img"><img src="/resources/images/즐찾한 멤버.PNG" width="15px" height="14px"></div>
                                    <div id="star1">프로젝트 팀원</div>
                                    <div id="star-count">5명</div>
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
                    <div  class="basicCafe-info cafe-info" id="cafe-info">
                        <span>
                            <div id="cafe">
                                <ul>
                                    <li id="logo"><a href="#"><img src="/resources/images/고양아.jpg" width="58px"
                                                height="58px" /></a></li>
                                    <li id="name">
                                        <div id="inline">
                                            <div id="manager">매니저</div>
                                            <div><a href="#" onclick="return=false;">카페팀</a></div>
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
                                    <a href="#" id="count">${memberCount}</a>
                                    <%-- <a href="#" id="count1">초대하기</a> --%>
                                </div>
                            </div>
            
                            <div id="count-3">
                                <div id="star">
                                    <div id="star-img"><img src="/resources/images/즐찾한 멤버.PNG" width="15px" height="14px"></div>
                                    <div id="star1">알맹이</div>
                                    <div id="star-count">동글동글</div>
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
                                            <a href="/member/myPage/profile"><img src="/resources/images/프로필 변경.PNG"
                                                    id="setting-icon"></a>
                                            <div id="profile-box">
                                                <c:if test="${empty loginMember.profileImage}">    
                                                    <img id="profile-img" src="/resources/images/main/프로필.PNG">
                                                </c:if> 

                                                <c:if test="${not empty loginMember.profileImage}">    
                                                    <img id="profile-img" src="${loginMember.profileImage}">
                                                </c:if>
                                            </div>
                                        </div>
                                        <div id="profile-name">
                                            <a href="/member/myPage/info" id="memberNickname">${loginMember.memberNickname}</a>
                                        </div>
                                    </li>

                                    <li id="signUp-date">가입 <em>${loginMember.enrollDate}</em></li>

                                    <li id="profile-grade">
                                    <c:choose>
                                        <c:when test="${(loginMember.authorityNo eq 0) or (loginMember.authorityNo eq 1)}">
                                        ${loginMember.authorityName}   <img id="levelImage" src="${loginMember.authorityImage}" alt="authorityImage" > 
                                        </c:when>
                                        <c:otherwise>
                                        ${loginMember.memberLevelName} <img id="levelImage" src="${loginMember.memberLevelImage}" alt="memberLevelImage">
                                        </c:otherwise>
                                    </c:choose>
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
                                        <span id="info-data"><img src="/resources/images/게시판.PNG"><a href="/member/myPage/myBoard">내가 쓴 글
                                            보기</a></span>
                                        <em>${loginMember.memberBoardCount}<span>개</span></em>
                                    </li>
                                    <li>
                                        <span id="info-data"><img src="/resources/images/게시판.PNG"><a href="/member/myPage/myCommentBoard">내가 댓글 단 글 보기</a></span>
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
                <div id="signOutbtn">
                    <a href="/board/write" id="signOut">카페 글쓰기</a>
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
                        <li id="total-post"><img src="/resources/images/게시판.PNG" id="border-img"><a href="/board/selectAll">전체글보기</a>
                        </li>
                        <li id="best-post"><img src="/resources/images/게시판.PNG" id="border-img"><a href="/board/bestBoard">베스트게시글</a>
                        </li>
                    </ul>
                </div>
                
                <%-- <section id="board-basic">
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
                </section> --%>

                <%-------------------------------------------------- 로그인 안했을때 보여지는 게시판 --------------------------------------------------%>
                <c:choose>
                    <c:when test="${empty sessionScope.loginMember}">
                        <c:forEach var="category" items="${mainList}">
                            <section id="board-basic">
                            <div name="board-title">■ ${category.MAIN_CATEGORY_NAME}</div>
                                <ul id="board-menu">
                                    <c:forEach var="board" items="${boardTypeList}">
                                        <c:choose>
                                            <c:when test="${category.MAIN_CATEGORY_NO eq board.MAIN_CATEGORY_NO}" >
                                                    <li class="board">
                                                    <img src="/resources/images/게시판.PNG" id="border-img">
                                                    <a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">${board.BOARD_NAME}</a>
                                                    </li>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </section>
                        </c:forEach>
                    </c:when>        
                </c:choose>
                <%-------------------------------------------------- 로그인 했을때 보여지는 게시판 --------------------------------------------------%>
                <c:choose>
                    <c:when test="${!empty sessionScope.loginMember}">
                        <c:forEach var="category" items="${mainList}">
                            <section id="board-basic">
                            <div name="board-title">■ ${category.MAIN_CATEGORY_NAME}</div>
                                <ul id="board-menu">
                                    <c:forEach var="board" items="${boardTypeList}">
                                        <c:choose>
                                            <c:when test="${category.MAIN_CATEGORY_NO eq board.MAIN_CATEGORY_NO}" >
                                                    <li class="board">
                                                    <img src="/resources/images/게시판.PNG" id="border-img">
                                                    <a href="/board/${board.BOARD_CODE}">${board.BOARD_NAME}</a>
                                                    </li>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </section>
                        </c:forEach>
                    </c:when>        
                </c:choose>
            </div>

            <!-- **************************************카페 사이드 메뉴*************************************** -->

            <!-- **************************************카페 사이드 랭킹 쪽************************************** -->

            <%-------------------------------------------------- 로그인 안했을때 보여지는 랭킹 --------------------------------------------------%>
                <div id="invite">
                    <div>
                        <div id="invite_today">
                            <span>오늘</span>
                            <div>${todayVisitCount}</div>
                        </div>
                        <div id="invite_total">
                            <span>전체</span>
                            <div>${allVisitCount}</div>
                        </div>
                    </div>
                </div>
            <c:choose>
            <c:when test="${empty sessionScope.loginMember}">
                <div id="ranking">
                    <div id="ranking_title">
                        지난주 멤버 랭킹
                    </div>
                    <div class="ranking_category">
                        <ul>
                            <li><a href="#" onclick="return false;" id="member_comment" style="color: red; cursor: text; text-decoration: none;">댓글</a></li>
                            <div id="ranking_line"></div>
                            <li><a href="#" onclick="return false;" id="member_board">게시글</a></li>
                            <div id="ranking_line"></div>
                            <li><a href="#" onclick="return false;" id="member_visit">방문</a></li>
                        </ul>
                    </div>

                    <%---------------------------------------- 지난주 댓글 랭킹 ----------------------------------------%>
                    <div class="member_ranking" id="memberCommentRank">
                        <c:choose>
                            <c:when test="${empty commentRank.commentRankList}">
                                <div>랭킹이없어요</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="commentRank" items="${commentRank.commentRankList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>${status.count}.</span>
                                                <div>
                                                    <span id="member_id"><a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">${commentRank.memberNickname}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <%---------------------------------------- 지난주 게시글 랭킹 ----------------------------------------%>
                    <div class="member_ranking" id="memberBoardRank">
                        <c:choose>
                            <c:when test="${empty boardRank.boardRankList}">
                                <div>랭킹업슴</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="boardRank" items="${boardRank.boardRankList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>${status.count}. </span>
                                                <div>
                                                    <span id="member_id"><a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">${boardRank.memberNickname}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    
                    <%---------------------------------------- 지난주 로그인 랭킹 ----------------------------------------%>
                    <div class="member_ranking" id="memberLoginRank">
                        <c:choose>
                            <c:when test="${empty loginRank.loginRankList}">
                                <div>랭킹업슴</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="loginRank" items="${loginRank.loginRankList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>${status.count}. </span>
                                                <div>
                                                    <span id="member_id"><a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">${loginRank.memberNickname}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div id="ranking">
                    <div id="ranking_title">
                        지난주 게시글 랭킹
                    </div>

                    <div class="ranking_category">
                        <ul>
                            <li><a href="#" onclick="return false;" class="boardLike" style="color: red; cursor: text; text-decoration: none;">좋아요 횟수</a></li>
                            <div id="ranking_line"></div>
                            <li><a href="#" onclick="return false;" class="boardComment">댓글수</a></li>
                        </ul>
                    </div>

                    <%---------------------------------------- 게시글 랭킹 <좋아요> ----------------------------------------%>
                    <div class="member_ranking" id="boardLikeRank">
                        <c:choose>
                            <c:when test="${empty boardLike.boardLikeList}">
                                <div>랭킹업슴</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="boardLike" items="${boardLike.boardLikeList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>${status.count}. </span>
                                                <div>
                                                    <span id="member_id"><a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">${boardLike.boardTitle}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <%---------------------------------------- 게시글 랭킹 <댓글> ----------------------------------------%>
                    <div class="member_ranking" id="boardCommentRank">
                        <c:choose>
                            <c:when test="${empty boardComment.boardCommentList}">
                                <div>랭킹업슴</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="boardComment" items="${boardComment.boardCommentList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>${status.count}. </span>
                                                <div>
                                                    <span id="member_id"><a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">${boardComment.boardTitle}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    </div>
                </div>

                <div id="ranking">
                    <div id="ranking_title">
                        멤버 소식
                    </div>

                    <div class="ranking_category">
                        <ul>
                            <li><a href="#" onclick="return false;" style="color: red; cursor: text; text-decoration: none;">방문</a></li>
                            <div id="ranking_line"></div>
                            <li><a href="#" onclick="return false;">신입</a></li>
                        </ul>
                    </div>

                    <%---------------------------------------- 멤버 랭킹 <방문> ----------------------------------------%>
                    <div class="member_ranking" id="memberVisitRank">
                        <c:choose>
                            <c:when test="${empty memberVisit.memberVisitList}">
                                <ul>
                                    <li id="ranking-member">
                                        <div>
                                            <span class="noData"><br>최근 방문자</a></span>
                                        </div>
                                    </li>
                                    <li id="ranking-member">
                                        <div>
                                            <span class="noData">정보가 없습니다.</a></span>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="memberVisit" items="${memberVisit.memberVisitList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <div>
                                                    <span id="member_id"><a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">${memberVisit.memberNickname}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <%---------------------------------------- 멤버 랭킹 <신입> ----------------------------------------%>
                    <div class="member_ranking" id="memberNewRank">
                        <c:choose>
                            <c:when test="${empty memberNew.memberNewList}">
                                <ul>
                                    <li id="ranking-member">
                                        <div>
                                            <span id="member_id"><br>가입한 회원 정보가 없습니다.</a></span>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="memberNew" items="${memberNew.memberNewList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <div>
                                                    <span id="member_id"><a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">${memberNew.memberNickname}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div id="ranking">
                    <div id="ranking_title">
                        최근 게시글 / 댓글
                    </div>

                    <div class="ranking_category">
                        <ul>
                            <li><a href="#" onclick="return false;"style="color: red; cursor: text; text-decoration: none;">게시글</a></li>
                            <div id="ranking_line"></div>
                            <li><a href="#" onclick="return false;">댓글</a></li>
                        </ul>
                    </div>

                    <%---------------------------------------- 최근 게시글 ----------------------------------------%>
                    <div class="member_ranking" id="newBoard">
                        <c:choose>
                            <c:when test="${empty newBoard.newBoardList}">
                                <ul>
                                    <li></li>
                                    <li id="ranking-member">
                                        <div>
                                            <span id="member_id">최근 정보를 업데이트중입니다</a></span>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="newBoard" items="${newBoard.newBoardList}">
                                        <ul>
                                            <li id="ranking-member"class="rank-logun">
                                                <span>ㆍ</span>
                                                <div>
                                                    <span id="member_id"><a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">${newBoard.boardTitle}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <%---------------------------------------- 최근 댓글 ----------------------------------------%>
                    <div class="member_ranking" id="newComment">
                        <c:choose>
                            <c:when test="${empty newComment.newCommentList}">
                                <ul>
                                    <li></li>
                                    <li id="ranking-member">
                                        <div>
                                            <span id="member_id">최근 정보를 업데이트중입니다</a></span>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="newComment" items="${newComment.newCommentList}">
                                        <ul>
                                            <li id="ranking-member"class="rank-logun">
                                                <span>ㆍ</span>
                                                <div class="rank-logun">
                                                    <span id="member_id" class="rank-logun">
                                                        <a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">
                                                            ${newComment.commentContent}
                                                        </a>
                                                    </span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:when>
            </c:choose>

            <%-------------------------------------------------- 로그인했을때 보여지는 랭킹 --------------------------------------------------%>
            <c:if test="${!empty sessionScope.loginMember}">

                <div id="ranking">
                    <div id="ranking_title">
                        지난주 멤버 랭킹
                    </div>
                    <div class="ranking_category">
                        <ul>
                            <li><a href="#" onclick="return false;" id="member_comment" style="color: red; cursor: text; text-decoration: none;">댓글</a></li>
                            <div id="ranking_line"></div>
                            <li><a href="#" onclick="return false;" id="member_board">게시글</a></li>
                            <div id="ranking_line"></div>
                            <li><a href="#" onclick="return false;" id="member_visit">방문</a></li>
                        </ul>
                    </div>

                    <%---------------------------------------- 지난주 댓글 랭킹 ----------------------------------------%>
                    <div class="member_ranking" id="memberCommentRank">
                        <c:choose>
                            <c:when test="${empty commentRank.commentRankList}">
                                <div>랭킹이없어요</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="commentRank" items="${commentRank.commentRankList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>${status.count}.</span>
                                                <div>
                                                    <span id="member_id"><a href="/member/${commentRank.memberNo}">${commentRank.memberNickname}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <%---------------------------------------- 지난주 게시글 랭킹 ----------------------------------------%>
                    <div class="member_ranking" id="memberBoardRank">
                        <c:choose>
                            <c:when test="${empty boardRank.boardRankList}">
                                <div>랭킹업슴</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="boardRank" items="${boardRank.boardRankList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>${status.count}. </span>
                                                <div>
                                                    <span id="member_id"><a href="/member/${boardRank.memberNo}">${boardRank.memberNickname}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    
                    <%---------------------------------------- 지난주 로그인 랭킹 ----------------------------------------%>
                    <div class="member_ranking" id="memberLoginRank">
                        <c:choose>
                            <c:when test="${empty loginRank.loginRankList}">
                                <div>랭킹업슴</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="loginRank" items="${loginRank.loginRankList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>${status.count}. </span>
                                                <div>
                                                    <span id="member_id"><a href="/member/${loginRank.memberNo}">${loginRank.memberNickname}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div id="ranking">
                    <div id="ranking_title">
                        지난주 게시글 랭킹
                    </div>

                    <div class="ranking_category">
                        <ul>
                            <li><a href="#" onclick="return false;" class="boardLike" style="color: red; cursor: text; text-decoration: none;">좋아요 횟수</a></li>
                            <div id="ranking_line"></div>
                            <li><a href="#" onclick="return false;" class="boardComment">댓글수</a></li>
                        </ul>
                    </div>

                    <%---------------------------------------- 게시글 랭킹 <좋아요> ----------------------------------------%>
                    <div class="member_ranking" id="boardLikeRank">
                        <c:choose>
                            <c:when test="${empty boardLike.boardLikeList}">
                                <div>랭킹업슴</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="boardLike" items="${boardLike.boardLikeList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>${status.count}. </span>
                                                <div>
                                                    <span id="member_id"><a href="/board/${boardLike.boardCode}/${boardLike.boardNo}">${boardLike.boardTitle}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <%---------------------------------------- 게시글 랭킹 <댓글> ----------------------------------------%>
                    <div class="member_ranking" id="boardCommentRank">
                        <c:choose>
                            <c:when test="${empty boardComment.boardCommentList}">
                                <div>랭킹업슴</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="boardComment" items="${boardComment.boardCommentList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>${status.count}. </span>
                                                <div>
                                                    <span id="member_id"><a href="/board/${boardComment.boardCode}/${boardComment.boardNo}">${boardComment.boardTitle}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    </div>
                </div>

                <div id="ranking">
                    <div id="ranking_title">
                        멤버 소식
                    </div>

                    <div class="ranking_category">
                        <ul>
                            <li><a href="#" onclick="return false;" style="color: red; cursor: text; text-decoration: none;">방문</a></li>
                            <div id="ranking_line"></div>
                            <li><a href="#" onclick="return false;">신입</a></li>
                        </ul>
                    </div>

                    <%---------------------------------------- 멤버 랭킹 <방문> ----------------------------------------%>
                    <div class="member_ranking" id="memberVisitRank">
                        <c:choose>
                            <c:when test="${empty memberVisit.memberVisitList}">
                                <ul>
                                    <li id="ranking-member">
                                        <div>
                                            <span class="noData"><br>최근 방문자</a></span>
                                        </div>
                                    </li>
                                    <li id="ranking-member">
                                        <div>
                                            <span class="noData">정보가 없습니다.</a></span>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="memberVisit" items="${memberVisit.memberVisitList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <div>
                                                    <span id="member_id"><a href="/member/${memberVisit.memberNo}">${memberVisit.memberNickname}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <%---------------------------------------- 멤버 랭킹 <신입> ----------------------------------------%>
                    <div class="member_ranking" id="memberNewRank">
                        <c:choose>
                            <c:when test="${empty memberNew.memberNewList}">
                                <ul>
                                    <li id="ranking-member">
                                        <div>
                                            <span id="member_id"><br>가입한 회원 정보가 없습니다.</a></span>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="memberNew" items="${memberNew.memberNewList}" varStatus="status">
                                        <ul>
                                            <li id="ranking-member">
                                                <div>
                                                    <span id="member_id"><a href="/member/${memberNew.memberNo}">${memberNew.memberNickname}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div id="ranking">
                    <div id="ranking_title">
                        최근 게시글 / 댓글
                    </div>

                    <div class="ranking_category">
                        <ul>
                            <li><a href="#" onclick="return false;"style="color: red; cursor: text; text-decoration: none;">게시글</a></li>
                            <div id="ranking_line"></div>
                            <li><a href="#" onclick="return false;">댓글</a></li>
                        </ul>
                    </div>

                    <%---------------------------------------- 최근 게시글 ----------------------------------------%>
                    <div class="member_ranking" id="newBoard">
                        <c:choose>
                            <c:when test="${empty newBoard.newBoardList}">
                                <ul>
                                    <li></li>
                                    <li id="ranking-member">
                                        <div>
                                            <span id="member_id">최근 정보를 업데이트중입니다</a></span>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="newBoard" items="${newBoard.newBoardList}">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>ㆍ</span>
                                                <div>
                                                    <span id="member_id"><a href="/board/${newBoard.boardCode}/${newBoard.boardNo}">${newBoard.boardTitle}</a></span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <%---------------------------------------- 최근 댓글 ----------------------------------------%>
                    <div class="member_ranking" id="newComment">
                        <c:choose>
                            <c:when test="${empty newComment.newCommentList}">
                                <ul>
                                    <li></li>
                                    <li id="ranking-member">
                                        <div>
                                            <span id="member_id">최근 정보를 업데이트중입니다</a></span>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="newComment" items="${newComment.newCommentList}">
                                        <ul>
                                            <li id="ranking-member">
                                                <span>ㆍ</span>
                                                <div>
                                                    <span id="member_id">
                                                        <a href="/board/${newComment.boardCode}/${newComment.boardNo}" class="toggle-btn">
                                                            ${newComment.commentContent}
                                                        </a>
                                                    </span>
                                                </div>
                                            </li>
                                        </ul>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <section id="delete">
                    <p><a href="/member/myPage/secession">카페탈퇴하기</a></p>
                </section>
            </c:if>

            <!-- **************************************카페 사이드 랭킹 쪽************************************** -->
        </section>
        <script src="/resources/js/main/sideMenu.js"></script>
</body>
</html>

