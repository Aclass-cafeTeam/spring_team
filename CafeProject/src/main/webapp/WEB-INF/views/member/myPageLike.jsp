<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="myLikeBoardList" value="${map.myLikeBoardList}"/>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>좋아요한 글</title>
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
            <!-- myPage-header -->
            <jsp:include page="/WEB-INF/views/member/myPageHeader.jsp"/>
            <!-- 좋아요한 글 -->
            <div id="myBoardArea">
                <table class="myBoardTb">
                    <thead>
                        <tr>
                            <th class="myBoard-th">글번호</th>
                            <th class="myBoard-th">제목</th>
                            <th class="myBoard-th">작성자</th>
                            <th class="myBoard-th">작성일</th>
                            <th class="myBoard-th">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty myLikeBoardList}">
                   		        <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                <tr>
                                    <th colspan="5">좋아요를 누른 게시글이 존재하지 않습니다.</th>
                                </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="myLikeBoard" items="${myLikeBoardList}">
                                <tr>
                                    <td class="boardNo">${myLikeBoard.boardNo}</td>
                                    <td><a href="/board/${myLikeBoard.boardCode}/${myLikeBoard.boardNo}" class="title">
                                        <c:if test="${not empty myLikeBoard.titleTagName}">
                                        <span>[${myLikeBoard.titleTagName}] </span>
                                        </c:if>
                                    ${myLikeBoard.boardTitle}</a>
                                        <c:if test="${myLikeBoard.commentCount!=0}">
                                        <a href="#" class="comment">[${myLikeBoard.commentCount}]</a>
                                        </c:if>
                                    </td>
                                    <td class="writer">${myLikeBoard.memberNickname}</td>
                                    <td class="reporting-date">${myLikeBoard.boardCreateDate}</td>
                                    <td class="hits">${myLikeBoard.readCount}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
            <div class="pagination-area">
                <c:if test="${not empty myPageBoardList}">
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
    </section>
        
    <%-- footer.jsp --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/main/main.js"></script>
</body>
</html>