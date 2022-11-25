<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 이미지 수정</title>
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
            
            <!-- 프로필 이미지 수정 -->
            <section class="myPage-main">
                    <div class="myPage-subTitle"><label>프로필 변경</label></div>
                        
                    <span class="myPage-script">이미지 선택 후 변경하기 버튼을 누르세요.</span>
                        <form action="updateProfile" method="POST" name="myPage-form"
                        enctype="multipart/form-data" onsubmit = "return profileValidate()">
                            <div class="profile-image-area">                            
                                <c:if test="${empty loginMember.profileImage}">    
                                    <img id="profile-image" class="profileImg" src="/resources/images/member/프로필.PNG">
                                </c:if> 

                                <c:if test="${not empty loginMember.profileImage}">    
                                    <img id="profile-image" class="profileImg" src="${loginMember.profileImage}">
                                </c:if> 
                                <span id="delete-image">&times;</span>
                            </div>

                            <div class="profile-btn-area">
                                <label for="input-image">이미지 선택</label>
                                <input type="file" name="profileImage" id="input-image" accept="image/*">
                                <button class="myPage-update-btn" type="submit">변경하기</button>
                            </div>
                        </form>
            </section>
        </div> 
    </section>
    <%-- footer.jsp --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/main/main.js"></script>
    <script src="/resources/js/member/myPage.js"></script>
</body>
</html>