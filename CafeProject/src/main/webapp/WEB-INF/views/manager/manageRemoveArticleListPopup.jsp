<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:set var="detailBoardList" value="${map.removeBoardList}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내일로, 기차로! 카페 전체 멤버 관리 등급 변경</title>
  <link rel="stylesheet" href="/resources/css/managerMain/manageRemoveArticleListPopup.css">
  
</head>
<body>

        <div id="app"><div class="Article ArticleViewer" style="border: 0px;"><div class="ArticleContentBox"><div class="article_header"><div class="ArticleTitle"><em class="link_board">
          ${detailBoardList.boardName}
      </em><div class="title_area"><!----><!----><!----><h3 class="title_text">
        ${detailBoardList.boardTitle}
          </h3></div></div><div class="WriterInfo"><a href="#" class="thumb"><img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png?type=c77_77" alt="프로필 사진" width="36" height="36"></a><div class="profile_area"><div class="profile_info"><div class="nick_box"><a href="#" role="button" class="nickname">
            ${detailBoardList.memberNickname}
                  </a></div><em class="nick_level">
                    ${detailBoardList.memberEmail}
                  <img src="${detailBoardList.memberLevelImage}" class="icon_level"></em></div><div class="article_info"><span class="date">${detailBoardList.BCreateDate}</span></div></div></div></div><div class="article_container"><!----><!----><div class="article_viewer"><div><div class="content CafeViewer"><div class="se-viewer se-theme-default" lang="ko-KR">
      <!-- SE_DOC_HEADER_START -->
      <!--@CONTENTS_HEADER-->
      <!-- SE_DOC_HEADER_END -->
      <div class="se-main-container">
      <div class="se-component se-image se-l-default" id="SE-731cc2c2-11d0-468d-a673-f3d5086b1053">
          <div class="se-component-content se-component-content-normal">
              <div class="se-section se-section-image se-l-default se-section-align-" style="max-width:668px;">
                      <div class="se-module se-module-image" style=""><div <c:if test="${empty removeBoardList.thumbnail}"> class="se-state-error " style="display: none;"</c:if> style="">
      <div class="se-state-error-detail">
          <div class="se-state-error-text">${removeBoardList.thumbnail}</div>
      </div>
      </div></div>
              </div>
          </div>
      </div>
      <div class="se-component se-text se-l-default" id="SE-92a25623-72cf-4cdf-ba6d-96c0f17100f8">
          <div class="se-component-content">
              <div class="se-section se-section-text se-l-default">
                  <div class="se-module se-module-text">
                          <!-- SE-TEXT { --><p class="se-text-paragraph se-text-paragraph-align- " style="display: block;padding-top: 40px;" id="SE-d778a863-2dc3-408e-aadf-f4eee6b9d030"><span style="" class="" id="">${detailBoardList.boardContent}</span></p><!-- } SE-TEXT -->
                  </div>
              </div>
          </div>
      </div>    </div>
      </div>
      </div><!----><div class="AttachFileIssueLayer" style="display: none;"><!----></div></div></div><div class="article_writer"><!----></div></div></div></div></div>

  <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  
  	<script src="/resources/js/managerMain/manageRemoveArticleListPopup.js"></script>

</body>
</html>