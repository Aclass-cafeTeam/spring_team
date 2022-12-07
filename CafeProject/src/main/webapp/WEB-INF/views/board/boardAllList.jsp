<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="noticeList" value="${notice.noticeList}" />
<c:set var="pagination" value="${all.pagination}" />
<c:set var="allList" value="${all.allList}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글</title>

    <link rel="stylesheet" href="/resources/css/board/boardList.css">
    <link rel="stylesheet" href="/resources/css/main.css">

</head>
<body>
    <main>
        <!-- **************************************헤더************************************** -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />


        <!-- **************************************카페 사이드!!!!!!!!!!!!!!!!!!!!!!!!************************************** -->

        <section id="flex">
            <jsp:include page="/WEB-INF/views/intro/sideMenu.jsp"/>

            <%-- 검색을 진행한 경우 --%>
            <c:if test="${not empty param.key}">
                <c:set var="sURL" value="&key=${param.key}&query=${param.query}" />
            </c:if>

            <article class="article">
                    <div class="board-name">전체글보기</div>
                    <p class="board-start"></p>

                    <div class="hidden">
                        <%-- <input type="checkbox" name="hidden" id="#">
                        <label for="hidden" id="#">공지 숨기기</label> --%>

                        <%-- <span class="span">|</span> --%>

                        <form action="#">
                            <%-- <select name="amount">
                                <option value="a">5개씩</option>
                                <option value="b">10개씩</option>
                                <option value="c">15개씩</option>
                            </select> --%>
                        </form>
                    </div>
    

                <table class="list-table">
                    <thead>
                        <tr>
                            <th class="empty"></th>
                            <th colspan="2" class="title">제목</th>
                            <th class="th-writer">작성자</th>
                                <th class="th-date">작성일</th>
                            <th class="th-hits">조회</th>
                            <th><a href="#" class="th-like">좋아요</a></th>
                        </tr>
                    </thead>

                    <tbody>

                        <%-- if-else문 --%>
                        <c:choose>
                            <c:when test="${empty noticeList}">
                            <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                <%-- <tr>
                                    <th colspan="7">게시글이 존재하지 않습니다.</th>
                                </tr> --%>
                            </c:when>

                            <c:otherwise>
                                <c:forEach var="board" items="${noticeList}">
                                    <tr>
                                        <td class="strong">공지</td>
                                        <td>
                                            <a class="strong-title" href="/board/${board.boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}">
                                            ${board.boardTitle}</a>
                                            <c:if test="${board.commentCount!=0}">
                                            <a href="#" class="comment">[${board.commentCount}]</a>
                                            </c:if>                        
                                        </td>
                                        <td></td>
                                        <td class="writer">< href="/member/${board.memberNo}">${board.memberNickname}&nbsp<img width="10" height="10" class="levelImage" src="${board.memberLevelImage}"></a></td>
                                        <td class="reporting-date">${board.boardCreateDate}</td>
                                        <td class="hits">${board.readCount}</td>
                                        <td class="like">${board.likeCount}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${empty allList}">
                            <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                <tr>
                                    <th colspan="7"></th>
                                </tr>
                            </c:when>

                            <c:otherwise>
                                <c:forEach var="board" items="${allList}">
                                    <tr>
                                        <td class="board-number">${board.boardNo}</td>
                                        <td>
                                            <a class="normal-title" href="/board/${board.boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}">
                                            ${board.boardTitle}</a>
                                            <c:if test="${board.commentCount!=0}">
                                            <a href="/board/${board.boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}" class="comment">[${board.commentCount}]</a>
                                            </c:if>                   
                                        </td>
                                        <td></td>
                                        <td class="writer"><a href="/member/${board.memberNo}">${board.memberNickname}&nbsp<img width="10" height="10" class="levelImage" src="${board.memberLevelImage}"></a></td>
                                        <td class="reporting-date">${board.boardCreateDate}</td>
                                        <td class="hits">${board.readCount}</td>
                                        <td class="like">${board.likeCount}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>

                <div>
                    <div class="writing">
                        <button type="submit" class="writing-btn">글쓰기</button>
                    </div>
                </div>

                <div>&nbsp</div>

                <div class="pagination-area">

                    <ul class="pagination">
        
                        <!-- 첫 페이지로 이동 -->
                        <li><a href="?cp=1${sURL}">&lt;&lt;</a></li>

                        <!-- 이전 목록 마지막 번호로 이동 -->
                        <li><a href="?cp=${pagination.prevPage}${sURL}">&lt;</a></li>

                        <%-- 몇부터 시작(begin)해서 몇까지(end) 몇칸씩 증가(step) --%>
                        <c:forEach var="i" begin="${pagination.startPage}" 
                        end="${pagination.endPage}" step="1">
            
                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                                </c:when>

                                <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="?cp=${i}${sURL}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>

                        <li><a href="?cp=${pagination.nextPage}${sURL}">&gt;</a></li>

                        <!-- 끝 페이지로 이동 -->
                        <li><a href="?cp=${pagination.maxPage}${sURL}">&gt;&gt;</a></li>

                    </ul>
                </div>

                <div class="last">
                    <div class="time_">
                        <%-- <form action="#">
                            <select name="time" class="time">
                                <option value="aa">전체기간</option>
                                <option value="bb">1일</option>
                                <option value="cc">1주</option>
                                <option value="dd">1개월</option>
                                <option value="ee">6개월</option>
                                <option value="ff">1년</option>
                            </select>
                        </form> --%>
                    </div>

                    <div class="choice_">
                        <form action="${boardCode}" method="get" id="boardSearch" onsubmit="return true">
                            <%-- <select name="key" id="search-key" class="choice">
                                <option value="aa">제목</option>
                                <option value="bb">내용</option>
                                <option value="cc">제목 + 내용</option>
                                <option value="dd">작성자</option>
                            </select> --%>

                    </div>

                    <article class="search-area">

                        <!-- 내부 input 태그의 값을 서버 또는 페이지로 전달(제출) -->


                            <%-- <input type="text" class="query" name="query" id="search-query"
                            placeholder="검색어를 입력해주세요">
                            <button class="search-btn">검색</button> --%>
                    
                        </form>
                    </article>

                </div>

            </article>
        </section>

    </main>

    <!-- **************************************푸터************************************** -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="/resources/js/main/main.js"></script>
    
</body>
</html>