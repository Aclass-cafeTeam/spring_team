<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="boardList" value="${map.boardList}" />
<c:set var="noticeList" value="${notice.noticeList}" />
<c:set var="allNoticeList" value="${allNotice.allNoticeList}" />
<c:set var="pagination" value="${map.pagination}" />
<c:set var="pagination" value="${search.pagination}" />
<c:set var="boardList" value="${search.boardList}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${boardInfo.boardName}</title>

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

            <%-- 게시판 앨범형인 경우 --%>
            <c:if test="${boardInfo.boardForm=='A'}">
                <jsp:include page="/WEB-INF/views/board/albumBoard.jsp"/>
            </c:if>
            <%-- 게시판 목록형인경우 --%>
            <c:if test="${boardInfo.boardForm=='B'}">

                <%-- 검색을 진행한 경우 --%>
                <c:if test="${not empty param.key}">
                    <c:set var="sURL" value="&key=${param.key}&query=${param.query}" />
                </c:if>

                <article class="article">
                        <div class="board-name">${boardList[0].boardName}</div>
                        <p class="board-start"></p>

                        <div class="hidden">
                            <input type="checkbox" name="hidden" id="noticeHide">
                            <label for="hidden" id="noticeHide">공지 숨기기</label>

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
                                <c:when test="${empty allNoticeList}">
                                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                    <tr>
                                        <th colspan="7"></th>
                                    </tr>
                                </c:when>

                                <c:otherwise>
                                    <c:forEach var="board" items="${allNoticeList}">
                                        <tr>
                                            <td class="strong allStrong ">공지</td>
                                            <td>
                                                <a class="strong-title allStrong-title" href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}"">
                                                <!-- 말머리를 사용하는 게시판일 경우 -->
                                                <c:if test="${boardInfo.titleTagFlag=='Y'}">
                                                    <!-- 말머리가 있을 경우 -->
                                                    <c:if test="${not empty board.titleTagName}">
                                                        <c:if test="${board.titleTagNo ne 0}"> 
                                                            <div class="title-tag">[${board.titleTagName}]</div>
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                                ${board.boardTitle}</a>
                                                <c:if test="${board.commentCount!=0}">
                                                <a href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}" class="comment allComment">[${board.commentCount}]</a>
                                                </c:if>                        
                                            </td>
                                            <td></td>
                                            <td class="writer"><a href="/member/${board.memberNo}">${board.memberNickname}&nbsp<img width="10" height="10" class="levelImage" src="${board.memberLevelImage}"></a></td>
                                            <td class="reporting-date">${board.boardCreateDate}</td>
                                            <td class="hits">${board.readCount}</td>
                                            <td class="like">
                                            <%-- 좋아요를 사용하는 게시판일 경우 --%>
                                            <c:if test="${boardInfo.boardLikeFlag=='Y'}">
                                            ${board.likeCount}
                                            </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            <%-- if-else문 --%>
                            <c:choose>
                                <c:when test="${empty noticeList}">
                                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                    <tr>
                                        <th colspan="7"></th>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="board" items="${noticeList}">
                                        <tr>
                                            <td class="strong">공지</td>
                                            <td>
                                                <a class="strong-title" href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}"">
                                                <!-- 말머리를 사용하는 게시판일 경우 -->
                                                <c:if test="${boardInfo.titleTagFlag=='Y'}">
                                                    <!-- 말머리가 있을 경우 -->
                                                    <c:if test="${not empty board.titleTagName}">
                                                        <c:if test="${board.titleTagNo ne 0}"> 
                                                            <div class="title-tag">[${board.titleTagName}]</div>
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                                ${board.boardTitle}</a>
                                                <c:if test="${board.commentCount!=0}">
                                                <a href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}" class="comment">[${board.commentCount}]</a>
                                                </c:if>
                                            </td>
                                            <td></td>
                                            <td class="writer"><a href="/member/${board.memberNo}">${board.memberNickname}&nbsp<img width="10" height="10" class="levelImage" src="${board.memberLevelImage}"></a></td>
                                            <td class="reporting-date">${board.boardCreateDate}</td>
                                            <td class="hits">${board.readCount}</td>
                                            <td class="like">
                                            <%-- 좋아요를 사용하는 게시판일 경우 --%>
                                            <c:if test="${boardInfo.boardLikeFlag=='Y'}">
                                            ${board.likeCount}
                                            </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${empty boardList}">
                                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                    <tr>
                                        <th colspan="7">게시글이 존재하지 않습니다.</th>
                                    </tr>
                                </c:when>

                                <c:otherwise>
                                    <c:forEach var="board" items="${boardList}">
                                        <tr>
                                            <td class="board-number">${board.boardNo}</td>
                                            <td>
                                                <a class="normal-title" href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}"">
                                                <!-- 말머리를 사용하는 게시판일 경우 -->
                                                <c:if test="${boardInfo.titleTagFlag=='Y'}">
                                                    <!-- 말머리가 있을 경우 -->
                                                    <c:if test="${not empty board.titleTagName}">
                                                        <c:if test="${board.titleTagNo ne 0}"> 
                                                            <div class="title-tag">[${board.titleTagName}]</div>
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                                ${board.boardTitle}</a>
                                                <c:if test="${board.commentCount!=0}">
                                                <a href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}" class="comment">[${board.commentCount}]</a>
                                                </c:if>                   
                                            </td>
                                            <td></td>
                                            <td class="writer"><a href="/member/${board.memberNo}">${board.memberNickname}&nbsp<img width="10" height="10" class="levelImage" src="${board.memberLevelImage}"></a></td>
                                            <td class="reporting-date">${board.boardCreateDate}</td>
                                            <td class="hits">${board.readCount}</td>
                                            <td class="like">
                                            <%-- 좋아요를 사용하는 게시판일 경우 --%>
                                            <c:if test="${boardInfo.boardLikeFlag=='Y'}">
                                            ${board.likeCount}
                                            </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
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
                    <div>&nbsp</div>
                    <div class="pagination-area">
                        <ul class="pagination">
            
                            <!-- 첫 페이지로 이동 -->
                            <li><a href="/board/${boardCode}?cp=1${sURL}">&lt;&lt;</a></li>
                            <!-- 이전 목록 마지막 번호로 이동 -->
                            <li><a href="/board/${boardCode}?cp=${pagination.prevPage}${sURL}">&lt;</a></li>
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
                                        <li><a href="/board/${boardCode}?cp=${i}${sURL}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <li><a href="/board/${boardCode}?cp=${pagination.nextPage}${sURL}">&gt;</a></li>
                            <!-- 끝 페이지로 이동 -->
                            <li><a href="/board/${boardCode}?cp=${pagination.maxPage}${sURL}">&gt;&gt;</a></li>
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
                                <select name="key" id="search-key" class="choice">
                                    <option value="aa">제목</option>
                                    <option value="bb">내용</option>
                                    <option value="cc">제목 + 내용</option>
                                    <option value="dd">작성자</option>
                                    <option value="ee">말머리</option>
                                </select>
                        </div>
                        <article class="search-area">
                            <!-- 내부 input 태그의 값을 서버 또는 페이지로 전달(제출) -->
                                <input type="text" class="query" name="query" id="search-query"
                                placeholder="검색어를 입력해주세요">
                                <button class="search-btn">검색</button>
                            </form>
                        </article>
                    </div>
                </article>
            </c:if>
        </section>
    </main>

    <!-- **************************************푸터************************************** -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- ******************************************************************************** -->

    <script src="/resources/js/main/main.js"></script>
    <script src="/resources/js/board/boardList.js"></script>
    
</body>
</html>
