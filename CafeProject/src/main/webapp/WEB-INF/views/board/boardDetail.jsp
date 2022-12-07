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

    <link rel="stylesheet" href="/resources/css/board/boardDetail.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/board/comment-style.css">

    <%-- fontawesome 한지훈 kit --%>
    <script src="https://kit.fontawesome.com/9f94c365a1.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
    <!-- **************************************헤더************************************** -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />


    
        <section id="flex">
            <!-- ****************사이드메뉴***************-->
            <jsp:include page="/WEB-INF/views/intro/sideMenu.jsp"/>
            <!-- ****************사이드메뉴***************-->
            <c:choose>
                <c:when test="${(loginMember.authorityNo eq 0) or (loginMember.authorityNo eq 1) or (loginMember.memberLevelNo ge boardLimit.memberLevelNo)}">
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
                            <!-- onclick="location.href='${referer}'" -->
                                <a href="/board/${boardCode}?cp=1" class="top-list">목록</a>
                            </div>
                        </div>
                        
                        <div class="board-all">    
                            <div class="profile-all">
                                <div class="titleBox">
                                    <a href="/board/${boardCode}?cp=1"><div class="board-list">${boardName} > </div></a>
                                    
                                    <!-- 말머리를 사용하는 게시판일 경우 -->
                                    <c:if test="${boardLimit.titleTagFlag=='Y'}">
                                        <!-- 말머리가 있을 경우 -->
                                        <c:if test="${not empty board.titleTagName}">
                                            <c:if test="${board.titleTagNo ne 0}"> 
                                                <div class="title-tag">[${board.titleTagName}]</div>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <div class="board-title">${board.boardTitle}</div>
                                </div>
                                    
                                <div class="profile">
                                    <div class="pi">
                                        <!-- 프로필 이미지가 없을 경우 -->
                                        <c:if test="${empty board.profileImage}">
                                            <img src="/resources/images/main/프로필.PNG">
                                        </c:if>
                                        <!-- 프로필 이미지가 있을 경우 -->
                                        <c:if test="${not empty board.profileImage}">
                                            <img src="${board.profileImage}">
                                        </c:if>
                                    </div>
                                    

                                    <div class="detail-info-area">
                                        <div class="nick-area">
                                            <div class="p-writer"><a href="/member/${board.memberNo}">${board.memberNickname}</a></div>
                                            <div class="p-tier">
                                                ${board.memberLevelName}
                                                <img id="levelImage" src="${board.memberLevelImage}">
                                            </div>
                                        </div>
                                        
                                        <div class="date-area">
                                            <div class="p-date"> ${board.boardCreateDate}</div>
                                            <!-- 수정한 게시글인 경우 -->
                                            <c:if test="${not empty board.boardUpdateDate}">
                                                <div class="p-date">수정일 ${board.boardUpdateDate}</div>
                                            </c:if>
                                            <div class="p-hits">조회 ${board.readCount}</div>
                                        </div>  
                                    </div>    
                                </div>
                            </div>
                            
                            <div class="contentBox">
                                <div class="board-content"> ${board.boardContent} </div>
                            </div>

                            
                            <div class="sideBox">
                                <%-- 좋아요 & 댓글--%>
                                <div class="like-comment">
                                    <c:choose>
                                        <c:when test="${boardLimit.boardLikeFlag=='Y'}">
                                            <!-- 좋아요 기능을 사용하는 게시판일 경우 -->
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
                                        </c:when>
                                        <c:otherwise>
                                            <!-- 좋아요 기능을 사용하지 않는 게시판일 경우(회색하트) -->
                                            <div class="gray-heart">
                                                <i class="fa-regular fa-heart"></i>
                                            </div>
                                                <div class="dont-like">좋아요</div>
                                                <%-- <div class="like-count" id="likeCount"></div>?- --%>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="bottom-comment">
                                        <span id="focusComment">
                                            <div class="count-comment"><i class="fa-regular fa-comment"></i></div>
                                            <div class="bottom-comment">댓글</div>
                                            <div class="comment-count">${board.commentCount}</div>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <!-- 댓글 영역 -->
                            <div class="commentBox">
                                <h3 class="h3-comment"> 댓글 </h3>
                                <div>
                                    <!-- 댓글 include-->
                                    <jsp:include page="comment.jsp"/>
                                </div>
                            </div>
                        </div>
                    </article>
                </c:when>
                <c:otherwise>
                    <jsp:include page="/WEB-INF/views/board/doNotRead.jsp"/>
                </c:otherwise>
            </c:choose>   
        </section>
    </main>
    <!-- **************************************푸터************************************** -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        const memberNo = "${loginMember.memberNo}";
        const boardNo = "${boardNo}";
        const authorityNo = "${loginMember.authorityNo}";
    </script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/main/main.js"></script>
    <script src="/resources/js/main/sideMenu.js"></script>
    <script src="/resources/js/board/boardDetail.js"></script>
    <script src="/resources/js/board/comment.js"></script>
</body>
</html>
