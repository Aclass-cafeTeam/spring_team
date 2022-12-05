<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="comment-area">
    <!-- 댓글 목록 -->
    <div class="comment-list-area">
        
        <ul id="comment-list">

            <c:forEach var="comment" items="${board.commentList}">
                <c:if test="${comment.commentDeleteFlag == 'Y'}">
                        <li class="comment-row <c:if test="${comment.parentNo != 0 }"> child-comment </c:if>">
                            <p>삭제된 댓글입니다.</p>
                            <span class="comment-date">(${comment.commentDeleteDate})</span>
                        </li>
                </c:if>
                <c:if test="${comment.commentDeleteFlag == 'M'}">
                        <li class="comment-row <c:if test="${comment.parentNo != 0 }"> child-comment </c:if>">
                            <p>카페 스탭에 의해 삭제된 댓글입니다.</p>
                            <span class="comment-date">(${comment.commentDeleteDate})</span>
                        </li>
                </c:if>

                <c:if test="${comment.commentDeleteFlag == 'N'}">
                <li class="comment-row  <c:if test="${comment.parentNo != 0 }"> child-comment </c:if>">
                    <p class="comment-writer">

                        <!-- 프로필 이미지가 없을 경우 -->
                        <c:if test="${empty comment.profileImage}">
                            <img src="/resources/images/main/프로필.PNG">
                        </c:if>
                        <!-- 프로필 이미지가 있을 경우 -->
                        <c:if test="${!empty comment.profileImage}">
                            <img src="${comment.profileImage}">
                        </c:if>

                        <span>${comment.memberNickname}</span>
                        <span class="comment-date">(${comment.commentCreateDate})</span>
                    </p>
                    
                    <p class="comment-content">${comment.commentContent}</p>

                    <%-- 로그인 상태일 경우에 답글 버튼 노출 --%>
                    <c:if test="${!empty loginMember}">
                        <div class="comment-btn-area">
                            <%-- this == 클릭된 답글 버튼 --%>
                            <button onclick="showInsertComment(${comment.commentNo}, this)">답글</button>   

                        <%-- 로그인회원 == 댓글 작성자가 같으면 수정 버튼 노출 --%>
                        <c:if test="${loginMember.memberNo == comment.memberNo}">
                                <button onclick="showUpdateComment(${comment.commentNo}, this)">수정</button>
                                <%-- 로그인회원의 권한이 스탭이거나 로그인회원 == 댓글작성자가 같으면 삭제 버튼 노출 --%>
                            <c:if test="${(loginMember.authorityNo==0 ||loginMember.authorityNo==1) || loginMember.memberNo == comment.memberNo}">
                                    <button onclick="deleteComment(${comment.commentNo})">삭제</button>
                            </c:if>
                        </c:if>
                        </div>
                    </c:if>

                </li>
                </c:if>
            </c:forEach>
            
        </ul>
    </div>
    

    <!-- 댓글 작성 부분 -->
    <div class="comment-write-area">
        <textarea id="commentContent"></textarea>
        <button id="addComment">
            댓글<br>
            등록
        </button>

    </div>

</div>