/* 로그아웃 버튼 눌렀을 때 */
const signOut= document.getElementById("signOut");

if(signOut != null){
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

// 카페정보 버튼
const btn1 = document.getElementById("btn1");
// 나의활동 버튼
const btn2 = document.getElementById("btn2");

btn2.addEventListener("click", function(){ //나의 활동 정보가 보이고 싶을 때 
    
    const info = document.querySelectorAll("#content > .basicCafe-info")[0];
   
    const active = document.querySelectorAll("#content > .basicMy-active")[0];
    
    if(info.classList.contains("basicCafe-info")){
        info.classList.remove("cafe-info");  //카페정보 보일 때
        info.classList.add("cafe-info2");  //카페정보 안 보일 때
        
        active.classList.remove("my-active");  //나의 정보가 안 보일때 
        active.classList.add("my-active2"); //나의 정보가 보일때 
    }

});

btn1.addEventListener("click", function(){//카페 정보가 보이고 싶을 때 
    
    const info = document.querySelectorAll("#content > .basicCafe-info")[0];

    const active = document.querySelectorAll("#content > .basicMy-active")[0];

    if(active.classList.contains("basicMy-active")){
        active.classList.remove("my-active2"); //나의 정보가 보일때 
        active.classList.add("my-active");//나의 정보가 안 보일때
        
        info.classList.remove("cafe-info2"); //카페정보 안 보일 때
        info.classList.add("cafe-info"); //카페정보 보일 때
    }

});

