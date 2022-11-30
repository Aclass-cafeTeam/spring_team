const selectLimit = document.getElementById("limit");
selectLimit.addEventListener("change",function(){
  document.forms["sortForcedSecessionMemberFrm"].submit();
});

window.onload = function(){
  var limitresult = document.getElementById("limit").className;
  $("#limit").val(limitresult).prop('selected', true);
}

const searchMember =document.getElementById("searchMember");
searchMember.addEventListener("focus",function(){
  this.value = "";
  this.style.color = '#404040';
});

/* 테이블 체크박스 */
$("._checkAll").click(function() {
  if($("._checkAll").is(":checked")) $("input[name=secedeIds]").prop("checked", true);
  else $("input[name=secedeIds]").prop("checked", false);
});


function CheckValue(){
  let checkNum = $('._checkMember:checkbox:checked').length;
  let chk_val = [];
  $('._checkMember:checkbox:checked').each(function(){
    chk_val.push($(this).val());   //회원 이메일 체크된 값만 넣어주기
  });
  const checkObj = {
    "checkNum": checkNum,
    "chk_val": chk_val,
  };
  return checkObj;
}

const releaseStopButton = document.getElementById("ReleaseSecedeMember");
releaseStopButton.addEventListener("click", function () {
  const checkObj = CheckValue();

  let memberEmail1 = checkObj["chk_val"];
  let memberCount1 = checkObj["checkNum"]; 

  if(checkObj["checkNum"] <= 0){

    alert("선택된 강제 탈퇴 멤버가 없습니다.");
  
  }else{
    if(confirm("재가입이 가능하도록 처리하시겠습니까?")){

      $.ajax({
        // 디비에서 강제 탈퇴에서 컬럼 탈퇴 사유 'I'로 수정 
        //('F': 재가입 불가) 
        
        url: "/updateReleaseSecedeMember",
        data: { 
                "memberEmail"  : memberEmail1,
                "memberCount"  : memberCount1,
                "message"      : ""
        },
        type: "POST",
        dataType: "JSON", // 응답 데이터의 형식이 JSON이다. -> 자동으로 JS 객체로 변환
        success: (result) => {
            if(result.message === "재가입 가능 변경에 실패하셨습니다."){
                
                alert(result.message);
        

            }else{

                for(let key of result.memberEmail){
                      
                  document.getElementById('secessionFL'+key).innerText = 'N';
                  
                }

                alert(result.message);
            
            }
        },
        error: () => {
            console.log("재가입 가능 변경 실패")
        }


      });

    }
  }
});