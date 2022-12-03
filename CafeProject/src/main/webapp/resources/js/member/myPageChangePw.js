// 비밀번호 변경 유효성 검사

// 새 비밀번호 (정규표현식 유효성검사) 객체
let changePwCheck = false;

// 새 비밀번호와 비밀번호 확인이 일치하는지 검사하는 객체
let changePwConfirm = false;

const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");
const pwMessage = document.getElementById("pwMessage");
const pwConfirm = document.getElementById("pwConfirm");

// 정규표현식을 통한 비밀번호 유효성 검사
const regEx = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
            // 비밀번호 : 8~16자 영문, 숫자, 특수문자

// 새 비밀번호 입력 시
newPw.addEventListener("input", ()=>{
    // 비밀번호가 하나도 입력되지 않은 경우
    if( newPw.value.trim().length == 0 ) {
        pwMessage.innerText = "8~16자 영문 대소문자, 숫자, 특수문자를 사용하세요.";
        pwMessage.classList.remove("confirm", "error");
        pwConfirm.innerText="";
        changePwCheck = false;
        return;
    } 

    if(regEx.test(newPw.value)){
        
        // 유효한 비밀번호 + 확인 작성 X
        if( newPwConfirm.value.trim().length == 0 ) {
            pwMessage.innerText = "유효한 비밀번호 형식입니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
            changePwCheck = false;

            
        } else { // 유효한 비밀번호 + 확인 작성 O
            changePwCheck = true;
            
            // 비밀번호가 입력될 때 비밀번호 확인에 작성된 값과 일치하는 경우
            if( newPw.value == newPwConfirm.value ) {
                pwMessage.innerText = "비밀번호가 일치합니다.";
                pwMessage.classList.add("confirm");
                pwMessage.classList.remove("error");
                pwConfirm.innerText = "";
                changePwConfirm = true;

            } else {
                pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
                pwMessage.classList.add("error");
                pwMessage.classList.remove("confirm");
                pwConfirm.innerText="";
                changePwConfirm = false;
            }
        }

    } else {  // 비밀번호가 유효하지 않은 경우
        pwMessage.innerText = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        pwConfirm.innerText="";
        changePwCheck = false;
    }

});

// 비밀번호 확인하기 입력 유효성 검사 == 앞의 비밀번호와 일치하는지 검사
newPwConfirm.addEventListener("input", ()=>{

    if(newPw.value.trim().length == 0) {
        pwMessage.innerText = "비밀번호를 입력하세요.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        newPw.focus();
        newPwConfirm.value="";
        changePwCheck = false;
    } 

    // 비밀번호가 유효한 경우에만 비밀번호와 비밀번호 확인이 같은지 비교
    if(regEx.test(newPw.value)){
        changePwCheck = true;
        
        // 비밀번호와 비밀번호 확인이 같은지 검사
        if( newPwConfirm.value == newPw.value ) {
            pwConfirm.innerText = "비밀번호가 일치합니다.";
            pwConfirm.classList.add("confirm");
            pwConfirm.classList.remove("error");
            pwMessage.innerText = "";
            changePwConfirm = true;
    
        } else {
            pwConfirm.innerText = "비밀번호가 일치하지 않습니다."
            pwConfirm.classList.add("error");
            pwConfirm.classList.remove("confirm");
            pwMessage.innerText="";
            changePwConfirm = false;
    
        }

    } else { // 비밀번호가 유효하지 않은 경우
        changePwCheck = false;
    }
});

// 수정 버튼 클릭시 유효성검사
function myPageChangePwValidate() {

    // 비밀번호 정규식표현 통과, 새 비밀번호와 일치할 때만 true
    if(changePwCheck && changePwConfirm){
        return true;
    }

    alert("비밀번호를 변경할 수 없습니다. 입력 창을 확인하세요.");
    return false;

}
