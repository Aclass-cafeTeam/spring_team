<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- **************************************푸터************************************** -->
    <footer class="footer">

        <h2 class="cafe_name">세미프로젝트 - 내일로, 기차로!</h2>
        <span class="cafe_nbsp">|</span>
        <a href="#" class="cafe_link">https://cafe.never.com/hkct
        </a>
        <h2>
            <a href="#" class="never_cafe">
                <span class="blind">NEVER 카페</span>
            </a>
        </h2>

    </footer>

    <%-- session scope 내에 message속성이 존재하는 경우
    alert(JS)기능을 이용해서 내용 출력 --%>
    <c:if test="${!empty message}">
        <script> 
            alert("${message}");
        </script> 
        <c:remove var="message" />
    </c:if>
     <!-- **************************************푸터************************************** -->