<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="boardName" value="${boardTypeList[boardCode-1].BOARD_NAME}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${board.boardTitle}</title>

    <link rel="stylesheet" href="/resources/css/board/board4.css">
    <link rel="stylesheet" href="/resources/css/main.css">

    <%-- fontawesome 한지훈 kit --%>
    <script src="https://kit.fontawesome.com/9f94c365a1.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
    <!-- **************************************헤더************************************** -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />


    <!-- **************************************사이드메뉴************************************** -->
        <section id="flex">
            <jsp:include page="/WEB-INF/views/intro/sideMenu.jsp"/>
            <article class="article">
                <div class="top-menu">
                    <div>
                        <!-- 로그인한 회원과 게시글 작성자 번호가 같은 경우-->
                        <c:if test="${loginMember.memberNo==board.memberNo}">
                            <button id="updateBtn" class="top-alter">수정</button>
                            <button id="deleteBtn" class="top-delete">삭제</button>
                        </c:if>
                    </div>
                    
                    <div>
                        <button id="goToListBtn" class="top-list">목록</button>
                    </div>
                </div>
                <div class="board-all">    
                    <div class="profile-all">
                        <a href="/board/${boardCode}?cp=1"><div class="board-list">${boardName}</div></a>

                            <%-- 말머리가 있을 경우 --%>
                            <c:if test="${not empty board.titleTagName}">
                                <div class="title-tag">[${board.titleTagName}]</div>
                            </c:if>
                        <div class="board-title">${board.boardTitle}</div>

                        <div class="profile">
                            <!-- 프로필 이미지가 없을 경우 -->
                            <c:if test="${empty board.profileImage}">
                                <img width="36" height="36" src="/resources/images/main/프로필.PNG">
                            </c:if>
                            <!-- 프로필 이미지가 있을 경우 -->
                            <c:if test="${not empty board.profileImage}">
                                <img  width="36" height="36" src="${board.profileImage}">
                            </c:if>

                            <div class="detail-info-area">
                                <div class="nick-area">
                                    <div class="p-writer">${board.memberNickname}</div>
                                    <div class="p-tier">
                                        ${board.memberLevelName}
                                        <img id="levelImage" src="${board.memberLevelImage}">
                                    </div>
                                </div>
                                
                                <div class="date-area">
                                    <div class="p-date">작성일 ${board.boardCreateDate}</div>
                                    <!-- 수정한 게시글인 경우 -->
                                    <c:if test="${not empty board.boardUpdateDate}">
                                        <div class="p-date">수정일 ${board.boardUpdateDate}</div>
                                    </c:if>
                                    <div class="p-hits">조회 ${board.readCount}</div>
                                </div>  
                            </div>    
                        </div>
                    </div>
                    <br>

                    <div class="board-content">
                        ${board.boardContent}
                    </div>

                    <br>

                        <%-- 좋아요 --%>
                        <div class="like-comment">
                            <div class="count-like">
                                <%-- likeCheck가 없다면 == 로그인X 또는 좋아요X --%>
                                <c:if test="${empty likeCheck}">
                                    <%-- 빈 하트 --%>
                                    <i class="fa-regular fa-heart" id="boardLike"></i>
                                </c:if>

                                <%-- likeCheck가 있다면 == 로그인O, 좋아요O --%>
                                <c:if test="${not empty likeCheck}">
                                    <%-- 채워진 하트 --%>
                                    <i class="fa-solid fa-heart" id="boardLike"></i>
                                </c:if>
                            </div>

                                <div class="board-like">좋아요</div>
                                <div class="like-count" id="likeCount">${board.likeCount}</div>

                            <div class="bottom-comment">
                                <a href="#">
                                    <div class="count-comment"><i class="fa-regular fa-comment"></i></div>
                                    <div class="bottom-comment">댓글</div>
                                    <div class="comment-count">${board.commentCount}</div>
                                </a>
                            </div>
                        </div>

                    <h3 class="h3-comment">
                        댓글
                    </h3>
                </div>
            </article>
        </section>
    </main>
    <!-- **************************************푸터************************************** -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        const memberNo = "${loginMember.memberNo}";
        const boardNo = "${boardNo}";
    </script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/main/main.js"></script>
    <script src="/resources/js/board/boardDetail.js"></script>
</body>
</html>
