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

// 프로필 수정
window.addEventListener("DOMContentLoaded", ()=>{

    const profileImage = document.getElementById("profile-image");
    const deleteImage = document.getElementById("delete-image");
    const inputImage = document.getElementById("input-image");
    
    // 초기 프로필 이미지 상태를 저장하는 변수
    // (true : 업로드된 이미지 있음,    false : 기본 이미지)
    let initCheck;
    
    // 이미지가 업로드 되었거나 삭제되었음을 나타내는 변수
    // (-1 : 초기값(취소),  0 : 프로필 삭제(x버튼 클릭),  1 : 새 이미지 업로드 )
    let deleteCheck = -1;
    
    // 프로필 수정 페이지에 처음 들어왔을 때의 이미지 경로
    const originalImage = profileImage.getAttribute("src")
    
    // 프로필 수정 화면일 경우
    if(inputImage !=null){
    
        // 해당 화면 진입 시 프로필 이미지 상태를 저장(initCheck)
        if(profileImage.getAttribute("src") == "/resources/images/member/프로필.PNG"){
            // 기본이미지인 경우
            initCheck = false;
        } else {
            initCheck = true;
        }
    
        // 이미지가 선택되었을 때 미리보기
    
        // input type="file" 요소는 값이 없을 때 ''(빈칸)
        // input type="file" 요소는 이전에 선택한 파일이 있어도 취소하면 다시 ''(빈칸)
        // input type="file" 요소로 파일을 선택하면 change 이벤트가 발생한다
    
        inputImage.addEventListener("change", e =>{ 
    
            // e.target : 이벤트가 발생한 요소 (==inputImage)
            // * 화살표 함수에서 this는 window 객체를 의미한다!
    
            // 선택된 파일의 목록
            console.log(e.target.files)
            console.log(e.target.files[0])
    
            // 선택된 파일이 있을 경우
            if(e.target.files[0] != undefined){
    
                const reader = new FileReader();
                // FileReader (파일 읽는 객체)
                // 자바스크립트가 제공하는 내장 객체 중 하나
                // - 웹 애플리케이션이
                //   비동기적으로 데이터를 읽기 위하여
                //   읽을 파일을 가리키는 File 객체
                // - 읽어들인 파일을 사용자 컴퓨터에 저장할 수 있다.
        
                reader.readAsDataURL(e.target.files[0]);
                // FileReader.readAsDataURL("파일정보")
                // -> 지정된 파일을 읽기 시작함
        
                // FileReader.onload : 파일 읽기가 완료 되었을 때의 동작을 지정
                reader.onload= event => {
                    // console.log(event.target);
        
                    // event.target.result : 읽어진 파일 결과(실제 이미지 파일)의 경로 
        
                    // img 태그의 src 속성으로 읽은 이미지 파일 경로 추가
                    // == 이미지 미리보기
                    profileImage.setAttribute("src", event.target.result);
    
                    deleteCheck = 1;
                }
            } else { // 취소가 눌러진 경우
    
                // 초기 이미지로 다시 변경
                profileImage.setAttribute("src", originalImage);
                deleteCheck = -1;
            }
        });
    
        // x버튼이 클릭됐을 경우 -> 기본 이미지로 변경
        deleteImage.addEventListener("click", ()=>{
    
            profileImage.setAttribute("src","/resources/images/member/프로필.PNG")
            inputImage.value="";
            deleteCheck = 0;
        });
    }

})

function profileValidate() {

    // 이미지가 없음 -> 있음
    if (!initCheck && deleteCheck == 1) {
        return true;
    }

    // 있음 -> 없음(x버튼)
    if (initCheck && deleteCheck == 0) {
        return true;
    }

    // 있음 -> 있음(새로운 이미지 업로드)
    if (initCheck && deleteCheck == 1) {
        return true;
    }

    alert("이미지 변경 후 클릭하세요")
    return false;
}
