<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>intro</title>

    <link rel="stylesheet" href="../resources/css/intro.css">
</head>
<body>
    <section id="intro-section">
                <div id="intro1">
                    <div id="intro-gate">
                        <div id="gate-box">
                            <table>
                                <tbody>
                                    <tr>
                                        <td height="12px"></td>
                                    </tr>
                                    <tr>
                                        <td id="gate-content">
                                            <a href="https://www.letskorail.com/ebizprd/EbizPrdPassRailroIntroW_hc11902.do" target="_blank" onclick="alert('내일로 홈페이지로 이동합니다.')";>
                                                <img src="../resources/images/배너1.png">
                                            </a>
                                            <br><br>
                                            <img src="../resources/images/배너2.png">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="12px"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <%-- 로그인안함 --%>
                <c:choose>
                    <c:when test="${empty sessionScope.loginMember}">
                        <div id="intro2">
                            <div id="intro-content">
                                <!-- <div id="content1"> -->
                                    <!-- 메인화면 전체글보기 -->
                                    <div id="intro-board">
                                        <div id="intro-board-tit-box">
                                            <div id="intro-board-tit">
                                                <h3>전체글보기</h3><span><a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">더보기 ></a></span>
                                            </div>
                                        </div>
                                        <table id="intro-board-list">
                                            <tbody id="tbody">
                                                <!-- 공지글 -->
                                                <c:choose>
                                                    <c:when test="${empty noticeList.introNoticeList}">
                                                        안돼
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="introNotice" items="${noticeList.introNoticeList}">
                                                            <tr id="intro-notice-list">
                                                            <td id="board-content">
                                                                <div id="notice-tag-block">
                                                                    <div id="notice-tag">
                                                                        <strong>공지</strong>
                                                                    </div>
                                                                </div>
                                                                <div id="notice-board">
                                                                    <a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');"><span id="notice">${introNotice.boardTitle}</span></a>
                                                                    <c:if test="${0 != introNotice.commentCount}">
                                                                        <a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');"><span id="commentCount1">[${introNotice.commentCount}]</span></a>
                                                                    </c:if>
                                                                </div>
                                                            </td>
                                                            <td id="board-view">
                                                                ${introNotice.readCount}
                                                            </td>
                                                        </tr>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                                <!-- 게시글 -->
                                                <c:choose>
                                                    <c:when test="${empty boardList.introBoardList}">
                                                        <div>안돼</div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="introBoard" items="${boardList.introBoardList}">
                                                            <tr id="boardTitle">
                                                                <td id="board-content">
                                                                    <div id="board-dot">ㆍ</div>
                                                                    <a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">
                                                                        <div id="board-name">
                                                                            ${introBoard.boardTitle}
                                                                        </div>
                                                                    </a>
                                                                    이미지
                                                                    <%-- <c:choose>
                                                                    <c:forEach var="img" items="${boardImg.boardImgList}">
                                                                        <c:if test="${img.boardNo eq introBoard.boardNo}">
                                                                        이미지?
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    </c:choose> --%>
                                                                    <c:if test="${0 != introBoard.commentCount}">
                                                                        <a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');"><span id="commentCount1">[${introBoard.commentCount}]</span></a>
                                                                    </c:if>
                                                                </td>
                                                                <td id="board-view">
                                                                    ${introBoard.readCount}
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                    <div id="intro-album">
                                        <div id="intro-board-tit-box">
                                            <div id="intro-board-tit">
                                                <h3>여행 후기</h3><span><a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">더보기 ></a></span>
                                            </div>
                                        </div>
                                        <ul id="album-content">
                                            <c:choose>
                                                <c:when test="${empty travelReviewList.introTravelReviewList}">
                                                    안된단다
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="travelReview" items="${travelReviewList.introTravelReviewList}">
                                                        <li id="album">
                                                            <dl>
                                                                <dt id="photo-img">
                                                                <c:if test="${not empty travelReview.thumbnail}">  
                                                                <a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');"><img src="${travelReview.thumbnail}" width="132px" height="132px"alt=""></a>
                                                                </c:if>
                                                                <c:if test="${empty travelReview.thumbnail}">
                                                                <a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');"><img src="/resources/images/intro/default-img.png" width="132px" height="132px"alt=""></a>
                                                                </c:if>
                                                                </dt>
                                                                <dd id="photo-title">
                                                                    <div>
                                                                        <a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">
                                                                            ${travelReview.boardTitle}
                                                                        </a>
                                                                    </div>
                                                                    <c:if test="${0 != travelReview.commentCount}">
                                                                        <a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');""><span id="commentCount1">[${travelReview.commentCount}]</span></a>
                                                                    </c:if>
                                                                </dd>
                                                                <dd id="photo-nick">
                                                                    <div>
                                                                        <a href="/member/login" onclick="return confirm('로그인 후 서비스 이용 가능하십니다.\n로그인 페이지로 이동 하시겠습니까?');">
                                                                            ${travelReview.memberNickname}
                                                                        </a>
                                                                    </div>
                                                                </dd>
                                                                <dd id="photo-date">
                                                                    <span>
                                                                        22.01.10
                                                                    </span>
                                                                    <span>
                                                                        ㆍ조회 ${travelReview.readCount}
                                                                    </span>
                                                                </dd>
                                                            </dl>
                                                        </li>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </div>
                            </div>
                        </div>
                    </c:when>
                </c:choose>

                <%-- 로그인함 --%>
                <c:choose>
                    <c:when test="${!empty sessionScope.loginMember}">
                        <div id="intro2">
                            <div id="intro-content">
                                <!-- <div id="content1"> -->
                                    <!-- 메인화면 전체글보기 -->
                                    <div id="intro-board">
                                        <div id="intro-board-tit-box">
                                            <div id="intro-board-tit">
                                                <h3>전체글보기</h3><span><a href="board/selectAll">더보기 ></a></span>
                                            </div>
                                        </div>
                                        <table id="intro-board-list">
                                            <tbody id="tbody">
                                                <!-- 공지글 -->
                                                <c:choose>
                                                    <c:when test="${empty noticeList.introNoticeList}">
                                                        안돼
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="introNotice" items="${noticeList.introNoticeList}">
                                                            <tr id="intro-notice-list">
                                                            <td id="board-content">
                                                                <div id="notice-tag-block">
                                                                    <div id="notice-tag">
                                                                        <strong>공지</strong>
                                                                    </div>
                                                                </div>
                                                                <div id="notice-board">
                                                                    <a href="/board/${introNotice.boardCode}/${introNotice.boardNo}"><span id="notice">${introNotice.boardTitle}</span></a>
                                                                    <c:if test="${0 != introNotice.commentCount}">
                                                                        <a href="#"><span id="commentCount1">[${introNotice.commentCount}]</span></a>
                                                                    </c:if>
                                                                </div>
                                                            </td>
                                                            <td id="board-view">
                                                                ${introNotice.readCount}
                                                            </td>
                                                        </tr>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                                <!-- 게시글 -->
                                                <c:choose>
                                                    <c:when test="${empty boardList.introBoardList}">
                                                        <div>안돼</div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="introBoard" items="${boardList.introBoardList}">
                                                            <tr id="boardTitle">
                                                                <td id="board-content">
                                                                    <div id="board-dot">ㆍ</div>
                                                                    <a href="/board/${introBoard.boardCode}/${introBoard.boardNo}"><div id="board-name">${introBoard.boardTitle}</div></a>
                                                                    <c:if test="${0 != introBoard.commentCount}">
                                                                        <a href="/board/${introBoard.boardCode}/${introBoard.boardNo}"><span id="commentCount1">[${introBoard.commentCount}]</span></a>
                                                                    </c:if>
                                                                </td>
                                                                <td id="board-view">
                                                                    ${introBoard.readCount}
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                    <div id="intro-album">
                                        <div id="intro-board-tit-box">
                                            <div id="intro-board-tit">
                                                <h3>여행 후기</h3><span><a href="/board/12">더보기 ></a></span>
                                            </div>
                                        </div>
                                        <ul id="album-content">
                                            <c:choose>
                                                <c:when test="${empty travelReviewList.introTravelReviewList}">
                                                    안된단다
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="travelReview" items="${travelReviewList.introTravelReviewList}">
                                                        <li id="album">
                                                            <dl>
                                                                <dt id="photo-img">
                                                                <c:if test="${not empty travelReview.thumbnail}">  
                                                                <a href="/board/${travelReview.boardCode}/${travelReview.boardNo}"><img src="${travelReview.thumbnail}" width="132px" height="132px"alt=""></a>
                                                                </c:if>
                                                                <c:if test="${empty travelReview.thumbnail}">
                                                                <a href="/board/${travelReview.boardCode}/${travelReview.boardNo}"><img src="/resources/images/intro/default-img.png" width="132px" height="132px"alt=""></a>
                                                                </c:if>
                                                                </dt>
                                                                <dd id="photo-title">
                                                                    <div>
                                                                        <a href="/board/${travelReview.boardCode}/${travelReview.boardNo}">
                                                                            ${travelReview.boardTitle}
                                                                        </a>
                                                                    </div>
                                                                    <c:if test="${0 != travelReview.commentCount}">
                                                                        <a href="/board/${travelReview.boardCode}/${travelReview.boardNo}"><span id="commentCount1">[${travelReview.commentCount}]</span></a>
                                                                    </c:if>
                                                                </dd>
                                                                <dd id="photo-nick">
                                                                    <div>
                                                                        <a href="/member/${travelReview.memberNo}">
                                                                            ${travelReview.memberNickname}
                                                                        </a>
                                                                    </div>
                                                                </dd>
                                                                <dd id="photo-date">
                                                                    <span>
                                                                        22.01.10
                                                                    </span>
                                                                    <span>
                                                                        ㆍ조회 ${travelReview.readCount}
                                                                    </span>
                                                                </dd>
                                                            </dl>
                                                        </li>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </div>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
            </section>
</body>
</html>