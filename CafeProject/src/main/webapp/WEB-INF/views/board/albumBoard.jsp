<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="boardList" value="${img.boardList}" />
<c:set var="imgPagination" value="${img.imgPagination}" />

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

            <!-- 7행 14열 -->
            <div>
                <table board="1" class="table">

                    <thead>
                        <tr>
                            <td></td>
                            <th class="empty"></th>
                            <th colspan="2" class="title">제목</th>
                            <th class="th-writer">작성자</th>
                            <th class="th-date">작성일</th>
                            <th class="th-hits">조회</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>&nbsp</td>
                            <td class="strong">공지</td>
                            <td><a href="#" class="strong-title">	
                                팀프로젝트 테스트 카페 카페를 시작합니다.
                            </a></td>
                            <td><a href="#" class="comment">[1]</a></td>
                            <td><a href="#" class="writer">JH</a></td>
                            <td class="reporting-date">2022.10.14.</td>
                            <td class="hits">2</td>
                        </tr>
                    </tbody>

                </table>
            </div>

            <ul class="ul">
                                            <c:forEach var="board" items="${boardList}">
                <li>
                    <a href="#"><img width="200" height="200" src="${board.thumbnail}"></a>
                    <div class="flex">
                        <div class="img-title"><a href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}"" class="img-title">
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
                
                <li>
                    <a href="#"><img width="200" height="200" src="../../resources/images/작은고양이.jpg"></a>
                    <div class="flex">
                        <div class="img-title"><a href="#" class="img-title">사진 입니당</a></div>
                        <div class="img-comment"><a href="#" class="img-comment"></a></div>
                    </div>
                    <div class="img-writer"><a href="#" class="img-writer">상남자</a></div>
                    <div class="flex">
                        <div class="img-date">2022.10.26.</div>
                        <span class="img-span">•</span>
                        <div class="img-hits">조회 0</div>
                    </div>
                </li>
            </ul>

            <div>
                <div class="writing">
                    <c:if test="${not empty loginMember}">
                        <button type="submit" class="writing-btn" id="insertBtn">글쓰기</button>
                    </c:if>
                </div>
            </div>
            <div>&nbsp</div>

            <div class="page">

                    <ul class="pagination">
        
                        <!-- 첫 페이지로 이동 -->
                        <li><a href="/board/${boardCode}?cp=1${sURL}">&lt;&lt;</a></li>

                        <!-- 이전 목록 마지막 번호로 이동 -->
                        <li><a href="/board/${boardCode}?cp=${pagination.prevPage}${sURL}">&lt;</a></li>

                        <%-- 몇부터 시작(begin)해서 몇까지(end) 몇칸씩 증가(step) --%>
                        <c:forEach var="i" begin="${imgPagination.startPage}" 
                        end="${pagination.endPage}" step="1">
            
                            <c:choose>
                                <c:when test="${i == imgPagination.currentPage}">
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

                    </ul>

            </div>

</body>
</html>