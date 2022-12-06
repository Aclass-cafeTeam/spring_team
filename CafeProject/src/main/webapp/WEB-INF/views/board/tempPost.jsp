<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-wrapper">
    <div class="modal-header">
        <strong class="modal-title">이 카페 임시글 ${tPost[0].tempCount}</strong>
        <div id="btn-close"><i class="fa-solid fa-xmark"></i></div>
        <!-- x 버튼 &times;-->
    </div>
    <div class="temp-content">
        <div class="temp-content-area">
            <div class="temp-content-top">
                <p class="temp-notice">임시등록 글은 60일 동안 최대 300개까지 저장됩니다.</p>
                <button type="button" class="all-del-btn"><span>전체삭제</span></button>
            </div>

            <c:forEach items="${tPost}" var="tPost">  
            <div class="temp-list-area">
            <ul id="temp-list">
                <li class="temp-item">
                    <a href="/board/${tPost.boardCode}/${tPost.boardNo}/update" class="temp-link">
                        <strong class="temp-item-title">${tPost.boardTitle}</strong>
                    </a>
                    <div class="temp-item-tool">
                        <span class="temp-time">${tPost.boardCreateDate}</span>
                        <input type="hidden" id="boardNo" name="boardNo" value="${tPost.boardNo}">
                        <input type="hidden" id="boardCode" name="boardCode" value="${tPost.boardCode}">
                        <button type="button" class="btn-temp-del"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                </li>
            </ul>
            </div>
            </c:forEach>
        </div>
    </div>


</div>