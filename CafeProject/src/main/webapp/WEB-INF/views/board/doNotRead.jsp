<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sorry...</title>

    <link rel="stylesheet" href="/resources/css/board/boardDetail.css">
</head>
<body>
    <div id="mainArea">
        <div class="user-level">
            <span><strong>${boardInfo.boardName}</strong> 게시판은</span>
            <span class="user-level-name">${boardInfo.memberLevelName}</span>
            <span>등급이 되시면 게시글 읽기가 가능한 게시판 입니다.</span>
            <p class="user-level-txt"> 현재 <strong>${loginMember.memberNickname}</strong>님은 <span class="g">${loginMember.memberLevelName}</span> 등급이시며, 등업에 관련된 궁금하신 사항은 카페 매니저나 멤버관리 스탭에게 문의해 주세요.</p>
            <div>
                <ul class="info-list">
                    <li class="info">내 활동정보</li>
                    <li>총 게시글 <strong>${loginMember.memberBoardCount}</strong>개</li>
                    <li>댓글 수 <strong>${loginMember.memberCommentCount}</strong>개</li>
                    <li>방문 수 <strong>${loginMember.logHistoryCount}</strong>회</li>
                    <li>가입일 ${loginMember.enrollDate}</li>
                </ul>
            </div>
            <div>
                <br>
                <br>
                <a class="view-detail" href="/cafe/memberLevel" onclick="window.open(this.href, '_blank', 'width=800, height=500 top=300, left=600'); return false;">자세히보기</a>
                <a onclick="location.href='${referer}'" class="view-detail">뒤로가기</a>
            </div>
        </div>
    </div>
</body>
</html>
