<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="memberBoardList" value="${map.memberBoardList}"/>
<c:set var="memberInfo" value="${map.memberInfo}"/>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보</title>
    <link rel="stylesheet" href="/resources/css/member/myPage.css">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
    <!-- header.jsp -->
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!-- main content 틀 -->
    <section id="flex">
        <!-- sideMenu.jsp -->
        <jsp:include page="/WEB-INF/views/intro/sideMenu.jsp"/>
        <div id="mainArea">
            <c:choose>
                <c:when test="${memberInfo.memberDeleteFlag eq 'N'}">
                <!-- memberInfo-header -->
                <div id="subProfile">
                    <div id="profileImgBox">
                        <!-- 프로필 이미지가 없을 경우 -->
                        <c:if test="${empty memberInfo.profileImage}">
                            <img id="profileImg" src="/resources/images/main/프로필.PNG">
                        </c:if>
                        <!-- 프로필 이미지가 있을 경우 -->
                        <c:if test="${not empty memberInfo.profileImage}">
                            <img id="profileImg" src="${memberInfo.profileImage}" >
                        </c:if>
                        </div>
                    <div class="profileInfo">
                        <div class="nickArea">${memberInfo.memberNickname}</div>
                        <div class="infoArea">
                            <span class="cafeGrade">
                                    ${memberInfo.memberLevelName} <img id="levelImage" src="${memberInfo.memberLevelImage}" alt="memberLevelImage"></span>
                            <div id="countArea">
                                <span class="count">방문 <Strong class="num">${memberInfo.logHistoryCount}</Strong></span>
                                <span class="count">작성글 <Strong class="num">${memberInfo.memberBoardCount}</Strong></span>
                                <span class="count">작성 댓글 <Strong class="num">${memberInfo.memberCommentCount}</Strong></span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 마이페이지 nav -->
                <div id="navArea">
                    <div class="navMenu"></div>
                </div> 
                <!-- 작성한 글 -->
                <div id="myBoardArea">
                    <table class="myBoardTb">
                        <thead>
                            <tr>
                                <th class="myBoard-th">글번호</th>
                                <th class="myBoard-th">제목</th>
                                <th class="myBoard-th">작성일</th>
                                <th class="myBoard-th">조회</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty memberBoardList}">
                                    <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                    <tr>
                                        <th colspan="4">해당 회원이 작성한 게시글이 존재하지 않습니다.</th>
                                    </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="memberBoard" items="${memberBoardList}">
                                    <tr>
                                        <td class="boardNo">${memberBoard.boardNo}</td>
                                        <td><a href="/board/${memberBoard.boardCode}/${memberBoard.boardNo}" class="title">
                                            <%-- 말머리가 있을 경우 --%>
                                            <c:if test="${not empty memberBoard.titleTagName}">
                                                <c:if test="${memberBoard.titleTagNo ne '0'}">
                                                    <span>[${memberBoard.titleTagName}]</span>
                                                </c:if>
                                            </c:if>
                                            ${memberBoard.boardTitle}</a>
                                            <%-- 댓글이 있을 경우 --%>
                                            <c:if test="${memberBoard.commentCount!=0}">
                                            <a href="#" class="comment">[${memberBoard.commentCount}]</a>
                                            </c:if>
                                        </td>
                                        <td class="reporting-date">${memberBoard.boardCreateDate}</td>
                                        <td class="hits">${memberBoard.readCount}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
                    <div class="pagination-area">
                        <c:if test="${not empty memberBoardList}">
                        <ul class="myPage-pagination">
                        
                            <!-- 이전 목록 마지막 번호로 이동 --> 
                            <li><a href="?cp=${pagination.prevPage}">&laquo;</a></li>
                            <%-- /member/myPage/myBoard --%>
                            <!-- 특정 페이지로 이동 -->
                            <c:forEach var="i" begin="${pagination.startPage}" 
                                end="${pagination.endPage}" step="1">
                                <c:choose>
                                    <c:when test="${i==pagination.currentPage}">
                                        <%-- 현재 보고있는 페이지 --%>
                                        <li><a class="myPage-current">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 현재 페이지를 제외한 나머지 -->
                                        <li><a href="?cp=${i}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <!-- 다음 목록 시작 번호로 이동 -->
                            <li><a href="?cp=${pagination.nextPage}">&raquo;</a></li>
                        </ul>
                        </c:if>
                    </div>

                </c:when>
                <c:otherwise>
                    <div class="myPage-script">탈퇴한 회원입니다.</div>
                </c:otherwise>
            </c:choose>
            <div>
                <button onclick="location.href='${referer}'" id="goToListBtn" class="top-list">뒤로가기</button >
            </div>
        </div>
    </section>
        
    <%-- footer.jsp --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/main/main.js"></script>
</body>
</html>