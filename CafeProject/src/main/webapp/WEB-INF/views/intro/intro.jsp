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
                                            <img src="../resources/images/배너1.png">
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
                <div id="intro2">
                    <div id="intro-content">
                        <!-- <div id="content1"> -->
                            <!-- 메인화면 전체글보기 -->
                            <div id="intro-board">
                                <div id="intro-board-tit-box">
                                    <div id="intro-board-tit">
                                        <h3>전체글보기</h3><span><a href="#">더보기 ></a></span>
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
                                                            <a href="#"><span id="notice">${introNotice.boardTitle}</span></a>
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
                                                            <a href="#"><div id="board-name">${introBoard.boardTitle}</div></a>
                                                            <c:if test="${0 != introBoard.commentCount}">
                                                                <a href="#"><span id="commentCount1">[${introBoard.commentCount}]</span></a>
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
                                        <h3>여행 후기</h3><span><a href="#">더보기 ></a></span>
                                    </div>
                                </div>
                                <ul id="album-content">
                                    <c:choose>
                                        <c:when test="${empty travelReviewList.introTravelReviewList}">
                                            안된단다
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="travelReview" items="${travelReviewList.introTravelReviewList}">
                                                <li>
                                                    <dl>
                                                        <dt id="photo-img">
                                                        <a href="#"><img src="../resources/images/고양아.jpg" width="132px" height="132px"alt=""></a>
                                                        </dt>
                                                        <dd id="photo-title">
                                                            <div>
                                                                <a href="#">
                                                                    ${travelReview.boardTitle}
                                                                </a>
                                                            </div>
                                                        </dd>
                                                        <dd id="photo-nick">
                                                            <div>
                                                                <a href="#">
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
            </section>
</body>
</html>