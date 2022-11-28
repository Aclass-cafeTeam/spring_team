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
            <jsp:include page="/WEB-INF/views/member/myPageHeader.jsp"/>

            
            <!-- 마이페이지 내정보 -->
            <!-- 
            변경가능 - 닉네임 , 비밀번호, 지역
            변경 불가 - 아이디(이메일)
            -->
            <section class="myPage-main">

                <form action="#" method="POST" name="myPage-form">

                    <div class="myInfoArea">
                        <div class="myPage-subTitle"><label>내 정보</label></div>
                        
                        <span class="myPage-script">정보 변경 후 수정 버튼을 누르세요.</span>

                        <div class="myPage-subTitle">
                            <label>아이디(이메일)</label>
                            <span>${loginMember.memberEmail}</span>
                        </div>
                        <div class="myPage-subTitle">
                            <label>닉네임</label>
                            <!-- maxlength 확인할 것 -->
                            <input type="text" name="memberNickname" id="memberNickname" maxlength="10" placeholder="${loginMember.memberNickname}">
                            <button class="myPage-check-btn">중복 확인</button>  
                        </div>
                        <span class="myPage-script">한글 1~10자, 영문 대소문자 2~20자, 숫자를 사용할 수 있습니다.(혼용가능) </span>
                        <span class="myPage-script"> 중복되지 않은 별명으로 변경해주세요. </span>

                        <%-- <div class="myPage-subTitle">
                            <label>현재 비밀번호</label>
                            <input type="password" name="memberPw" id="memberPw" maxlength="30">
                            <button class="myPage-check-btn">확인</button>  
                        </div>
                        <span class="myPage-script">현재 비밀번호를 입력해주세요.</span> --%>

                        <!-- 각 비밀번호 id DB확인 후 수정 -->
                        <%-- <div class="myPage-subTitle">
                            <label>새 비밀번호</label>
                            <input type="password" name="memberPw" id="#" maxlength="30">  
                        </div>
                        <div class="myPage-subTitle">
                            <label>새 비밀번호 확인</label>
                            <input type="password" name="memberPw" id="#" maxlength="30">
                            <button class="myPage-check-btn">확인</button>
                        </div> --%>
                        <div class="myPage-subTitle">
                            <label for="residence">지역(선택사항)</label>
                            <div class="select">
                                <select name="memberResidence" id="residence">
                                    <option selected disabled>시/도 선택</option>
                                    <option value="서울">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="인천">인천</option>
                                    <option value="부산">부산</option>
                                    <option value="대구">대구</option>
                                    <option value="대전">대전</option>
                                    <option value="광주">광주</option>
                                    <option value="울산">울산</option>
                                    <option value="세종">세종</option>
                                    <option value="강원">강원</option>
                                    <option value="충북">충북</option>
                                    <option value="전북">전북</option>
                                    <option value="전남">전남</option>
                                    <option value="경북">경북</option>
                                    <option value="경남">경남</option>
                                    <option value="제주">제주</option>
                                    <option value="기타(해외)">기타(해외)</option>
                                </select>
                            </div>
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

    <%-- jQuery 라이브러리 추가 --%>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/member/myPage.js"></script>
    <script src="/resources/js/main/main.js"></script>
</body>
</html>