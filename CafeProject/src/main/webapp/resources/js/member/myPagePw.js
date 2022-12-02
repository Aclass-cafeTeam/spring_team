// 비밀번호 변경 유효성 검사

// 비밀번호 변경 form 요소
const changePwForm = document.getElementById("changePwForm");

if(changePwForm !=null){ // changePwForm 요소가 존재할 때

    changePwForm.addEventListener("submit", function(event){

        //비밀번호 변경에 사용되는 input 요소 모두 얻어오기
        const currentPw = document.getElementById("currentPw");
        const newPw = document.getElementById("newPw");
        const newPwConfirm = document.getElementById("newPwConfirm");

        // 현재 비밀번호가 작성되지 않았을 때
        if(currentPw.value.trim().length==0){
            alert("현재 비밀번호를 입력해주세요.");
            currentPw.focus();
            currentPw.value ="";
        

            event.preventDefault();
            // -> 이벤트를 수행하지 못하게하는 함수
            // --> 기본 이벤트 삭제
            return;

        }

        // 새 비밀번호가 작성되지 않았을 때
        if(newPw.value.trim().length==0){
            alert("새 비밀번호를 입력해주세요.");
            newPw.focus();
            newPw.value="";

            event.preventDefault(); // form 기본이벤트 제거
            return;
        }

        // 새 비밀번호 확인이 작성되지 않았을 때
        if(newPwConfirm.value.trim().length==0){
            alert("새 비밀번호 확인을 입력해주세요.");
            newPwConfirm.focus();
            newPwConfirm.value="";

            event.preventDefault(); // form 기본이벤트 제거
            return;
        }

        // 비밀번호 정규식 검사

        // 새 비밀번호, 새 비밀번호 확인이 같은지 검사
        if(newPw.value != newPwConfirm.value){
            alert("새 비밀번호가 일치하지 않습니다.");
            newPwConfirm.focus();
            event.preventDefault(); // 기본 이벤트 제거
            return; // 함수 종료
        }

    })
}