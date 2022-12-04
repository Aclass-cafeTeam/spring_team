// 비밀번호 형식 유효성 검사
const currentPw = document.getElementById("currentPw");
const currentPwMessage = document.getElementById("currentPwMessage");

if(currentPw!=null){

    currentPw.addEventListener("input", ()=>{

        // 입력되지 않은 경우
        if(currentPw.value.length == 0){
            currentPwMessage.innerText = "hint! 8~16자 영문, 숫자, 특수문자를 사용하세요.";
            currentPwMessage.classList.remove("confirm", "error");
            pwConfirm.innerText="";
            return;
        }
    
        // 입력된 경우 정규표현식을 통한 비밀번호 유효성 검사
    const regEx = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
                // 비밀번호 : 8~16자 영문, 숫자, 특수문자
        if( regEx.test(currentPw.value) ){ // 비밀번호 유효
            currentPwMessage.innerText = "유효한 비밀번호 형식입니다.";
            currentPwMessage.classList.add("confirm");
            currentPwMessage.classList.remove("error");
        }else{
            currentPwMessage.innerText = "hint! 8~16자 영문, 숫자, 특수문자를 사용하세요.";
            currentPwMessage.classList.add("error");
            currentPwMessage.classList.remove("confirm");
            pwConfirm.innerText="";
        }
    });

}