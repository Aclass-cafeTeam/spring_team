<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${board.boardTitle}</title>
    
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
        
        <form action="/board/${board.boardCode}/${board.boardNo}/update" method="POST" enctype="multipart/form-data" class="board-write" id="boardWriteForm" onsubmit ="return updateValidate()">  

            <div class="writingHeader">
                <h1 id="HeaderTitle">카페 글쓰기</h1>
                
                <div class="toolArea">
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
                                    <span class="btn-text">${board.boardName}</span>
                                    <span class="arrow-dwn"> <i class="fa-solid fa-chevron-down"></i></span>
                                </div>
                                
                                <ul class="option-items"> 
                                    <c:forEach var="boardType" items="${boardTypeList}">
                                        <li class="option option-text" id="${boardType.BOARD_CODE}" onclick="selectType(this)">
                                            ${boardType.BOARD_NAME}
                                        </li>
                                    </c:forEach>
                                </ul> <input type="hidden" id="boardCode" name="boardCode" value="${board.boardCode}">
                            </div>
                        
                            
                            <!-- 말머리 -->    
                            <div class="title-tag wrapper"> 
                                <div class="select"> 
                                    <span class="btn-text"> ${board.titleTagName}</span>
                                    <span class="arrow-dwn"> <i class="fa-solid fa-chevron-down"></i></span>
                                </div>
                                
                                <ul class="option-items"> 
                                    <c:forEach var="titleTag" items="${titleTagList}">
                                        <li class="option option-text" id="${titleTag.TITLE_TAG_NO}" onclick="selectTag(this)">
                                            ${titleTag.TITLE_TAG_NAME}
                                        </li>
                                    </c:forEach>
                                </ul> <input type="hidden" id="titleTagNo" name="titleTagNo" value="${board.titleTagNo}">
                            </div> 
                        </div>
                        

                        <!-- 게시글 제목 -->
                        <div class="writeTitle">
                            <input type="text" name="boardTitle" id="boardTitle" autocompleate="off" placeholder="제목을 입력하세요." value="${board.boardTitle}" >
                        </div>

                        <!-- 게시글 내용 -->
                        <div class="writeC">
                            <textarea id="summernote" name="boardContent" id="boardContent">${board.boardContent}</textarea>    
                        </div>
                        
                </div>
                
                <!-- writingContent 우 (세팅 영역) -->
                <div class="writingSide">
                    <!-- 관리자일때만 보이는 화면 -->
                    <c:choose>
                        <c:when test="${sessionScope.loginMember.authorityNo==0 ||sessionScope.loginMember.authorityNo==1}">
                            <div class="settingArea">
                                <p><input type="checkbox" id="boardNotice"> <label for="boardNotice">공지로 등록</label></p>

                                <div id="setting"> 
                                    <p>전체공지 또는 게시판 공지로 등록가능합니다.</p>
                                    <select name="noticeFlag" id="noticeFlag">
                                        <option value="0" disabled selected>선택</option>
                                        <option value="1">게시판공지</option>
                                        <option value="2">전체공지</option>
                                    </select>
                                </div>
                            </div>
                        </c:when>
                    </c:choose> 
                    
                    <!-- 댓글 허용 -->
                    <div class="settingArea">
                        <p><input type="checkbox" id="comment" name="comment" checked> <label for="comment">댓글 허용</label></p>
                    </div>  
                </div>
            </div>
        </form>
    </div>
    
    <script>
        const memberNo = "${loginMember.memberNo}";
        const memberLevelNo = "${loginMember.memberLevelNo}";
    </script>

    <script src="/resources/js/main/main.js"></script>
    <script src="/resources/js/board/summernote.js"></script>
    <script src="/resources/js/board/updateBoard.js"></script>
</body>
</html>