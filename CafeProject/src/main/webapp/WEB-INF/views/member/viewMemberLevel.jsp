<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리 카페 등급안내</title>
    <link rel="stylesheet" href="/resources/css/member/viewMemberLevel.css">

</head>
<body>
    <section class="pop-staff-role">
        <div class="user-level">
            <p class="user-level-txt"> <strong>${loginMember.memberNickname}</strong>님은 <span class="g">${loginMember.memberLevelName}</span>입니다.</p>

            <ul class="info-list">
                <li class="info">총 게시글 <strong>${loginMember.memberBoardCount}</strong>개</li>
                <li>댓글 수 <strong>${loginMember.memberCommentCount}</strong>개</li>
                <li>방문 수 <strong>${loginMember.logHistoryCount}</strong>회</li>
                <li>가입일 ${loginMember.enrollDate}</li>
            </ul>  
        </div>


        <p class="txt-top"> 우리카페 등급안내 </p>

        <table>
            <colgroup>
                <col width="155">
                <col width="*">
            </colgroup>

            <tbody>

                <tr>
                    <th><strong class="level-icon"><img src="${memberLevel[0].MEMBER_LEVEL_IMG}" alt="plant"></strong>${memberLevel[0].MEMBER_LEVEL_NAME}</th>
                    <td>
                        <div class="txt-cont">
                            <p>가입후, 별다른 승인을 받지 않은 초기회원, 또는 활동이 없는 유령회원</p>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th><strong class="level-icon"><img src="${memberLevel[1].MEMBER_LEVEL_IMG}" alt="tropy1"></strong>${memberLevel[1].MEMBER_LEVEL_NAME}</th>
                    <td>
                        <div class="txt-cont">
                            <p>내일로, 기차로 기본 등급</p>
                            <ul>
                                <li>
                                    <span class="g">자동등업 : </span> 
                                    게시글수 <strong>${memberLevel[1].BOARD_COUNT}</strong>개, 댓글수 <strong>${memberLevel[1].COMMENT_COUNT}</strong>개, 방문수 <strong>${memberLevel[1].VISIT_COUNT}</strong>회 만족 시 자동 등업
                                </li> 
                            </ul>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th><strong class="level-icon"><img src="${memberLevel[2].MEMBER_LEVEL_IMG}" alt="tropy2"></strong>${memberLevel[2].MEMBER_LEVEL_NAME}</th>
                    <td>
                        <div class="txt-cont">
                            <p>내일로, 기차로에서 5주 이상 회원들과 많은 이야기를 나누고 있는 회원</p>
                            <ul>
                                <li>
                                    <span class="g">자동등업 : </span> 
                                    게시글수 <strong>${memberLevel[2].BOARD_COUNT}</strong>개, 댓글수 <strong>${memberLevel[2].COMMENT_COUNT}</strong>개, 방문수 <strong>${memberLevel[2].VISIT_COUNT}</strong>회 만족 시 자동 등업
                                </li> 
                            </ul>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th><strong class="level-icon"><img src="${memberLevel[3].MEMBER_LEVEL_IMG}" alt="tropy3"></strong>${memberLevel[3].MEMBER_LEVEL_NAME}</th>
                    <td>
                        <div class="txt-cont">
                            <p>오랜 기간, 활발하게 소통하시고 활동하는 회원</p>
                            <ul>
                                <li>
                                    <span class="g">자동등업 : </span> 
                                    게시글수 <strong>${memberLevel[3].BOARD_COUNT}</strong>개, 댓글수 <strong>${memberLevel[3].COMMENT_COUNT}</strong>개, 방문수 <strong>${memberLevel[3].VISIT_COUNT}</strong> 회 만족 시 자동 등업
                                </li> 
                            </ul>
                        </div>
                    </td>
                </tr>
            
                <tr>
                    <th><strong class="level-icon" ><img src="${memberLevel[4].MEMBER_LEVEL_IMG}" alt="diamond"></strong>${memberLevel[4].MEMBER_LEVEL_NAME}</th>
                    <td>
                        <div class="txt-cont">
                            <p>내일로, 기차로에서 사는 회원</p>
                            <ul>
                                <li>
                                    <span class="g">자동등업 : </span> 
                                    게시글수 <strong>${memberLevel[4].BOARD_COUNT}</strong>개, 댓글수 <strong>${memberLevel[4].COMMENT_COUNT}</strong>개, 방문수 <strong>${memberLevel[4].VISIT_COUNT}</strong> 회 만족 시 자동 등업
                                </li> 
                            </ul>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <div class="level-desc">
            <li><storng>자동등업 : 매니저가 설정한 조건을 만족하면 신청 없이 등업됩니다.</storng></li>
            <li>등업게시판 : 매니저가 설정한 조건을 만족하면 등업게시판에 등업 신청이 가능합니다. 매니저 수락을 거쳐 등업됩니다.</li>
        </div>
        
        <div class="pop-footer">
            <button class="btn"><strong>확인</strong></button>
        </div>
    </section>

    <script>
        // 확인 누르면 우리카페등급 팝업창 종료 
        document.querySelector(".btn").addEventListener("click", ()=>{
            window.close();
        })
    </script>
</body>
</html>