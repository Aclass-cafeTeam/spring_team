<footer>
  <p class="cr">
      <em>Since 2022.10.14. © </em> 
      <span> 내일로, 기차로! 카페</span>
  </p>
  <c:if test="${not empty message}">
    <c:if test='${message.length.trim() != 0}'>
      <script>
        alert("${message}");
      </script>
    </c:if>

    <%-- message 1회 출력 후 모든 scope 삭제 --%>
    <c:remove var="message" />
  </c:if>
</footer>