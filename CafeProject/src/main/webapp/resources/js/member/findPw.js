const memberEmail = document.getElementById("memberEmail");
const fMessage = document.getElementById("fMessage");

function findValidate() {

    memberEmail.addEventListener("input", function(){
        
        // 미입력시 경고창
        if(memberEmail.value.trim().length==0) {
            fMessage.innerText = "이메일을 입력해주세요.";
            fMessage.classList.add("error")
            emailMessage.classList.remove("confirm");
            memberEmail.value = "";
            memberEmail.focus();

            return false;
        }

        const reg = /^[a-z\d_-]{5,}@[\w_-]+(\.\w+){1,3}$/;

        if(reg.test(memberEmail.value)) {
            return true;
        }
    })
}


// findBtn.addEventListener("click", function(){

//     // 이메일 유효성 검사 
//     const memberEmail = document.getElementById("memberEmail"); 
//     const emailMessage = document.getElementById("emailMessage"); 

//     memberEmail.addEventListener("input", function(){


    
//     // 정규표현식을 이용한 유효성 검사
//     const reg = /^[a-z\d_-]{5,}@[\w_-]+(\.\w+){1,3}$/;

//     if(reg.test(memberEmail.value)){ // 이메일이 유효한 경우
//         $.ajax({
//             url : "/emailDupCheck", // 비동기 통신을 진행할 서버 요청 주소
//             data: { "memberEmail" : memberEmail.value }, // JS객체에서 서버로 전달할 값(여러 개 가능)
//             type: "GET", // 데이터 전달 방식(GET/POST)-> ajax는 보통 GET방식
//             success: (map) => { // 비동기 통신에 성공해서 응답 받았을 때

//                 if(map.dup > 0) {
//                     emailMessage.innerText = "이미 사용중인 이메일입니다.";
//                     emailMessage.classList.add("error");
//                     emailMessage.classList.remove("confirm");
//                     checkObj.memberEmail = false;
//                 } 
                
//                 if(map.secession > 0) {
//                     emailMessage.innerText = "가입 불가능합니다.";
//                     emailMessage.classList.add("error");
//                     emailMessage.classList.remove("confirm" );
//                     checkObj.memberEmail = false;
//                 } 
                    
//             },
//             error: () => { // 비동기 통신이 실패했을 때 수행
//                 console.log("ajax통신 실패");
//             },
//             complete : ()=> {// success, error 수행여부 관계없이 무조건 수행
//                 console.log("중복 검사 수행 완료")
//             }
//         });


//     } else { // 유효하지 않은 경우
//         emailMessage.innerText = "영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
//         emailMessage.classList.add("error");
//         emailMessage.classList.remove("confirm");

//         checkObj.memberEmail = false;
//     }
// });


// })

