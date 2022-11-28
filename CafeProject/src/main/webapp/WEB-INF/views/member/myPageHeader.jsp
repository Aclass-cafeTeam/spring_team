<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPage-header</title>
    <link rel="stylesheet" href="/resources/css/member/myPage.css">
</head>
<body>
            <!-- 마이페이지 상단 기본정보-->
            <div id="subProfile">
                <div id="profileImgBox">
                    <c:if test="${empty loginMember.profileImage}">    
                        <img id="profileImg" src="/resources/images/member/프로필.PNG">
                    </c:if> 

                    <c:if test="${not empty loginMember.profileImage}">    
                        <img id="profileImg" src="${loginMember.profileImage}">
                    </c:if> 
                    <a href="/member/myPage/profile"><img id="setting-icon" src="/resources/images/프로필 변경.PNG"></a></div>
                <div class="profileInfo">
                    <div class="nickArea">${loginMember.memberNickname}</div>
                    <div class="infoArea">
                        <span class="cafeGrade">
                            <c:choose>
                                <c:when test="${(loginMember.authorityNo eq 0) or (loginMember.authorityNo eq 1)}">
                                ${loginMember.authorityName}   <img id="levelImage" src="${loginMember.authorityImage}" alt="authorityImage" > 
                                </c:when>
                                <c:otherwise>
                                ${loginMember.memberLevelName} <img id="levelImage" src="${loginMember.memberLevelImage}" alt="memberLevelImage">
                                </c:otherwise>
                            </c:choose></span>
                        <div id="countArea">
                            <span class="count">방문 <Strong class="num">${loginMember.logHistoryCount}</Strong></span>
                            <span class="count">작성글 <Strong class="num">${loginMember.memberBoardCount}</Strong></span>
                            <span class="count">작성 댓글 <Strong class="num">${loginMember.memberCommentCount}</Strong></span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 마이페이지 nav -->
            <div id="navArea">
                <div class="navMenu">
                    <a href="/member/myPage/profile">프로필</a>
                    <a href="/member/myPage/info">회원 정보</a>
                    <a href="/member/myPage/ChangePw">비밀번호 변경</a>
                    <a href="/member/myPage/myBoard">작성글</a>
                    <a href="/member/myPage/myCommentBoard">댓글단 글</a>
                    <a href="/member/myPage/myLikeBoard">좋아요한 글</a>
                    <a href="/member/myPage/myDeleteBoard">삭제한 글</a>
                    <a href="/member/myPage/secession" id="secessionMenu">회원 탈퇴</a>
                </div>
            </div> 
    <script src="/resources/js/member/myPage.js"></script>
</body>
</html>