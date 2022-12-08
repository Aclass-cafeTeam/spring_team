<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="/resources/css/member/findPw.css">
    
    <!-- fontawesome 아이콘 -->
    <script src="https://kit.fontawesome.com/e4f69a07ca.js" crossorigin="anonymous"></script>

</head>
<body>
    <main>
        <header class="header">
            <div class="header-inner">
                
                <a href="/" target="_blank">
                    <img src="/resources/images/NEVER_logo.png" alt="logo" id="logo">
                </a>
                
                <div><strong>비밀번호를 찾고자하는 아이디를 입력해주세요.</strong></div>
            </div>
        </header>
        
        
        <section class="find-content">
            <form action="/authEmail" method="POST" onsubmit="return findValidate()">
                <div class="find-frm">
                    <div class="find-wrap">
                        <div class="find-row">
                            <div class="icon"><i class="fa-solid fa-user"></i></div>
                            <input type="text" id="memberEmail" placeholder="아이디(이메일)" maxlength="30" autocomplete="off">
                        </div>
                    </div>
                    
                    <div class="message-area">
                        <p id="fMessage"></p>
                    </div>
                    
                    <div>
                        <button class="find-btn">비밀번호 찾기</button>
                    </div>
                </div>
            </form>
        
        </section>
    </main>
    
    <footer class="find-footer">
        <p class="backMain">
            <a href="/member/login"><div>로그인 화면으로 돌아가기</div></a>
        </p>
    </footer>

    <script src="/resources/js/member/findPw.js"></script>        

</body>
</html>