<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="myPageBoardList" value="${map.myPageBoardList}"/>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내가 쓴 글</title>
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
            <!-- 내가 쓴 글 -->
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
                        <c:when test="${empty myPageBoardList}">
                   		        <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                <tr>
                                    <th colspan="4">작성한 게시글이 존재하지 않습니다.</th>
                                </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="myPageBoard" items="${myPageBoardList}">
                                <tr>
                                    <td class="boardNo">${myPageBoard.boardNo}</td>
                                    <td><a href="#" class="title">${myPageBoard.boardTitle}</a>
                                        <a href="#" class="comment">[${myPageBoard.commentCount}]</a>
                                    </td>
                                    <td class="reporting-date">${myPageBoard.boardCreateDate}</td>
                                    <td class="hits">${myPageBoard.readCount}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
            <div class="pagination-area">

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
            </div>
        </div>
    </section>
        
    <%-- footer.jsp --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/member/myPage.js"></script>
</body>
</html>