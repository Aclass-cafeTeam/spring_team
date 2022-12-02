<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-wrapper">
    <div class="modal-header">
        <strong class="modal-title">이 카페 임시글 2 </strong>
        <div id="btn-close"><i class="fa-solid fa-xmark"></i></div>
        <!-- x 버튼 &times;-->
    </div>
    <div class="temp-content">
        <div class="temp-content-area">
            <div class="temp-content-top">
                <p class="temp-notice">임시등록 글은 60일 동안 최대 300개까지 저장됩니다.</p>
                <button type="button" class="all-del-btn"><span>전체삭제</span></button>
            </div>

            <div class="temp-list">
                <ul>
                    <li class="temp-item">
                        <a href="#" class="temp-link">
                            <strong class="temp-item-title">임시저장제목</strong>
                        </a>
                        <div class="temp-item-tool">
                            <span class="temp-time">2022.11.07. 02:39</span>
                            <button type="button" class="btn-temp-del"><i class="fa-regular fa-trash-can"></i></button>
                        </div>
                    </li>
                    <li class="temp-item">
                        <a href="#" class="temp-link">
                            <strong class="temp-item-title">임시저장제목2</strong>
                        </a>
                        <div class="temp-item-tool">
                            <span class="temp-time">2022.11.07. 02:39</span>
                            <button type="button" class="btn-temp-del"><i class="fa-regular fa-trash-can"></i></button>
                        </div>
                    </li>
                    
                </ul>
            </div>

        </div>
    </div>


</div>