<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="/resources/css/member/myPage.css">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
    <!-- header.jsp -->
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!-- main content 틀 -->
    <section id="flex">
        <!-- sideMenu.jsp -->
        <jsp:include page="/WEB-INF/views/intro/sideMenu.jsp"/>
        <div id="mainArea">

            <!-- myPage-header -->
            <jsp:include page="/WEB-INF/views/member/myPageHeader.jsp"/>

            <section class="myPage-main">

                <form action="pwConfirm" method="POST" name="pwConfirmForm">

                    <div class="myInfoArea">
                        <div class="myPage-subTitle"><label name="memberPw">비밀번호 확인</label></div>
                        
                        <span class="myPage-script">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 한 번 더 확인합니다.</span>

                        <div class="myPage-subTitle">
                            <label>현재 비밀번호</label>
                            <input type="password" name="memberPw" id="currentPw" maxlength="20"  autocomplete="off">
                        </div>
                        <span class="myPage-script" id="currentPwMessage">비밀번호를 입력해주세요.</span>

                        <div class="myPage-btn-area">
                            <button class="myPage-update-btn" type="reset">취소</button>
                            <button class="myPage-update-btn">확인</button>
                        </div>
                    </div> 
                </form>
            </section>
        </div>
    </section>
        
    <%-- footer.jsp --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/member/myPagePwConfirm.js"></script>
    <script src="/resources/js/main/main.js"></script>
</body>
</html>