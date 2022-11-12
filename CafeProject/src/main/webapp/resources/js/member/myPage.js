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