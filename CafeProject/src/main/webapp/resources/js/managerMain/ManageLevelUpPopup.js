const checkObj = window.opener.CheckValue();
const memberCount = document.getElementById("memberCount");
const lst_member = document.getElementById("lst_member");

memberCount.innerText = checkObj["checkNum"];
console.log(checkObj["checkNum"]);
console.log(checkObj);

const memberLevelNoresult = window.opener.document.getElementById("_selectMemberLevel").value;
document.getElementById("memberLevelSelect").value =memberLevelNoresult;

// $(document).ready(function(){

// });
$(document).ready(function(){
    for (let item of checkObj["chk_val"]) {
        const li = document.createElement("li"); //부모
    
        const div = document.createElement("div"); //li 자식
        div.classList.add("pers_nick_area"); 
    
        const span = document.createElement("span"); //div 자식
        span.classList.add("img");
        //
        const img = document.createElement("img"); //div 자식
        img.setAttribute("src", opener.document.getElementById("checkImg"+item).getAttribute("src") );
    
        const span2 = document.createElement("span"); //div 자식
        span2.classList.add("nick");
        span2.innerText = opener.document.getElementById("checkMember"+item).innerText;
    
        lst_member.append(li);
        li.append(div);
        div.append(span);
        span.append(img);
        div.append(span2);
    }
});

document.getElementById("_click(Close)").addEventListener("click", function () {
    // 현재 창 닫기

    if(confirm("변경을 취소하시겠습니까?")){
        window.close();
    }
})





