

/* --------------------- 로그인 ----------------------------- */

const email = document.getElementById("memberEmail");
const pw = document.getElementById("memberPw");
const message = document.getElementById("loginMessage");

function loginValidate() {
    
    if(email.value.trim().length == 0) {
        message.innerText = "아이디를 입력하세요.";
        message.classList.add("error");
        email.focus();
        return false;
    } 

    if(pw.value.trim().length == 0) {
        message.innerText = "비밀번호를 입력하세요.";
        message.classList.add("error");
        pw.focus();
        return false;
    } 
    return true;
}


/* -------------------------- 아이디 저장 ------------------------ */

const saveId = document.getElementById("saveId");
if(saveId != null) {
    saveId.addEventListener("change", function(event){
        if(this.checked){
            const str = "개인 PC에서의 사용을 권장합니다."
            + " PC방 등 공용 PC라면 취소버튼을 눌러주세요.";
            if(!confirm(str)){
                this.checked = false;
            }
        }
    });
}
