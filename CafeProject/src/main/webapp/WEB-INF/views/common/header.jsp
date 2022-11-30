<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- **************************************헤더************************************** -->
        <header>
            <!-- 헤더 왼쪽 상단 로고 -->
            <div id="header-top">
                <div id="never-gnb" class="__web-inspector-hide-shortcut__">
                    <a href="/" class="link_never">
                        <img src="/resources/images/NEVER_logo.png" width="52" height="10"
                            alt="NEVER">
                    </a>
                </div>
                <div id="header-top-menu">
                    
                    <c:choose>
                        <c:when test="${empty sessionScope.loginMember}">
                            <a href="/member/signUp"> 회원가입 </a>
                            <span>|</span>
                            <a href="/member/login"> 로그인 </a>
                        </c:when>
                        
                        <c:otherwise>
                            <a href="/"> 카페홈 </a>
                            <span>|</span>
                            <a href="/member/myPage/info">${loginMember.memberNickname}</a>
                        </c:otherwise>
                    </c:choose>
                    
                </div>
            </div>
            <!-- 헤더 오른쪽 상단 메뉴 -->

            <section id="pic">

                <img src="/resources/images/mainIMG.png">
                <section class="cafe_project_size">
                    <div class="cafe_project">
                        <div id="cafe_project_name">Train_Koraila</div>
                        <div id="cafe_project_names">Team_project Cafe</div>
                        </div>
                </section>

            </section>

        </header>
        <!-- **************************************헤더************************************** -->

        <!-- **************************************네비************************************** -->
        <nav>
            <ul class="special-menu">
                <!-- <c:forEach var="boardType" items="${boardTypeList}">
                    <%--
                        EL을 이용해서 Map 데이터를 다루는 방법
                        key   ==> ${변수명.key}
                        value ==> ${변수명.value}
                    --%>
                
                    <li>
                        <a href="/board/${boardType.BOARD_CODE}"><span id="special-menu">•</span>${boardType.BOARD_NAME}</a>
                    </li>

                </c:forEach> -->
                <li id="special-menu-0"><a class="link_special" href="#">전체글보기</a></li>
                <li id="special-menu-1"><a class="link_special" href="#">베스트게시글</a></li>
                <!-- <li id="special-menu-2"><a class="link_special" href="#">이미지모아보기</a></li> -->
                <li id="special-menu-1">⛅<a class="link_special" href="https://www.weather.go.kr/w/index.do" target="_blank">오늘의 날씨</a></li>

            </ul>
        </nav>

        <!-- **************************************네비************************************** -->