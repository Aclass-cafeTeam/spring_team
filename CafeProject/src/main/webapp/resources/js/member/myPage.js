// 닉네임 유효성 검사
const memberNickname = document.getElementById("myPageNickname");
const nickMsg = document.getElementById("nickMsg");

// 유효성검사
// (true : 변경 가능한 닉네임, false : 유효하지 않은 닉네임)
let updateCheck;

// 초기 닉네임 상태를 저장하는 변수
// (true : 닉네임 바뀜, false : 기존 닉네임)
let nickCheck;
    
    if(memberNickname!=null){
        
        memberNickname.addEventListener("input", ()=>{
            
            // 해당 화면 진입 시 닉네임 상태를 저장(nickCheck)
            if(memberNickname.value == NowNickname){
                // 기존 닉네임인 경우
                nickCheck = false;
            } else {
                nickCheck = true;
            }
            
            // 닉네임에 문자가 입력되지 않은 경우
            if(memberNickname.value.trim().length == 0 ){
                nickMsg.innerText = "닉네임은 2글자 이상의 한글, 영문, 숫자를 사용하세요. (특수기호, 공백 사용 불가)";
                nickMsg.classList.remove("confirm","error");
                updateCheck = false;
            }
    
            // 정규표현식으로 닉네임 확인
            const regEx = /^[ㄱ-힣\w]{2,10}$/;
    
            if(regEx.test(memberNickname.value)){ // 닉네임이 유효한 경우
    
                $.ajax({
                    url : "/nickDupCheck", // 비동기 통신을 진행할 서버 요청 주소
                    data: { "memberNickname" : memberNickname.value }, // JS객체에서 서버로 전달할 값(여러 개 가능)
                    type: "GET", // 데이터 전달 방식(GET/POST)-> ajax는 보통 GET방식
                    success: (result) => { // 비동기 통신에 성공해서 응답 받았을 때
                        if(result==0) { // 닉네임 중복이 아닌 경우 
                            nickMsg.innerText = "사용가능한 닉네임입니다.";
                            nickMsg.classList.add("confirm");
                            nickMsg.classList.remove("error");
                            updateCheck = true;
                        } else {
    
                            if(memberNickname.value == NowNickname){
                                nickMsg.innerText = "회원님이 현재 사용중인 닉네임입니다.";
                            } else{
                                nickMsg.innerText = "이미 사용중인 닉네임입니다.";
                                updateCheck = false;
                            }
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
                updateCheck = false;
            }

        });
    }

    // 지역정보 변경
    const memberResidence = document.getElementById("myPageResidence");

    // 초기 지역 정보 상태를 저장하는 변수
    // (true : 지역 정보 바뀜, false : 기존 지역)
    let residenceCheck = false;
    memberResidence.addEventListener("change", ()=>{

        // 해당 화면 진입 시 지역 정보 상태를 저장(residenceCheck)
        if(memberResidence.value == memberResidence){
            // 기존 지역 정보인 경우
            residenceCheck = false;
        } else {
            residenceCheck = true;
        }

    });

// 수정 버튼 클릭시 유효성검사
    
    function myPageUpdateValidate() {
        // 지역변경O 기존닉네임O
        if(residenceCheck && !nickCheck){
            return true;
        }
        // 지역변경 X 기존닉네임 O
        if(!residenceCheck && !nickCheck){
            alert("정보 수정후 클릭하세요.")
            return false;
        }
        
        // 변경 가능한 닉네임일 경우
        if(updateCheck){
            return true;
        }

        // 변경 불가능한 닉네임일 경우
        if(!updateCheck){
            alert("변경 가능한 닉네임을 입력해주세요.");
            return false;
        }


    }
