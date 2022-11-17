<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 탈퇴</title>
    <link rel="stylesheet" href="../../resources/css/member/myPage.css">
</head>
<body>
    <!-- header.jsp -->
		헤더
    <!-- sideMenu.jsp -->
		사이드메뉴
    <!-- main content 틀 -->
    <div id="mainArea">

        <!-- myPage-header -->
        <jsp:include page="/WEB-INF/views/member/myPage-header.jsp"/>

        <!-- 회원 탈퇴 -->
        <section class="myPage-main">

            <form action="#" method="POST" name="myPage-form"  onsubmit="return secessionValidate()">

                <div class="secessionArea">
                    <div class="myPage-subTitle"><label> 회원 탈퇴 안내</label></div>
                    
                    <span class="myPage-script">회원 탈퇴전 다음 사항을 숙지하시기 바랍니다.</span>

                    <div class="myPage-subTitle">
                        <label>유의 사항</label>
                    </div>
                    <div id="secession-terms">
                        <br>
                        1. 회원 탈퇴시 고객님의 개인 정보는 관련 법률에 의거한 개인 정보 보호정책에 따라 관리/파기됩니다.
                        <br><br>
                        2. 회원 탈퇴시 작성된 게시글 및 댓글은 자동으로 삭제되지 않습니다.
                        
                    </div>
                    <div>
                        <input type="checkbox" name="agree" id="agree">
                        <label for="agree">위 유의사항을 확인했습니다.</label>
                    </div>
                    
                    <div class="myPage-subTitle">
                        <label>비밀번호</label>
                        <input type="password" name="memberPw" id="memberPw" maxlength="30">   
                        
                    </div>
                    <span class="myPage-script">본인 여부를 확인하기 위해서 비밀번호를 입력해주세요.</span>

                    <div class="myPage-btn-area">
                        <button class="myPage-update-btn" type="reset">취소</button>
                        <button class="myPage-update-btn">탈퇴</button>
                    </div>

                </div> 

            </form>

        </section>
    </div> 
    
    <%-- footer.jsp --%>
    푸터
    <%-- session scope에 message 속성이 존재하는 경우
        alert 창을 이용해서 내용을 출력    --%>

    <c:if test="${not empty message}">
        <script>
            alert("${message}");
        </script>

        <%-- message 1회 출력 후 모든 scope 삭제 --%>
        <c:remove var="message"/>
    </c:if>

    <script src="../../resources/js/member/myPage.js"></script>
</body>
</html>