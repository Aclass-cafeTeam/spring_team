// 제출form 전체 유효성 검사 
const checkObj = {
    "memberEmail"     :false,
    "memberPw"        :false,
    "memberPwConfirm" :false,
    "memberNickname"  :false
};

// 회원 가입 양식이 제출되었을 때
function signUpValidate() {
    for(let key in checkObj){
        let str;
        // checkObj 속성 하나를 꺼내 값을 검사했는데 false인 경우 
        if(!checkObj[key]) {
            switch(key){
                case "memberEmail" : str = "중복확인필요."; break;
                case "memberPw" : str = "비밀번호가 유효하지 않습니다."; break;
                case "memberPwConfirm" : str = "비밀번호가 유효하지 않습니다."; break;
                case "memberNickname" : str = "닉네임이 유효하지 않습니다."; break;
            }
            document.getElementById(key).focus(); // 유효하지 않은 입력포커스로 이동
            
            return false;
        }
    }
    return true;    
}


// //////////////////////////////////////////////////////////////////////////////////////////////////
// 이메일 유효성 검사 
const memberEmail = document.getElementById("memberEmail"); 
const emailMessage = document.getElementById("emailMessage"); 

//input 이벤트 : input태그에 입력이 되었을 경우(모든 입력 인식)
memberEmail.addEventListener("input", function(){

    // 실제 문자가 입력되지 않는 경우(방향키로 조절, 스페이스 등 제외)
    if(this.value.trim().length==0){
        emailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요.";
        this.value = "";

        // 초록글씨, 빨간글씨를 제거하고 검정 글씨 만들기
        emailMessage.classList.remove("confirm", "error");

        // 유효성 검사 확인 객체에 현재 상태를 저장
        checkObj.memberEmail = false;
        return;
    }

    // 정규표현식을 이용한 유효성 검사
    const regEx = /^[a-zA-Z\d_-]{4,}\@[\w_-]+(.\w+){1,3}$/;

    if(regEx.test(memberEmail.value)){ // 이메일이 유효한 경우
        $.ajax({
            url : "/emailDupCheck", // 비동기 통신을 진행할 서버 요청 주소
            data: { "memberEmail" : memberEmail.value }, // JS객체에서 서버로 전달할 값(여러 개 가능)
            type: "GET", // 데이터 전달 방식(GET/POST)-> ajax는 보통 GET방식
            success: (result) => { // 비동기 통신에 성공해서 응답 받았을 때
                // result : 서버로부터 받은 응답 데이터 
                // 매개변수 이름은 아무거나
                console.log(result);
                if(result==0) { // 중복 아님
                    emailMessage.innerText = "사용가능한 이메일입니다.";
                    emailMessage.classList.add("confirm");
                    emailMessage.classList.remove("error");
                    
                    checkObj.memberEmail = true;

                } else {
                    emailMessage.innerText = "이미 사용중인 이메일입니다.";
                    emailMessage.classList.add("error");
                    emailMessage.classList.remove("confirm");

                    checkObj.memberEmail = false;
                }
            },
            error: () => { // 비동기 통신이 실패했을 때 수행
                console.log("ajax통신 실패");
            },
            complete : ()=> {// success, error 수행여부 관계없이 무조건 수행
                console.log("중복 검사 수행 완료")
            }
        });


    } else { // 유효하지 않은 경우
        emailMessage.innerText = "이메일 형식이 유효하지 않습니다.";
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");

        // 유효성 검사 확인 객체에 현재 상태를 저장
        checkObj.memberEmail = false;

    }

});


// //////////////////////////////////////////////////////////////////////////////////////////////////
// 비밀번호 유효성 검사

const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");


// 비밀번호 입력 시
memberPw.addEventListener("input", function(){

    // 비밀번호가 하나도 입력되지 않은 경우
    if( memberPw.value.trim().length == 0 ) {
        pwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_)를 포함한 6~20글자 사이로 입력해주세요.";
        memberPw.value="";
        pwMessage.classList.remove("confirm", "error");
        checkObj.memberPw = false;
        return;
    }

    // 정규표현식을 통한 비밀번호 유효성 검사
    const regEx = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

    if(regEx.test(memberPw.value)){
        checkObj.memberPw = true;

        // 유효한 비밀번호 + 확인 작성 X
        if( memberPwConfirm.value.trim().length == 0 ) {
            pwMessage.innerText = "비밀번호 사용 가능합니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");

        } else { // 유효한 비밀번호 + 확인 작성 O
            // 비밀번호가 입력될 때 비밀번호 확인에 작성된 값과 일치하는 경우
            if( memberPw.value == memberPwConfirm.value ) {
                pwMessage.innerText = "입력하신 비밀번호가 일치합니다.";
                pwMessage.classList.add("confirm");
                pwMessage.classList.remove("error");
                checkObj.memberPwConfirm = true;

            } else {
                pwMessage.innerText = "입력하신 비밀번호가 일치하지 않습니다.";
                pwMessage.classList.add("error");
                pwMessage.classList.remove("confirm");
                checkObj.memberPwConfirm = false;
            }
        }

    } else { 
        pwMessage.innerText = "입력하신 비밀번호가 유효하지 않습니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

        checkObj.memberPw = false;
    }
});



// 비밀번호 확인하기 입력 유효성 검사 == 앞의 비밀번호와 일치하는지 검사
memberPwConfirm.addEventListener("input", function(){
    
    // 비밀번호가 유효한 경우에만 비밀번호와 비밀번호 확인이 같은지 비교
    if(checkObj.memberPw==true){
        
        // 비밀번호와 비밀번호 확인이 같은지 검사
        if( memberPwConfirm.value == memberPw.value ) {
            pwMessage.innerText = "입력하신 비밀번호가 일치합니다."
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
            checkObj.memberPwConfirm = true;
    
    
        } else {
            pwMessage.innerText = "입력하신 비밀번호가 일치하지 않습니다."
            pwMessage.classList.add("error");
            pwMessage.classList.remove("confirm");
            checkObj.memberPwConfirm = false;
    
        }

    } else { // 비밀번호가 유효하지 않은 경우
        checkObj.memberPwConfirm = false;
    }

});



// //////////////////////////////////////////////////////////////////////////////////////////////////
// 닉네임 유효성 검사
const memberNickname = document.getElementById("memberNickname");
const nickMessage = document.getElementById("nickMessage");

memberNickname.addEventListener("input", function(){
    
    // 닉네임에 문자가 입력되지 않은 경우
    if(memberNickname.value.trim().length == 0 ){
        nickMessage.innerText = "닉네임은 한글, 영문, 숫자를 사용하세요. (특수기호, 공백 사용 불가)";
        nickMessage.classList.remove("confirm","error");
        checkObj.memberNickname = false;
        return; 
    }

    // 정규표현식으로 닉네임 확인
    const regEx = /^[가-힣\w]{2,10}$/;
                        /* a-zA-Z0-9 */

    
    if(regEx.test(memberNickname.value)){ // 닉네임이 유효한 경우

        // ************ 닉네임 중복 검사 코드 추가 예정 ************

        nickMessage.innerText ="유효한 닉네임입니다."
        nickMessage.classList.add("confirm");
        nickMessage.classList.remove("error");
        checkObj.memberNickname = true;
        
    } else { // 유효하지 않을 경우
        nickMessage.innerText ="유효하지 않은 닉네임입니다."
        nickMessage.classList.add("error");
        nickMessage.classList.remove("confirm");
        checkObj.memberNickname = false;

    }
});


///////////////////////////////////////////////////////////////////////////////


// select option이 선택되었을 때
document.getElementById("residence").addEventListener("change", function(){

    
});