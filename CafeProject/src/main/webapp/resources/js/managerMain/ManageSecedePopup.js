const checkObj = window.opener.CheckValue();
const memberCount = document.getElementById("memberCount");
const lst_member = document.getElementById("lst_member");

memberCount.innerText = checkObj["checkNum"];
console.log(checkObj["checkNum"]);
console.log(checkObj);


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

document.getElementById("rejectreason").addEventListener("click", function () {
    this.value = "";
    $('input[id=reason4]').prop("checked", true);
});

document.getElementById("reason4").addEventListener("click", function () {
  document.getElementById("rejectreason").value = "";
  document.getElementById("rejectreason").focus();
});

document.getElementById("_click(Close)").addEventListener("click", function () {
    // 현재 창 닫기

    if(confirm("강제 탈퇴 창을 나가겠습니까?")){
        window.close();
    }
})



const Submit = document.getElementById("Submit");
Submit.addEventListener("click", (e) => {

    let memberEmail1 = checkObj["chk_val"];
    let memberCount1 = checkObj["checkNum"]; 
    let comment1 = "";

    let radio= $('input[type=radio]:checked').val();
    switch (radio) {
        case "0":
            comment1 ="성인/도박 등 불법광고 및 스팸 활동";
            break;
        case "1":
            comment1 ="바람직하지 않은 활동(광고, 도배, 욕설, 비방 등)";
            break;
        case "2":
            comment1 ="우리 카페 내 자체 운영 원칙에 위배되는 활동";
            break;
        case "3":
            comment1 ="카페폐쇄를 위한 탈퇴 진행";
        break;
        case "4":
            comment1 = $('#rejectreason').val();
            break;
    }
    $.ajax({

        url: "/updateActivityStopMember",
        data: { "radioNum"     : radio,
                "memberEmail"  : memberEmail1,
                "memberCount"  : memberCount1,
                "comment"      : comment1,
                "message"      : ""
        },
        type: "POST",
        dataType: "JSON", // 응답 데이터의 형식이 JSON이다. -> 자동으로 JS 객체로 변환
        success: (result) => {
            if(result.message === "활동 정지 등록에 실패하셨습니다."){
                
                alert(result.message);
                window.close();

            }else{

                alert(result.message);
                
                window.close();

            }
        },
        error: () => {
            console.log("멤버 활동 정지 반영 실패")
        }


    });

});

