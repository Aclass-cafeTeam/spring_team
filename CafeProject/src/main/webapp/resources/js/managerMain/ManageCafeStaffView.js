const searchmemberBtn = document.getElementById("searchmemberBtn");
const search_result = document.getElementById("search_result");
searchmemberBtn.addEventListener("click", function () {


  let mem_srch = document.getElementById("mem_srch").value;
  let searchType = document.getElementById("searchType").value;
  
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