<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카페 글쓰기</title>
    
    <!-- summernote include libraries(jQuery, bootstrap)-->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <script src="/resources/js/summernote/summernote-lite.js"></script>
	<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
    
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/board/writingBoard.css">
    
    <!-- fontawesome 아이콘 -->
    <script src="https://kit.fontawesome.com/e4f69a07ca.js" crossorigin="anonymous"></script>
		
		
</head>
<body>
    <!-- main header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    
    <div class="writing-board">
        
        <form action="/board/write" method="POST" enctype="multipart/form-data" class="board-write" id="boardWriteForm" onsubmit ="return writeValidate()">  

            <div class="writingHeader">
                <h1 id="HeaderTitle">카페 글쓰기</h1>
                
                <div class="toolArea">
                    <p class="tempSave">
                        <button type="button" id="btn-tempSave">임시등록</button>
                        <!-- 임시등록 버튼 누르면 임시저장 -->
                        <button type="button" id="btn-tempCount">0</button>
                        <!-- 수를 누르면 임시등록 모달창으로 이동 -->
                    </p>
                    <button type="submit" id="btn-submit">등록</button>
                </div>
            </div>

            <div class="writingContent">
                
                <!-- writingContent 좌(글 작성 영역) -->
                <div class="writingArea">

                        <div class="writingRow">
                            <!-- 게시판 타입 -->
                            <div class="board-type wrapper"> 
                                <div class="select"> 
                                    <span class="btn-text"> 게시판을 선택하세요.</span>
                                    <span class="arrow-dwn"> <i class="fa-solid fa-chevron-down"></i></span>
                                </div>
                                
                                <ul class="option-items"> 
                                    <c:forEach var="boardType" items="${boardTypeList}">
                                        <li class="option option-text" id="${boardType.BOARD_CODE}" onclick="selectType(this)">
                                            ${boardType.BOARD_NAME}
                                        </li>
                                    </c:forEach>
                                </ul> <input type="hidden" id="boardCode" name="boardCode" value="">${boardType.BOARD_CODE}
                            </div>
                        
                            
                            <!-- 말머리 -->    
                            <div class="title-tag wrapper"> 
                                <div class="select"> 
                                    <span class="btn-text"> 말머리 선택</span>
                                    <span class="arrow-dwn"> <i class="fa-solid fa-chevron-down"></i></span>
                                </div>
                                
                                <ul class="option-items"> 
                                    <c:forEach var="titleTag" items="${titleTagList}">
                                        <li class="option option-text" id="${titleTag.TITLE_TAG_NO}" onclick="selectTag(this)">
                                            ${titleTag.TITLE_TAG_NAME}
                                        </li>
                                    </c:forEach>
                                </ul> <input type="hidden" id="titleTagNo" name="titleTagNo" value="">${titleTag.TITLE_TAG_NO}
                            </div> 
                        </div>
                        

                        <!-- 게시판 타입에 따라 글 양식 선택..ajax? -->
                        <div class="writingForm">
                            <div>
                                <h1> 글양식</h1>
                            </div>
                        </div>
                        
                        <!-- 게시글 제목 -->
                        <div class="writeTitle">
                            <input type="text" name="boardTitle" autocompleate="off" placeholder="제목을 입력하세요." >
                        </div>

                        <!-- 게시글 내용 -->
                        <div class="test">
                            <textarea id="summernote" name="boardContent"></textarea>    
                        </div>
                        
                </div>

                <!-- writingContent 우 (세팅 영역) -->
                <div class="settingArea">
                    <!-- 관리자일때 -->
                    <div class="noticeCheck">
                        <input type="checkbox" id="notice" class="input_check"> <label for="notice">공지로 등록</label>
                    </div>
                    <p>어쩌구저쩌구</p>
                    
                    <div class="공지"> 
                        <div class=""> 
                            <ul class=""> 
                                <li class="" value="" onclick="">
                                    공지
                                </li>
                            </ul>
                            <span class="arrow-dwn"> <i class="fa-solid fa-chevron-down"></i></span>
                        </div>
                        
                        
                    </div> 
                    <p><input type="checkbox" name="agree"> 댓글 허용</p>
                </div>
            </div>    
        </form>
    </div>
    
    <div id="modal">

    </div>

    <script>
    // const boardTypeList = "${boardTypeList}";
    // const boardType = [];
    // <c:forEach var="boardType" items="${boardTypeList}">
    //     boardType.push('${boardType.BOARD_CODE}')
    // </c:forEach>
    // console.log(boardType);
    
    </script>

    <script src="/resources/js/main/main.js"></script>
    <script src="/resources/js/board/writingBoard.js"></script>
</body>
</html>