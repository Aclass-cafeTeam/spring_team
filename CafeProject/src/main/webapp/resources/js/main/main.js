/* 로그아웃 버튼 눌렀을 때 */
const signOut= document.getElementById("signOut");

signOut.addEventListener("click", function(event){
    
    if (!confirm("로그아웃하시겠습니까?")) {
        // 취소(아니오) 버튼 클릭 시 이벤트
        event.preventDefault();
        return;
    } else {
        // 확인(예) 버튼 클릭 시 이벤트
    }


});

// 카페정보 버튼
const btn1 = document.getElementById("btn1");
// 나의활동 버튼
const btn2 = document.getElementById("btn2");



btn2.addEventListener("click", function(){
    
    
 
    const info = document.querySelectorAll("#content > .cafe-info")[0];
    const info1 = Array.from(info);
   

    const active = document.querySelectorAll("#content > .my-active")[0];
    const active1 = Array.from(active);
    
    

    if(info.className == "cafe-info"){
        info.classList.remove("cafe-info");
        info.classList.add("cafe-info2");
        
        active.classList.remove("my-active");
        active.classList.add("my-active2");
    }

});