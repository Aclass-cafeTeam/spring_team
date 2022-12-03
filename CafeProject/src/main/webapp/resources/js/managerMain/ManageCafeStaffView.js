const searchmemberBtn = document.getElementById("searchmemberBtn");
const search_result = document.getElementById("search_result");


/* 스탭 지정할 멤버 검색해보기 */
searchmemberBtn.addEventListener("click", function () {


  let mem_srch = document.getElementById("mem_srch").value;
  let searchType = document.getElementById("searchType").value;
  $("#search_result").empty(); // id가 "search_result"인 요소의 자식 요소를 모두 삭제함.
  if(mem_srch == ''){
    alert("검색어를 입력하세요.")
  }else{
      $.ajax({
        // 디비에서 강제 탈퇴에서 컬럼 탈퇴 사유 'I'로 수정 
        //('F': 재가입 불가) 
        
        url: "/SearchMemberStepView",
        data: { 
                "searchType"  : searchType,
                "SearchMember"  : mem_srch,
                "message"      : ""
        },
        async : false,
        type: "POST",
        dataType: "JSON", // 응답 데이터의 형식이 JSON이다. -> 자동으로 JS 객체로 변환
        success: (result) => {
          document.getElementById("memberInfoList").classList.add("memberInfoListdisplay");
          document.getElementById("smt_btn").classList.add("btn_areadisplay");
          /*   document.getElementById("memberInfoList").style.display ="block";
            document.getElementById("smt_btn").style.display ="block"; */
            
            if(result.searchMemberResult == null){
              const li = document.createElement("li"); //부모
              li.id = 'memberInfo_null';
              li.setAttribute("name", "memberInfo");
              const p = document.createElement("p"); //부모
              p.innerText ="검색한 회원의 정보가 없습니다.";

              search_result.append(li);
              search_result.append(p);


            }else{
                
              document.getElementById("electedStaffId").value = result.searchMemberResult.memberEmail;
              document.getElementById("electedStaffStopFL").value = result.searchMemberResult.memberDeleteFlag;
              document.getElementById("electedStaffauthorityNo").value = result.searchMemberResult.authorityNo;
                const li = document.createElement("li"); //부모
                li.id = "memberInfo_"+result.searchMemberResult.memberEmail;
                li.setAttribute("name", "memberInfo");
                li.setAttribute("id", "memberInfo_{"+result.searchMemberResult.memberEmail+"}");

                    const div = document.createElement("div"); //li 자식
                    div.classList.add("info"); 
                
                    const input = document.createElement("input"); //div 자식
                    input.classList.add("check");
                    input.classList.add("_click(ManageCafeStaff|MemberInfo)");
                    input.setAttribute("name", "electedStaffId");
                    input.setAttribute("id", "electedStaffId_"+result.searchMemberResult.memberEmail);
                    input.setAttribute("type", "radio");
                    input.setAttribute("value", "item.memberEmail");
                    //
                    const img = document.createElement("img"); //div 자식
                    img.classList.add("thmb");
                    img.setAttribute("src", result.searchMemberResult.profileImage);
                
                    const label = document.createElement("label"); //div 자식
                    label.classList.add("item");
                    label.classList.add("_name");
                    label.classList.add("_click(ManageCafeStaff|MemberInfo)");
                    label.classList.add("_stopDefault");
                    img.setAttribute("for", "r1");
                    label.innerText = result.searchMemberResult.memberNickname+"("+result.searchMemberResult.memberEmail+")";

                
                    search_result.append(li);
                    li.append(div);

                    div.append(input);
                    div.append(img);
                    div.append(label);
                
                

            }
              


          
        },
        error: () => {
            console.log("검색 실패");
        }


      });
  }


});

const smt_btn = document.getElementById("smt_btn");

smt_btn.addEventListener("click", function () {
  if($('input:radio[name=electedStaffId]').is(':checked')){
      
    
      if($('input[name =authorityNo]').val() == 0 ||$('input[name =authorityNo]').val() == 1
      ||$('input[name =memberDeleteFlag]').val()=='S'||
      $('input[name =subManagerFL]').val()=='true'){
        
        if($('input[name =loginMemberauthorityNo]').val() != 0){
          alert("권한 카페매니저가 아니면 매니저 임명이 불가능합니다.")
        }else{
          if($('input[name =memberDeleteFlag]').val()=='S'){
            alert("활동 정지된 멤버를 매니저로 임명 할 수 없습니다. 활동 정지 해제 후 임명해주세요.")
          }else{
            if($('input[name =authorityNo]').val() == 0){
              alert("매니저로 임명된 멤버는 매니저로 임명할 수 없습니다.")
            }else{
              if($('input[name =subManagerFL]').val() == 'true'){
                alert("부 매니저는 1명만 임명할 수 있습니다. 부 매니저 삭제 후 임명해주세요.")
              }else{
                
                /* 이제 form 태그로 보내기 */
                document.forms["staffFrm"].submit();

              }
              
            }
          }
          
        }
    
      }

    

  }else{
    alert("멤버를 선택해주세요.")
  }

});

/* 부매니저 삭제 */
const staffDelete = document.getElementById("staffDelete");

staffDelete.addEventListener("click", function () {
  if($('input[name =cafeStaffauthorityNo]').val() == '0'){
    document.getElementById("DeleteLayer").style.display = "block";
    document.getElementById("DeleteLayer").style.overflow = "visible";
    document.getElementById("DeleteLayer").style.zoom = "1";

    $('.deleteStaffCon').click(function() {
      /* 이제 form 태그로 보내기 */
      document.forms["deletestafffrm"].submit();
    });
  }else{
    alert("카페(총) 매니저만 삭제 권한이 있습니다.")
  }
})

$('.clse').click(function() {
  document.getElementById("DeleteLayer").style.display = "none";
});