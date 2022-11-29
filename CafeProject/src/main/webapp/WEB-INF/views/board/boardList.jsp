<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>
<c:set var="boardList" value="${map.boardList}" />
<c:set var="noticeList" value="${notice.noticeList}" />
<c:set var="pagination" value="${map.pagination}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글</title>

    <link rel="stylesheet" href="/resources/css/board/board.css">
    <link rel="stylesheet" href="/resources/css/main.css">

</head>
<body>
    <main>
        <!-- **************************************헤더************************************** -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />


        <!-- **************************************카페 사이드!!!!!!!!!!!!!!!!!!!!!!!!************************************** -->

        <section id="flex">
            <jsp:include page="/WEB-INF/views/intro/sideMenu.jsp"/>

    <article class="article">
        <div class="board-name">${boardList[0].boardName}</div>
        <p class="board-start">게시판 설명(메뉴 설명)</p>

            <div class="hidden">
                <input type="checkbox" name="hidden" id="#">
                <label for="hidden" id="#">
                    <!-- announcement-dissimulate -->
                    공지 숨기기
                </label>
                <span class="span">|</span>
                <form action="#">
                    <select name="amount">

                        <option value="a">5개씩</option>
                        <option value="b">10개씩</option>
                        <option value="c">15개씩</option>
                    </select>
            
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
                            <tr>
                                <th colspan="7">게시글이 존재하지 않습니다.</th>
                            </tr>
                        </c:when>

                        <c:otherwise>
                            <c:forEach var="board" items="${noticeList}">
                                <tr>
                                    <td class="strong">공지</td>
                                    <td>
                                        <a class="strong-title" href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}"">${board.boardTitle}</a>                        
                                    </td>
                                    <td class="comment">[${board.commentCount}]</td>
                                    <td class="writer">${board.memberNickname}</td>
                                    <td class="reporting-date">${board.boardCreateDate}</td>
                                    <td class="hits">${board.readCount}</td>
                                    <td class="like">${board.likeCount}</td>
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
                                        <a class="normal-title" href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sURL}"">${board.boardTitle}</a>                        
                                    </td>
                                    <td class="comment">[${board.commentCount}]</td>
                                    <td class="writer">${board.memberNickname}</td>
                                    <td class="reporting-date">${board.boardCreateDate}</td>
                                    <td class="hits">${board.readCount}</td>
                                    <td class="like">${board.likeCount}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>

        <!-- 7행 14열 -->
    <!-- <table board="1" class="table">

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
        <tr>
            <td class="strong">공지</td>
            <td><a href="#" class="strong-title">	
                ●숙박여행모임● 가을 만끽, 담양+논산
            </a></td>
            <td><a href="#" class="comment">[8]</a></td>
            <td><a href="#" class="writer">바이트레인</a></td>
            <td class="reporting-date">2022.10.23.</td>
            <td class="hits">1,428</td>
            <td class="like">8</td>
        </tr>

        <tr>
            <td class="strong">공지</td>
            <td><a href="#" class="strong-title">
                ●당일여행,10/29, 10/30 ● 당일치기, 가을 소풍 (단풍놀이)
            </a></td>
            <td><a href="#" class="comment">[7]</a></td>
            <td><a href="#" class="writer">바이트레인</a></td>
            <td class="reporting-date">2022.10.17.</td>
            <td class="hits">4,304</td>
            <td class="like">16</td>
        </tr>

        <tr>
            <td class="strong">공지</td>
            <td><a href="#" class="strong-title">	
                ●당일여행 11/26,11/27● 서울근교 당일여행
            </a></td>
            <td><a href="#" class="comment">[2]</a></td>
            <td><a href="#" class="writer">바이트레인</a></td>
            <td class="reporting-date">01:30</td>
            <td class="hits">76</td>
            <td class="like">1</td>
        </tr>

        <tr>
            <td class="strong">공지</td>
            <td><a href="#" class="strong-title">	
                🎉 뉴진스 코드 IN 부산 시청 이벤트 🎉
            </a></td>
            <td><a href="#" class="comment">[1]</a></td>
            <td><a href="#" class="writer">바이트레인</a></td>
            <td class="reporting-date">2022.10.28.</td>
            <td class="hits">265</td>
            <td class="like">2</td>
        </tr>

        <tr>
            <td class="strong">공지</td>
            <td><a href="#" class="strong-title">	
                다가오는 11월 5일, 2022 여수동동북축제가 개최됩니다~!
            </a></td>
            <td><a href="#" class="comment">[10]</a></td>
            <td><a href="#" class="writer">여수관광</a></td>
            <td class="reporting-date">2022.10.27.</td>
            <td class="hits">209</td>
            <td class="like">0</td>
        </tr>

        <tr>
            <td class="strong">공지</td>
            <td><a href="#" class="strong-title">	
                ● 자연 속 치유와 힐링의 공간, 하이힐링원 팸투어 체험단 모집 ●
            </a></td>
            <td><a href="#" class="comment">[1]</a></td>
            <td><a href="#" class="writer">소유인</a></td>
            <td class="reporting-date">2022.10.26.</td>
            <td class="hits">342</td>
            <td class="like">1</td>
        </tr>

        <tr>
            <td class="strong">공지</td>
            <td><a href="#" class="strong-title">	
                [여행추천] 단양 청년 창업 핫플 여행지 모음집
            </a></td>
            <td><a href="#" class="comment">[23]</a></td>
            <td><a href="#" class="writer">바이트레인</a></td>
            <td class="reporting-date">2022.09.28.</td>
            <td class="hits">662</td>
            <td class="like">2</td>
        </tr>

        <tr>
            <td class="strong">공지</td>
            <td><a href="#" class="strong-title">	
                [9월2주] 가을이 오는 9월 2주 이야기
            </a></td>
            <td><a href="#" class="comment">[22]</a></td>
            <td><a href="#" class="writer">여행자의별별여행</a></td>
            <td class="reporting-date">2022.09.23.</td>
            <td class="hits">178</td>
            <td class="like">6</td>
        </tr>

        <tr>
            <td class="strong">공지</td>
            <td><a href="#" class="strong-title">	
                ■〓〓▶ 바이트레인 - 카페 이용안내 및 통합 공지
            </a></td>
            <td><a href="#" class="comment">[11164]</a></td>
            <td><a href="#" class="writer">바이트레인</a></td>
            <td class="reporting-date">2006.10.09.</td>
            <td class="hits">18만</td>
            <td class="like">140</td>
        </tr>
        </tbody>

        <tfoot>
            <tr>
                <td class="board-number">1000004</td>
                <td><a href="#" class="normal-title">
                    겨울간식 장난 없네요ㅎㅎ
                </a></td>
                <td><a href="#" class="comment">[2]</a></td>
                <td><a href="#" class="writer">낭만이가</a></td>
                <td class="reporting-date">16:42</td>
                <td class="hits">28</td>
                <td class="like">0</td>
            </tr>

            <tr>
                <td class="board-number">1000003</td>
                <td><a href="#" class="normal-title">
                    우이령둘레길
                </a></td>
                <td><a href="#" class="comment"></a></td>
                <td><a href="#" class="writer">태길이</a></td>
                <td class="reporting-date">16:08</td>
                <td class="hits">16</td>
                <td class="like">0</td>
            </tr>

            <tr>
                <td class="board-number">1000002</td>
                <td><a href="#" class="normal-title">
                    조금만먹기
                </a></td>
                <td><a href="#" class="comment">[2]</a></td>
                <td><a href="#" class="writer">벤지맨</a></td>
                <td class="reporting-date">15:30</td>
                <td class="hits">22</td>
                <td class="like">1</td>
            </tr>

            <tr>
                <td class="board-number">1000001</td>
                <td><a href="#" class="normal-title">
                    회사 구내식당
                </a></td>
                <td><a href="#" class="comment">[2]</a></td>
                <td><a href="#" class="writer">보라라보</a></td>
                <td class="reporting-date">14:25</td>
                <td class="hits">43</td>
                <td class="like">0</td>
            </tr>

            <tr>
                <td class="board-number">1000000</td>
                <td><a href="#" class="normal-title">
                    직접 먹어본걸 추천해 달라는 사람 어떤가요?
                </a></td>
                <td><a href="#" class="comment"></a></td>
                <td><a href="#" class="writer">어딜만져</a></td>
                <td class="reporting-date">14:20</td>
                <td class="hits">55</td>
                <td class="like">0</td>
            </tr>

        </tfoot>

    </table> -->

    <div>
        <div class="writing">
        <button type="submit" class="writing-btn">글쓰기</button>
        </div>
    </div>
    <div>&nbsp</div>

    <!-- <div class="page">
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">7</a>
        <a href="#">8</a>
        <a href="#">9</a>
        <a href="#">10</a>
        <span>|</span>
        <span><a href="#" class="daum">다음</a></span>

    </div> -->
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


            <!-- 특정 페이지로 이동 -->
            
            <%-- <!-- 현재 보고있는 페이지 -->
            <li><a class="current">1</a></li>
            
            <!-- 현재 페이지를 제외한 나머지 -->
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">6</a></li>
            <li><a href="#">7</a></li>
            <li><a href="#">8</a></li>
            <li><a href="#">9</a></li>
            <li><a href="#">10</a></li> --%>
            
            <!-- 다음 목록 시작 번호로 이동 -->
            <li><a href="/board/${boardCode}?cp=${pagination.nextPage}${sURL}">&gt;</a></li>

            <!-- 끝 페이지로 이동 -->
            <li><a href="/board/${boardCode}?cp=${pagination.maxPage}${sURL}">&gt;&gt;</a></li>

        </ul>
    </div>

    <div class="last">
        <div class="time_">
            <form action="#">
                <select name="time" class="time">
                    <option value="aa">전체기간</option>
                    <option value="bb">1일</option>
                    <option value="cc">1주</option>
                    <option value="dd">1개월</option>
                    <option value="ee">6개월</option>
                    <option value="cc">1년</option>
                </select>
            </form>
        </div>

        <div class="choice_">
            <form action="#">
                <select name="choice" class="choice">
                    <option value="aa">제목만</option>
                    <option value="bb">글작성자</option>
                    <option value="cc">댓글내용</option>
                    <option value="dd">댓글작성자</option>
                </select>
            </form>
        </div>

        <article class="search-area">

            <!-- 내부 input 태그의 값을 서버 또는 페이지로 전달(제출) -->
            <form action="#">

                    <input type="text" class="query" name="query"
                    placeholder="검색어를 입력해주세요">
                    <button type="submit" id="#" class="search-btn">검색</button>
                    
            </form>
        </article>

    </div>

</section>

</main>

    <!-- **************************************푸터************************************** -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="/resources/js/main/main.js"></script>
</body>
</html>