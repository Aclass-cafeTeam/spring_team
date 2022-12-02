// 회원탈퇴 유효성 검사
function secessionValidate(){
  
    const memberPw = document.getElementById("memberPw");
    const agree = document.getElementById("agree");

    // 비밀번호 미작성 
    if(memberPw.value.trim().length==0){
        alert("비밀번호를 입력해주세요.");
        
        memberPw.focus();
        return false;  
    }

    // 약관 동의 체크 여부
    // -체크박스요소.checked : 체크시 true  , 해제시 false 반환 
    if(!agree.checked){ // 체크 안했을때 
        alert("유의사항 확인 후 탈퇴 신청 버튼을 눌러주세요.");
        
        agree.focus();
        return false   
    }

    // 정말 탈퇴할지 확인 
    // - window.confirm("내용") : 대화 상자에 확인/취소 생성
    //          확인 클릭 시 true / 취소 클릭 시 false
    //          window는 생략 가능 

    if(!confirm("정말 탈퇴 신청을 하시겠습니까?")){ // 취소를 누른 경우
        
        return false;
    }

    return true;
}

// 닉네임 유효성 검사
    const memberNickname = document.getElementById("myPageNickname");
    const nickMsg = document.getElementById("nickMsg");

    
    if(memberNickname!=null){
        
        
        memberNickname.addEventListener("input", function(){
            
            // 초기 닉네임 상태를 저장하는 변수
            // (true : 닉네임 바뀜,    false : 기존 닉네임)
            // let nickCheck = false;
            
            // 해당 화면 진입 시 닉네임 상태를 저장(nickCheck)
            if(memberNickname.getAttribute("value") == NowNickname){
                // 기존 닉네임인 경우
                nickCheck = false;
            } else {
                nickCheck = true;
            }

            // 닉네임에 문자가 입력되지 않은 경우
            if(this.value.trim().length == 0 ){
                nickMsg.innerText = "닉네임은 2글자 이상의 한글, 영문, 숫자를 사용하세요. (특수기호, 공백 사용 불가)";
                nickMsg.classList.remove("confirm","error");
                return false; 
            }

            // 정규표현식으로 닉네임 확인
            const regEx = /^[ㄱ-힣\w]{2,10}$/;

            if(regEx.test(this.value)){ // 닉네임이 유효한 경우

                $.ajax({
                    url : "/nickDupCheck", // 비동기 통신을 진행할 서버 요청 주소
                    data: { "memberNickname" : memberNickname.value }, // JS객체에서 서버로 전달할 값(여러 개 가능)
                    type: "GET", // 데이터 전달 방식(GET/POST)-> ajax는 보통 GET방식
                    success: (result) => { // 비동기 통신에 성공해서 응답 받았을 때
                        if(result==0) { // 닉네임 중복이 아닌 경우 
                            nickMsg.innerText = "사용가능한 닉네임입니다.";
                            nickMsg.classList.add("confirm");
                            nickMsg.classList.remove("error");

                        } else {
                            nickMsg.innerText = "이미 사용중인 닉네임입니다.";
                            nickMsg.classList.add("error");
                            nickMsg.classList.remove("confirm");

                        }

                    },
                    error: () => { // 비동기 통신이 실패했을 때 수행
                        console.log("ajax통신 실패");
                    },
                    complete : ()=> {// success, error 수행여부 관계없이 무조건 수행
                        console.log("중복 검사 수행 완료")
                    }
                });

            } else { // 유효하지 않을 경우
                nickMsg.innerText ="닉네임은 2글자 이상의 한글, 영문, 숫자를 사용하세요. (특수기호, 공백 사용 불가)";
                nickMsg.classList.add("error");
                nickMsg.classList.remove("confirm");
            }


        });
    }

    function myPageUpdateValidate() {

        // 닉네임이 바뀐 경우
        if (nickCheck) {
            return true;
        }

        // 기존 닉네임인 경우
        alert("닉네임 변경 후 클릭하세요")
        return false;
    }
