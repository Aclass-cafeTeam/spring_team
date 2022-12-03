<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<header>
  <div class="managerHeader-gnb">

      <div class="tit_area">
          <h1><a href="/" class="go_nvr">NEVER</a>
              <a href="/manager/managerMain" class="go_adm">카페관리</a></h1>
          <p><a href="/" class="title">내일로, 기차로! 카페</a></p>
      </div>

      <div class="tit_menu">
          <label for="header-menu-toggle">
            ${loginMember.memberNickname}
              <!-- <i class="fa-solid fa-caret-down"></i> -->
          </label>

          <input class="header__menu-btn" type="checkbox" id="header-menu-toggle">
          <div class="header__nav">
              <a href="/member/myPage/info">내정보</a>
              <a href="/member/logout">로그아웃</a>
          </div>
      </div>

  </div>
</header>