<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리 카페 등급안내</title>
    <link rel="stylesheet" href="/resources/css/viewMyMemberLevel.css">
</head>
<body>
    <section class="pop-staff-role">
        <div class="user-level">
            <p class="user-level-txt"> ㅎㅔ루님은 <span class="g">일반여행자</span>입니다.</p>

            <ul class="info-list">
                <li class="info">총 게시글 <strong>5</strong>개</li>
                <li>댓글수 <strong>10</strong>개</li>
                <li>방문수 <strong>20</strong>회</li>
                <li>가입일 2022.10.13</li>
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
                    <th><strong class="level-icon"><img src="/resources/images/plant.png" alt="plant"></strong>새내기</th>
                    <td>
                        <div class="txt-cont">
                            <p>가입후, 별다른 승인을 받지 않은 초기회원, 또는 활동이 없는 유령회원</p>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th><strong class="level-icon"><img src="/resources/images/trophy1.png" alt="tropy1"></strong>일반여행자</th>
                    <td>
                        <div class="txt-cont">
                            <p>내일로, 기차로 기본 등급</p>
                            <ul>
                                <li>
                                    <span class="g">자동등업 : </span> 
                                    게시글수 <strong>5</strong>개, 댓글수 <strong>10</strong>개, 방문수 <strong>20</strong>회 만족 시 자동 등업
                                </li> 
                            </ul>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th><strong class="level-icon"><img src="/resources/images/trophy2.png" alt="tropy2"></strong>성실여행자</th>
                    <td>
                        <div class="txt-cont">
                            <p>내일로, 기차로에서 5주 이상 회원들과 많은 이야기를 나누고 있는 회원</p>
                            <ul>
                                <li>
                                    <span class="g">자동등업 : </span> 
                                    게시글수 <strong>40</strong>개, 댓글수 <strong>200</strong>개, 방문수 <strong>100</strong>회 만족 시 자동 등업
                                </li> 
                            </ul>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th><strong class="level-icon"><img src="/resources/images/trophy3.png" alt="tropy3"></strong>우수여행자</th>
                    <td>
                        <div class="txt-cont">
                            <p>오랜 기간, 활발하게 소통하시고 활동하는 회원</p>
                            <ul>
                                <li>
                                    <span class="g">자동등업 : </span> 
                                    게시글수 <strong>100</strong>개, 댓글수 <strong>500</strong>개, 방문수 <strong>200</strong> 회 만족 시 자동 등업
                                </li> 
                            </ul>
                        </div>
                    </td>
                </tr>
            
                <tr>
                    <th><strong class="level-icon" ><img src="/resources/images/diamond.png" alt="diamond"></strong>거주자</th>
                    <td>
                        <div class="txt-cont">
                            <p>내일로, 기차로에서 사는 회원</p>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <div class="level-desc">
            <li><storng>자동등업 : 매니저가 설정한 조건을 만족하면 신청 없이 등업됩니다.</storng></li>
            <li>등업게시판 : 매니저가 설정한 조건을 만족하면 등업게시판에 등업 신청이 가능합니다. 매니저 수락을 거쳐 등업됩니다.</li>
        </div>
        
        <!-- 확인 누르면 우리카페등급 팝업창 종료 -->
        <div class="pop-footer">
            <a href="#" class="btn"><strong>확인</strong></a>
        </div>
    </section>

</body>
</html>