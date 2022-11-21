<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카페 가입하기</title>
    <link rel="stylesheet" href="/resources/css/member/signUp.css">
    <link rel="stylesheet" href="/resources/css/main.css">

    <!-- fontawesome 아이콘 -->
    <script src="https://kit.fontawesome.com/e4f69a07ca.js" crossorigin="anonymous"></script>
</head>


<body>

    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <section id="flex">
    
        <!-- sideMenu -->
        <jsp:include page="/WEB-INF/views/intro/sideMenu.jsp"/>


        <!-- 카페 가입하기 -->
        <section class="joinCafeSection">
            <div class="boardMenuInfo">
                <h1 class="signUpTitle">카페 가입하기</h1>
                <p class="signUpSubject">카페 가입을 위한 정보를 입력해주세요.</p>
            </div>
            
        
            <form action="/member/signUp" method="POST" name="signUp-frm" id="signUp-frm" onsubmit="return signUpValidate()">

                <div class="signUpArea">

                    <!-- 카페설명  -->
                    <div class="signUpRow">
                        <label class="info-head">카페설명</label>
                        <div>
                            <span>국내여행 최대 커뮤니티!! 국내여행 제주여행 내일로 게스트하우스 동행구하기 기차여행 여행코스</span>
                        </div>
                    </div>
                
                    <!-- 가입안내 -->
                    <div class="signUpRow">
                        <label class="info-head">가입안내</label>
                        <div>
                            <span>여행하는 사람과 사람이 만나고, 인연을 함께 만드는 공간. 내일로, 기차로입니다. 내일로, 기차로의 회원이기만 해도 받을 수 있는 혜택도 마련되어 있어요!</span>
                        </div>
                    </div>
                
                
                    <!-- 아이디(이메일) 입력 -->
                    <div class="signUpRow">
                        <label for="memberEmail">아이디</label>
                        <div class="inputArea">
                            <input type="text" name="memberEmail" id="memberEmail" placeholder="아이디(이메일)"
                            maxlength="30" autocomplete="off" required >
                            <button type="button" class="verify-btn">인증번호 받기</button> 
                            <div class="signUp-message">
                                <span id="emailMessage"></span>
                            </div>
                        </div>
                    </div>

                    <!-- 인증번호 입력 -->
                    <div class="signUpRow verify-frm">
                        <label for="verify">인증번호</label>
                        <div class="inputArea">
                            <input type="text" name="verify" id="verify" placeholder="인증번호 입력"
                            maxlength="6" autocomplete="off">
                            <button type="button" class="verify-btn">인증하기</button> 
                            <div class="signUp-message">
                                <span id="verifyMessage">인증되었습니다.</span>
                            </div>
                        </div>
                        
                    </div>
                
                
                    <!-- 비밀번호 입력 -->
                    <div class="signUpRow">
                        <label for="memberPw">비밀번호</label>
                        <div class="inputArea">
                            <input type="password" name="memberPw" id="memberPw" maxlength="20"
                                placeholder="비밀번호" autocomplete="off" >
                            <div class="signUp-message" >
                                <span id="pwMessage"></span>
                            </div>
                        </div>
                    </div>
                
                
                    <!-- 비밀번호 확인 -->
                    <div class="signUpRow">   
                        <label for="memberPwConfirm">비밀번호확인</label>
                        <div class="inputArea">
                            <input type="password" name="memberPwConfirm" id="memberPwConfirm" maxlength="20"
                                placeholder="비밀번호 확인"  autocomplete="off">
                            <div class="signUp-message">
                                <span id="pwConfirm"></span>
                            </div>
                        </div>
                    </div>   
                
                    <!-- 닉네임 -->
                    <div class="signUpRow">
                        <label for="memberNickname">닉네임</label>
                        <div class="inputArea">
                            <input type="text" name="memberNickname" id="memberNickname" maxlength="20" 
                                placeholder="닉네임" autocomplete="off" >
                            <div  class="signUp-message">
                                <span id="nickMessage"></span><span id="bite"></span>
                                
                            </div>
                        </div>
                    </div>


                    <!-- 사는지역 -->
                    <div class="signUpRow">
                        <label for="residence">지역(선택사항)</label>
                        <div class="inputArea">
                            <div class="select">
                                <select name="memberResidence" id="residence">
                                    <option selected disabled>시/도 선택</option>
                                    <option value="서울">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="인천">인천</option>
                                    <option value="부산">부산</option>
                                    <option value="대구">대구</option>
                                    <option value="대전">대전</option>
                                    <option value="광주">광주</option>
                                    <option value="울산">울산</option>
                                    <option value="세종">세종</option>
                                    <option value="강원">강원</option>
                                    <option value="충북">충북</option>
                                    <option value="전북">전북</option>
                                    <option value="전남">전남</option>
                                    <option value="경북">경북</option>
                                    <option value="경남">경남</option>
                                    <option value="제주">제주</option>
                                    <option value="기타(해외)">기타(해외)</option>
                                </select>
                            </div>
                        </div>
                    </div>
                

                
                    <!-- 가입 관련 안내 문구 -->
                    <div class="signUpRow">
                        <div class="joinInfo">
                            <li>가입 신청이 수락되면 <strong>'내소식'</strong>에서 알려드립니다.</li>
                            <li>가입 신청 후 <strong>3개월 </strong>이상 수락되지 않으면 자동 신청 해제됩니다.</li>
                            <li> 이 카페에서 활동하는 동안 원활한 카페 운영을 위하여 (필수) 아이디, 별명, 활동내역, (선택) 성별, 연령대, 이름(단, 이름은 실명 공개 카페에 한해 공개)이 이 카페의 운영진에게 공개되며, 최소한의 제재 기록은 카페 탈퇴 후에도 보관됩니다. 본 동의를 거부하실 수 있으나, 카페 가입이 불가능합니다.</li>
                        </div>
                    </div>
                    
                </div>
        

                <div class="btn">
                    <button type="submit" id="signUp-btn">동의 후 가입하기</button>
                </div>
            
            </form>
        </section>
    </section>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- 보안절차 reCaptcha -->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <!-- site key : 6LcVIgIjAAAAAOvAFGvFi5i7GQhZdoo7LIJZI9gz -->
    <!-- secret key : 6LcVIgIjAAAAAByntQQHon2PJS2e0cYnBzm6rc7F -->
    
    <!-- jQueryCDN -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <script src="/resources/js/member/signUp.js"></script> 

</body>
</html>