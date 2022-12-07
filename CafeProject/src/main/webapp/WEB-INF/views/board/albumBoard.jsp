<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="boardList" value="${img.boardList}" />
<c:set var="pagination" value="${img.pagination}" />
<c:set var="albumNoticeList" value="${albumNotice.albumNoticeList}" />
<c:set var="allNoticeList" value="${allNotice.allNoticeList}" />

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
    <section class="article">
                <div class="board-name">${boardList[0].boardName}</div>
                <p class="board-start"></p>

                    <div class="hidden">
                        <%-- <input type="checkbox" name="hidden" id="noticeHide">
                        <label for="hidden" id="noticeHide">공지 숨기기</label> --%>
                    </div>
            
            <!-- 7행 14열 -->
            <div>
                <table board="1" class="table">

                    <thead>
                        <tr>
                            <td></td>
                            <th class="empty"></th>
                            <th colspan="2" class="title"><%--제목--%></th>
                            <th class="th-writer"><%--작성자--%></th>
                            <th class="th-date"><%--작성일--%></th>
                            <th class="th-hits"><%--조회--%></th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="board" items="${noticeList}">
                        <tr>
                            <td>&nbsp</td>
                            <td class="strong">공지</td>
                            <td><a class="strong-title" href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}"">
                            <!-- 말머리가 있을 경우 -->
                            <c:if test="${not empty board.titleTagName}">
                                <c:if test="${board.titleTagName ne '선택 안 함'}"> 
                                    <span>[${board.titleTagName}]</span>
                                </c:if>
                            </c:if>
                            ${board.boardTitle}</a>
                            <c:if test="${board.commentCount!=0}">
                            <a href="#" class="comment">[${board.commentCount}]</a>
                            </c:if>
                            </td>
                            <td></td>
                            <td class="writer"><a href="/member/${board.memberNo}">${board.memberNickname}</a></td>
                            <td class="reporting-date">${board.boardCreateDate}</td>
                            <td class="hits">${board.readCount}</td>
                        </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </div>
            
            <%-- 앨범형 게시판 내용 --%>
            <ul class="ul">
            <c:choose>
                <c:when test="${empty boardList}">
                    <!-- 게시글 목록 조회 결과가 비어있다면 -->
                    <ul>
                        <li></li>
                    </ul>
                </c:when>
            <c:otherwise>
                <c:forEach var="board" items="${boardList}">
                    <li>
                        <%-- <a href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}">
                        <img width="200" height="200" src="${board.thumbnail}"></a> --%>
                        
                        <c:if test="${not empty board.thumbnail}">  
                        <a href="/board/${boardCode}/${board.boardNo}">
                        <img src="${board.thumbnail}" width="200px" height="200px"alt=""></a>
                        </c:if>

                        <c:if test="${empty board.thumbnail}">
                        <a href="/board/${boardCode}/${board.boardNo}">
                        <img src="/resources/images/intro/default-img.png" width="200px" height="200px"alt=""></a>
                        </c:if>                        
                        
                        
                        
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
            </c:otherwise>
            </c:choose>
            </ul>

                    <div>
                        <div class="writing">
                        <!-- 로그인 상태인 경우에만 글쓰기 버튼 노출 -->
                        <c:if test="${not empty loginMember}">
                            <c:if test="${(loginMember.authorityNo eq 0) or (loginMember.authorityNo eq 1) or (loginMember.memberLevelNo ge boardInfo.memberLevelNo)}">
                                <button type="submit" class="writing-btn" id="insertBtn">글쓰기</button>
                            </c:if>
                        </c:if>
                        </div>
                    </div>
                    <%-- <ul class="pagination">
            
                            <!-- 첫 페이지로 이동 -->
                            <li><a href="/board/${boardCode}?cp=1${sURL}">&lt;&lt;</a></li>
                            <!-- 이전 목록 마지막 번호로 이동 -->
                            <li><a href="/board/${boardCode}?cp=${pagination.prevPage}${sURL}">&lt;</a></li>
                            <c:forEach var="i" begin="${pagination.startPage}" 
                            end="${pagination.endPage}" step="1">
                
                                <c:choose>
                                    <c:when test="${i == pagination.currentPage}">
                                        <!-- 현재 보고있는 페이지 -->
                                        <li><a class="current">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 현재 페이지를 제외한 나머지 -->
                                        <li><a href="/board/${boardCode}?cp=${i}${sURL}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <li><a href="/board/${boardCode}?cp=${pagination.nextPage}${sURL}">&gt;</a></li>
                            <!-- 끝 페이지로 이동 -->
                            <li><a href="/board/${boardCode}?cp=${pagination.maxPage}${sURL}">&gt;&gt;</a></li>
                        </ul> --%>
            </main>
</body>
</html>