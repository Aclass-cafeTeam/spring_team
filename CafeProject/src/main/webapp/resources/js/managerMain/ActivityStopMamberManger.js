const selectLimit = document.getElementById("limit");
selectLimit.addEventListener("change",function(){
  document.forms["sortActivityStopMemberFrm"].submit();
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
  if($("._checkAll").is(":checked")) $("input[name=memberids]").prop("checked", true);
  else $("input[name=memberids]").prop("checked", false);
});

function CheckValue(){
  let checkNum = $('._checkMember:checkbox:checked').length;
  let chk_val = [];
  let chk_level =[];
  $('._checkMember:checkbox:checked').each(function(){
    chk_val.push($(this).val());   //회원 이메일
  });
  const checkObj = {
    "checkNum": checkNum,
    "chk_val": chk_val,
  };
  return checkObj;
}

const secedeButton = document.getElementById("_forceWithdrawal"); //강제탈퇴

//강제탈퇴
secedeButton.addEventListener("click", function () {

  const checkObj = CheckValue();
  if(checkObj["checkNum"] <= 0){

      alert("멤버를 선택해주세요");
    
  }else{
    const options = "width=508, height=494";
    window.open("/manager/ManageSecedePopup", "popupWindow", options) 

  }
  
});

const releaseStopButton = document.getElementById("ReleaseStopMember"); //활동정지 해체 버튼(레이어 디스플레이용)

releaseStopButton.addEventListener("click", function () {

  const checkObj = CheckValue();
  if(checkObj["checkNum"] <= 0){

      alert("선택된 활동정지 멤버가 없습니다.");
    
  }else{
    document.getElementById("ReleaseMemberLayer").style.display = "block";
  }
  
});

$("._hideLayer").click(function() {
  document.getElementById("ReleaseMemberLayer").style.display = "none";
});

const releaseButtonAjax = document.getElementById("releaseButtonAjax"); //활동정지 해제 DB 변경 및 진짜 매핑
releaseButtonAjax.addEventListener("click", function () {
  const checkObj = CheckValue();

    let memberEmail1 = checkObj["chk_val"];
    let memberCount1 = checkObj["checkNum"]; 

    $.ajax({
        // 디비에서 활동정지 테이블에서 컬럼 삭제 DELETE 
        // 멤버 테이블에서 활동 여부 'N'
        url: "/updateReleaseStopMember",
        data: { 
                "memberEmail"  : memberEmail1,
                "memberCount"  : memberCount1,
                "message"      : ""
        },
        type: "POST",
        dataType: "JSON", // 응답 데이터의 형식이 JSON이다. -> 자동으로 JS 객체로 변환
        success: (result) => {
            if(result.message === "활동이 가능한 멤버로 변경 실패하셨습니다."){
                
                alert(result.message);
                window.close();

            }else{

                for(let key of result.memberEmail){
                      
                  opener.$('tr[memberid='+key+']').remove();
                  
                }

                alert(result.message);
                
                window.close();

            }
        },
        error: () => {
            console.log("멤버 활동 정지 해제 반영 실패")
        }


    });
});