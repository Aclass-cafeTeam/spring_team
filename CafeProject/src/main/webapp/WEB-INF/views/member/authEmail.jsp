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

    <fieldset>
        <p><strong>본인확인 이메일로 인증</strong></p>
        <p>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</p>

        <table>
            <tr>
                <th>이름</th>
                <td><input type="text"></td>
            </tr>
            
            <tr>
                <th>이메일 주소</th>
                <td><input type="text"></td>
                <td><button>인증번호 받기</button></td>
            </tr>

            <tr>
                <td colspan="3"><input type="text" placeholder="인증번호 6자리 숫자 입력"></td>
            </tr>
        </table>
    </fieldset>

    <!-- 인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요. -->
    
</body>
</html>