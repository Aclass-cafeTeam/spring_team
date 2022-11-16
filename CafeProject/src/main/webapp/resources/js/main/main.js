/* 로그아웃 버튼 눌렀을 때 */
const signOut= document.getElementById("signOut");

if (signOut != null) {
    signOut.addEventListener("click", function(event){
    
        if (!confirm("로그아웃하시겠습니까?")) {
            // 취소(아니오) 버튼 클릭 시 이벤트
            event.preventDefault();
            return;
        } else {
            // 확인(예) 버튼 클릭 시 이벤트
        }
    });
}