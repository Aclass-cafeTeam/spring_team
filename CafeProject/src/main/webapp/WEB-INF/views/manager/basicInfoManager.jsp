<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내일로, 기차로! 카페 기본정보</title>
    <link rel="stylesheet" href="../../resources/css/managerMain/basicInfoManager.css">
    
</head>
<body>
    <main>
        
        <!-- ************************************* managerHeader ************************************************** -->
        
        <div class="managerHeader">
            <jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />

            <nav>
                <div class="nav_menu_back">
                    <div class="nav_menu">
                        <ul>
                            <li clss="managerHome">
                                <a href="/manager/managerMain"><img src="/resources/images/free-icon-house-1835281.png">관리홈</a>
                            </li>
                            <li>
                                <a href="/manager/basicInfoManager"><img src="/resources/images/settings.png">카페운영</a>
                            </li>
                            <li>
                                <a href="/manager/totalMemberManager"><img src="/resources/images/free-icon-friends-7218085.png">멤버•스탭</a>
                            </li>
                            <li>
                                <a href="/manager/joinMemberManager"><img src="/resources/images/free-icon-add-friend-4458569.png">가입•등급</a>
                            </li>
                            <li>
                                <a href="../managerMain/menuManager.html"><img src="/resources/images/free-icon-menu-2550222.png">메뉴</a>
                            </li>
                            <!-- <li>
                                <a href="#"><img src="/resources/images/free-icon-edit-4386594.png">글•글양식</a>
                            </li> -->
                            <li>
                                <a href=""><img src="/resources/images/free-icon-spam-alert-5628585.png">삭제글</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>

        <!-- ************************************* managerHeader ************************************************** -->
        <!-- menuSub 서브 네비-->
        <div class="lnb_sub" id="menuSub2">
            <ul>
                <li class="manager_basicInfo">
                    <a href="#" class="basicInfo">기본정보</a>
                </li>
            </ul>
        </div>
        <!-- menuSub 서브 네비-->

        <div class="basicInfoMain">
            <div class="infoMainFromtitle">
                <P>기본정보</P>
            </div>
            <form action="basicInfoManager/updateCafeProfile" method="POST" 
                    name="cafeInfo-frm" enctype="multipart/form-data" 
                    onsubmit="return profileValidate()">
                <fieldset class="infofieldset">
                    <div class="infoTablecol">
                        <div class="infoTablerow1">
                            <p>카페 주소</p>
                        </div>
                        <div class="infoTablerow2">
                            <div class="infoTablerow2Box">
                                <p class="infoCafeAddress" id="infoCafeAddress">https://cafe.naver.com/khcafetest</p>
                            </div>
                        </div>
                    </div>
                    <div class="infoTablecol">
                        <div class="infoTablerow1">
                            <p>카페 이름</p>
                        </div>
                        <div class="infoTablerow2">
                            <div class="infoTablerow2Box">
                                <p class ="infoCafeName" id="infoCafeName">내일로, 기차로! 카페</p>
                                <div class="infoCafeDateBox" id="infoCafeDateBox">
                                    <p class="infoCafeDateText" id ="infoCafeDateText">카페 개설일 :</p>
                                    <p class="infoCafeDate" id="infoCafeDate">2022년 10월 14일</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="infoTablecol">
                        <div class="infoTablerow1">
                            <p>모바일 카페설정</p>
                        </div>
                        <div class="infoTablerow2">
                            <div class="infoTablerow2Box">
                                <div class ="infoCafeProfileBox" id="infoCafeProfileBox">
                                    <div class="infoCafeProfil" id="infoCafeProfil">
                                        <span id="delete-image">&times;</span>
                                        <c:if test="${empty cafeInfo.profileImg}">    
                                            <img id="profile-image" src="/resources/images/프로필.PNG">
                                        </c:if> 

                                        <c:if test="${not empty cafeInfo.profileImg}">    
                                            <img id="profile-image" src="${cafeInfo.profileImg}">
                                        </c:if> 

                                        <label for="input-image"><img id="setting-icon" class="setting-icon" src="/resources/images/프로필 변경.PNG"></label>
                                        <input type="file" name="profileImage" id="input-image" class="input-image" accept="image/*">
                                        
                                    </div>
                                    <div class="infoCafeProfilContent" id="infoCafeProfilContent">
                                        <P>· 카페 프로필에서 우리 카페를 표현할 카페 아이콘을 등록해주세요.</P>
                                        <P>· 등록하신 아이콘은 모바일웹, 카페앱 및 PC 카페 > 네임카드 등에 활용됩니다.</P>
                                        <P>(150PX150PX / 500KB미만)</P>
                                    </div>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    <div class="infoTablecol">
                        <div class="infoTablerow1">
                            <p>카페 성격</p>
                        </div>
                        <div class="infoTablerow2">
                            <div class="infoTablerow2Box">
                                <div class="infocharacter">
                                    <P>공개</P>
                                    <P>· 검색, 카페 주소 등을 통해 카페에 방문할 수 있습니다.</P>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="infoTablecol">
                        <div class="infoTablerow1">
                            <p>가입 방식</p>
                        </div>
                        <div class="infoTablerow2">
                            <div class="infoTablerow2Box">
                                <P>가입 신청 시 바로 가입할 수 있습니다.</P>
                            </div>
                            
                        </div>
                    </div>
                    <div class="infoTablecol" id="infoTablecollast">
                        <div class="infoTablerow1">
                            <p>이름사용여부</p>
                        </div>
                        <div class="infoTablerow2">
                            <div class="infoTablerow2Box">
                                <P>닉네임 사용</P>
                            </div>
                        </div>
                    </div>
                    <div class="infoButton">
                        <button>저장하기</button>
                    </div>
                </fieldset>
            </form>
        </div>

        




    </main>
    <!-- 푸터 -->
    <footer>
        <p class="cr">
            <em>Since 2022.10.14. © </em> 
            <span> 내일로, 기차로! 카페</span>
        </p>
        <c:if test="${not empty message}">
            <script>
                alert("${message}");
            </script>

            <%-- message 1회 출력 후 모든 scope 삭제 --%>
            <c:remove var="message" />
        </c:if>
    </footer>
    <!-- 푸터 -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  
    <script src="/resources/js/managerMain/basicInfoManager.js"></script>
</body>
</html>