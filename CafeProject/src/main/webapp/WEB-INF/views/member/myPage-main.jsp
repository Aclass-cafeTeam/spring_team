<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
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
            <jsp:include page="/WEB-INF/views/member/myPage-header.jsp"/>

            
            <!-- 마이페이지 내정보 -->
            <!-- 
            변경가능 - 닉네임 , 비밀번호, 지역, 프로필 이미지
            변경 불가 - 아이디(이메일)
            -->

                <!-- 프로필 이미지
                아이디(이메일)
                비밀번호
                비밀번호 변경
                닉네임 변경
                지역 -->
            <section class="myPage-main">

                <form action="#" method="POST" name="myPage-form">

                    <div class="myInfoArea">
                        <div class="myPage-subTitle"><label>내 정보</label></div>
                        
                        <span class="myPage-script">정보 변경 후 수정 버튼을 누르세요.</span>

                        <!-- 프로필 이미지 변경 추가해야함 -->

                        <div class="myPage-subTitle">
                            <label>아이디(이메일)</label>
                            <span>sample@cafe.team</span>
                        </div>
                        <div class="myPage-subTitle">
                            <label>닉네임</label>
                            <!-- maxlength 확인할 것 -->
                            <input type="text" name="memberNickname" id="memberNickname" maxlength="10" placeholder="지금닉네임">
                            <button class="myPage-check-btn">중복 확인</button>  
                        </div>
                        <span class="myPage-script">한글 1~10자, 영문 대소문자 2~20자, 숫자를 사용할 수 있습니다.(혼용가능) </span>
                        <span class="myPage-script"> 중복되지 않은 별명으로 변경해주세요. </span>

                        <div class="myPage-subTitle">
                            <label>현재 비밀번호</label>
                            <input type="password" name="memberPw" id="memberPw" maxlength="30">
                            <button class="myPage-check-btn">확인</button>  
                        </div>
                        <span class="myPage-script">현재 비밀번호를 입력해주세요.</span>

                        <!-- 각 비밀번호 id DB확인 후 수정 -->
                        <div class="myPage-subTitle">
                            <label>새 비밀번호</label>
                            <input type="password" name="memberPw" id="#" maxlength="30">  
                        </div>
                        <div class="myPage-subTitle">
                            <label>새 비밀번호 확인</label>
                            <input type="password" name="memberPw" id="#" maxlength="30">
                            <button class="myPage-check-btn">확인</button>
                        </div>
                        <div class="myPage-subTitle">
                            <label>거주 지역</label>
                            <!-- 회원가입 페이지와 비교후 수정/추가 예정 -->
                            <select name="address" id="address">
                                <option value="">거주 지역을 선택하세요</option>
                                <option value="seoul">서울</option>
                            </select>  
                        </div>
                        <div class="myPage-btn-area">
                            <button class="myPage-update-btn" type="reset">취소</button>
                            <button class="myPage-update-btn">수정</button>
                        </div>

                    </div> 

                </form>

            </section>

        </div>
    </section>
        
    <%-- footer.jsp --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/member/myPage.js"></script>
</body>
</html>