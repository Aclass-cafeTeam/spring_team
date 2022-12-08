<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본인확인</title>
    <link rel="stylesheet" href="/resources/css/authEmail.css">
    <!-- fontawesome 아이콘 -->
    <script src="https://kit.fontawesome.com/e4f69a07ca.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="jumbotron">
            <h2> 임시 비밀번호가 전송되었습니다. </h2><br/>
                    
                <h1>${member}</h1><br/>
                <h2>를 확인해주세요.</h2>
            <button type="button" class="btn btn-primary" onclick="location.href='/member/login'">로그인페이지</button>
            <button type="button" class="btn btn-primary" onclick="location.href='/'">메인페이지</button>
        </div>
    </div>
</body>
</html>