<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/resources/css/member/login.css">
    
    <link rel="shortcut icon" href="../resources/images/free-icon-train.png" type="image/x-icon">
    <a href="https://www.flaticon.com/kr/free-icons/" title="기차 아이콘" id="free-icon-train">기차 아이콘 제작자: Shahid-Mehmood -
     Flaticon</a>

    <!-- fontawesome 아이콘 -->
    <script src="https://kit.fontawesome.com/e4f69a07ca.js" crossorigin="anonymous"></script>
    
    <style>
        #free-icon-train {
            display: none;
            opacity: 0;
            visibility: hidden;
        }
    </style>

</head>
<body>
    <main>
        <header class="header">
            <div class="header-inner">
                
                <a href="#" target="_blank">
                    <img src="/resources/images/NEVER_logo.png" alt="logo" id="logo">
                </a>
                
                <!-- <select class="lang-switch">
                    <option value="KR">한국어</option>
                    <option value="US">English</option>
                    <option value="CN">中文(简体)</option>
                    <option value="TW">中文(台灣)</option>
                </select> -->
            </div>
        </header>
        
        
    
        <!-- content onsubmit="return loginValidate()"-->
        <section class="login-content">
            <form action="/member/login" method="post">
                <div class="login-frm">
                    <div class="id-pw-wrap">
                        <div class="id-pw-row">
                            <div class="icon"><i class="fa-solid fa-user"></i></div>
                            <input type="text" id="memberEmail" name="memberEmail" placeholder="아이디(이메일)" maxlength="30" autocomplete="off" value="${cookie.saveId.value}">
                        </div>

                        <div class="id-pw-row">
                            <div class="icon"><i class="fa-solid fa-lock"></i></div>
                            <input type="password" id="memberPw" name="memberPw" placeholder="비밀번호"  maxlength="20" >
                        </div>
                        
                    </div>
                    
                    <%-- 쿠키에 saveId가 있는 경우 변수 생성--%>
                    <c:if test="${!empty cookie.saveId.value}">
                        <c:set var="temp" value="checked"/>
                    </c:if>
                    
                    <div class="saveId-area">
                        <label for="saveId">
                            <input type="checkbox" name="saveId" id="saveId" ${temp} }>
                            <label for="saveId"> <i class="fas fa-check"></i>로그인 상태 유지</label>
                        </label>
                    </div>

                    <div class="login-message-area">
                        <p id="loginMessage"></p>
                    </div>
                    
                    <div>
                        <button class="login-btn">로그인</button>
                    </div>
                </div>
            </form>
        
            <p class="find-area">
                <a href="#">ID/PW찾기</a>
                <span> | </span>
                <a href="/signUp.html">회원가입</a>
            </p>
        </section>
    </main>
    

    <footer class="login-footer">
        <p> 
            <a href="/main.html" target="_blank"><img src="/resources/images/NEVER_logo.png" width="70px" height="15px" alt="logo"></a> Copyright<strong> &copy;NEVER Corp.</strong> All Rights Reserved.
            <!-- &copy;  저작권 마크 -->
        </p>
    </footer>
        

    <c:if test="${!empty message}">
        <script>
            alert("${message}")
        </script>

        <%-- message 1회 출력 후 session scope에서 삭제 --%>
        <c:remove var="message" ></c:remove>
    </c:if>
    
    <script src="/resources/js/member/login.js"></script>        

</body>
</html>