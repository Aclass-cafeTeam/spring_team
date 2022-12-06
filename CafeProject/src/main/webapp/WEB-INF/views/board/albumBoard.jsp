<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="boardList" value="${img.boardList}" />
<c:set var="pagination" value="${img.pagination}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>앨범형</title>

    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/board/albumBoard.css">

</head>
<body>
    <main>
            <%-- 앨범형 게시판 내용 --%>
            <ul class="ul">
                <c:forEach var="board" items="${boardList}">
                    <li>
                        <a href="#"><img width="200" height="200" src="${board.thumbnail}"></a>
                        <div class="flex">
                            <div class="img-title"><a href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}" class="img-title">
                            <!-- 말머리를 사용하는 게시판일 경우 -->
                            <c:if test="${boardInfo.titleTagFlag=='Y'}">
                                <!-- 말머리가 있을 경우 -->
                                <c:if test="${not empty board.titleTagName}">
                                    <c:if test="${board.titleTagNo ne 0}"> 
                                        <div class="title-tag">[${board.titleTagName}]</div>
                                    </c:if>
                                </c:if>
                            </c:if>
                            ${board.boardTitle}</a></div>
                            <div class="img-comment"><a href="#" class="img-comment">
                            <c:if test="${board.commentCount!=0}">
                            <a href="#" class="comment">[${board.commentCount}]</a>
                            </c:if>
                            </a></div>
                        </div>
                        <div class="img-writer"><a href="/member/${board.memberNo}" class="img-writer">${board.memberNickname}</a></div>
                        <div class="flex">
                            <div class="img-date">${board.boardCreateDate}</div>
                            <span class="img-span">•</span>
                            <div class="img-hits">조회 ${board.readCount}</div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
</body>
</html>