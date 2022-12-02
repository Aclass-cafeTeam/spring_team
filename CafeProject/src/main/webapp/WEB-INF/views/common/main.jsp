<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta property="og:title" content="내일로 기차 여행 카페">
    <meta property="og:description" content="내일로 여행 가고 싶은 사람들 모여라!"> -->
    <title>바이트레인</title>
    <link rel="stylesheet" href="/resources/css/main.css">

</head>

<body>

    <main>
        <!-- **************************************헤더************************************** -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />


        <!-- **************************************카페 사이드!!!!!!!!!!!!!!!!!!!!!!!!************************************** -->

        <section id="flex">
            <jsp:include page="/WEB-INF/views/intro/sideMenu.jsp"/>
            <jsp:include page="/WEB-INF/views/intro/intro.jsp"/>
        </section>

        <!-- **************************************카페 사이드!!!!!!!!!!!!!!!!!!!!!!!!************************************** -->


    </main>

    <!-- **************************************푸터************************************** -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="/resources/js/main/main.js"></script>
    
</body>

</html>