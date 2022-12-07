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

                <form action="changePw" method="POST" name="changePwForm">

                    <div class="myInfoArea">
                        <div class="myPage-subTitle"><label>비밀번호 변경</label></div>
                        
                        <span class="myPage-script">새 비밀번호를 입력한 후 수정 버튼을 누르세요.</span>
                        <div class="myPage-input-area">
                            <label>새 비밀번호</label>
                            <input type="password" name="newPw" id="newPw" maxlength="20" autocomplete="off">
                        </div>
                        <span id="pwMessage"></span>

                        <div class="myPage-input-area">
                            <label>새 비밀번호 확인</label>
                            <input type="password" name="newPwConfirm" id="newPwConfirm" maxlength="20" autocomplete="off">
                        </div>
                        <span id="pwConfirm"></span>

                        <div class="myPage-btn-area">
                            <button class="myPage-update-btn" type="reset">취소</button>
                            <button class="myPage-update-btn" onclick="return myPageChangePwValidate()">수정</button>
                        </div>
                    </div> 
                </form>
            </section>
        </div>
    </section>
        
    <%-- footer.jsp --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/member/myPageChangePw.js"></script>
    <script src="/resources/js/main/main.js"></script>
</body>
</html>