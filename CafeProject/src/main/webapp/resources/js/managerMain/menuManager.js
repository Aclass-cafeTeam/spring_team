
/* 게시판 추가  게시판 클릭---맨 왼쪽 통합게시판(일반 게시판)*/
$(".add_lst_btn a").click(function() {
  console.log("클릭");
  document.getElementById("plusBtn").classList.add("on");

  $('.add_lst_btn li').removeClass("on");
  $('.add_lst_btn2 li').removeClass("on");
  this.parentNode.classList.add('on');

  const bordTitleName= this.firstElementChild;
  document.getElementById("bordTitleNameIn").value = bordTitleName.innerText;
  document.getElementById("bordTitleFormIn").value = bordTitleName.title;

  for(i=0; i<$(".valueRemove2").length;i++){
    $('.valueRemove2')[i].value ="";
  } 
  
});

/* 메인 카테고리 추가 --맨 왼쪽 그룹 제목(메인 카테고리 클릭)*/
$(".add_lst_btn2 a").click(function() {
  console.log("클릭");
  document.getElementById("plusBtn").classList.add("on");

  $('.add_lst_btn li').removeClass("on");
  this.parentNode.classList.add('on');


  const mainCategoryOrderAdd = document.getElementsByClassName("borderNone")[0].lastElementChild.getAttribute('number');
  document.getElementById("mainCategoryAdd").value = mainCategoryOrderAdd; //메인카테고리 마지막 순서

  const mainTitlenameIn= document.getElementById("mainTitlenameIn").innerText;
  document.getElementById("mainCategoryNameAdd").value = mainTitlenameIn;

  for(i=0; i<$(".valueRemove3").length;i++){
    $('.valueRemove3')[i].value ="";
  }
  
});





/* 게시판 순서 위 아래 삭제 버튼 세팅 및 값 세팅 */
/* 게시판 기본 게시판을 제외한 나머지 게시판들  */
$(".mainCategoryOn a").click(function() {
  $('.edit_btn_area li').addClass("on");

  $('.edit_lst_box li').removeClass("on");
  this.parentNode.classList.add('on');

  const mainCategoryName = this.parentNode.parentNode.id;

  document.getElementById("mainCategoryNameIn").value = mainCategoryName;

  const mainCategoryName2 = this.parentNode.parentNode.title;

  document.getElementById("mainCategoryNameIn2").value = mainCategoryName2;

  const boardAddOrder= document.getElementById(mainCategoryName).lastElementChild.lastElementChild.title;

  document.getElementById("boardOrderIn").value = boardAddOrder;

  document.getElementById("boardCodeIn").value= this.name;

  for(i=0; i<$(".valueRemove2").length;i++){
    $('.valueRemove2')[i].value ="";
  }

});



/* 메인 카테고리 클릭 하면 a태그 class = mainCategoryClick */
/* 그냥 게시판 클릭하면 a 태그 class= ge_v1 */
/* 게시판 클릭 or 메인 카테고리 별 누르면 상세설명 세팅 */
$(".mainCategoryClick").click(function() {
  document.getElementById("mainCategoryNameupdateIN").value = document.getElementById("mainCategoryNameIn2").value;
  document.getElementById("MainCategoryUpdate").value = document.getElementById("mainCategoryNameIn").value;

  document.getElementsByClassName("set_box")[0].classList.remove("set_boxBasic");
  document.getElementsByClassName("set_box")[1].classList.remove("set_boxON");
  document.getElementsByClassName("set_box")[2].classList.add("set_boxON");
  document.getElementById("boardCodeUpdate").value ="";
  //$('.valueRemov2').value ="";
 
});

$(".ge_v1click").click(function() {

  if(this.parentNode.parentNode.classList.contains("mainCategoryNone")){
    
    $('.edit_lst_box li').removeClass("on");
    document.getElementById("mainCategoryNameIn").value ="";
    document.getElementById("mainCategoryNameIn2").value ="";
    document.getElementById("boardOrderIn").value ="";
    document.getElementById("boardCodeIn").value ="";
    //document.getElementById("settingboardName").readOnly = true;
    document.getElementById("settingboardName").disabled = true;
    document.getElementById("inputDisabled").value =true;
    //document.getElementById("boardCodeUpdate").value =
    
  }else{
    document.getElementById("settingboardName").disabled = false;
    document.getElementById("inputDisabled").value =false;
  }
  const thisID = this.id;
    document.getElementById("boardCodeUpdate").value = this.name;
    document.getElementById("MainCategoryUpdate").value = "";
    //document.getElementById("boardCodeIn").value;
    document.getElementById("settingboardName").value = this.innerText;
    document.getElementById("beginboardName").value = this.innerText;
    document.getElementById("LevelNo").value =document.getElementById("boardMemberLevelNo"+thisID).value;
                
    if(document.getElementById("boardLikeYN"+thisID).value == 'Y'){
            $("#in_type6").prop("checked", true);
    }else{
            $("#in_type6").prop("checked", false);
    }

    if(document.getElementById("titleTagYN"+thisID).value == 'Y'){
        $("#in_type7").prop("checked", true);
    }else{
        $("#in_type7").prop("checked", false);
    }

    document.getElementsByClassName("set_box")[0].classList.remove("set_boxBasic");
    document.getElementsByClassName("set_box")[2].classList.remove("set_boxON");
    document.getElementsByClassName("set_box")[1].classList.add("set_boxON");

    //$('.valueRemove').value ="";
    //id="titleTagYNboard${var.boardCode}"
   //boardLikeYNboard${var.boardCode}
});




/* +(추가) 버튼 눌렀을 때 이벤트 */
$('#BoardPlusBtn').click(function() {
  const mainCategoryNameIn = document.getElementById("mainCategoryNameIn").value;  //mainCategory.B
  const mainCategoryNameIn2 = document.getElementById("mainCategoryNameIn2").value; //질문코너
  const bordTitleNameIn = document.getElementById("bordTitleNameIn").value;
  const boardOrderIn = document.getElementById("boardOrderIn").value;
  const bordTitleFormIn = document.getElementById("bordTitleFormIn").value;
  const boardCodeIn = document.getElementById("boardCodeIn").value;

  /* 메인 카테고리 추가(그룹)  이벤트*/
  const mainCategoryAdd = document.getElementById("mainCategoryAdd").value; //4
  const mainCategoryNameAdd = document.getElementById("mainCategoryNameAdd").value; //그룹 제목

  if(mainCategoryAdd != '' && mainCategoryNameAdd !=''){
    alert("메인 카테고리 넣기");

    $.ajax({
      url: "/insertMainCategoryBoardType",
      data:{
        "mainCategoryAdd" : mainCategoryAdd,           //게시판이 추가되는 메인카테고리(메인 카테고리 마지막 순서 번호)
        "mainCategoryNameAdd" : mainCategoryNameAdd,   //게시판이 추가되는 메인카테고리 이름

      },
      type: "POST",
      dataType:"JSON",
      async: false,
      success:(result)=>{
        if(result.message != '게시판 카테고리 추가 실패했습니다.'){

          alert(result.message);

          const ul = document.createElement("ul");
          ul.id = "mainCategory."+result.newBoard.mainCategoryNo;
          ul.setAttribute("class","mainCategory");
          ul.classList.add("mainCategoryOn");
          ul.setAttribute("title",result.newBoard.mainCategoryName);
          ul.setAttribute("number",result.newBoard.mainCategoryNo);

          const li = document.createElement("li");
          li.setAttribute("class","h_menu_tit");

          const a = document.createElement("a");
          a.classList.add("mainCategoryClick");
          const span = document.createElement("span");

          span.setAttribute("title","그룹 제목");
          span.id = result.newBoard.mainCategoryName;
          span.setAttribute("class",result.newBoard.mainCategoryNo);
          span.classList.add("mainCategory"+result.newBoard.mainCategoryNo);
          span.innerText = "■ " + result.newBoard.mainCategoryName;

          const li2 = document.createElement("li");
          li2.setAttribute("class","");
          li2.setAttribute("style","height: 0px; width: 0px;");
          const a2 = document.createElement("a");
          a2.setAttribute("class","");
          a2.setAttribute("id","");
          a2.setAttribute("title","0");
          a2.setAttribute("name","0");
          const span2 = document.createElement("span");


          document.getElementById("borderNone").append(ul);
          ul.append(li);
          ul.append(li2);
          li.append(a);
          a.append(span);
          li2.append(a2);
          a2.append(span2);

          //<ul id="mainCategory.4" class="mainCategory mainCategoryOn" title="갤러리 자료" number="4"></ul>
          /* <li data-v-bd0068e8="" class="h_menu_tit">
                <a>
                <span data-v-bd0068e8="" title="그룹 제목" id="여행 정보" class="2">■ 여행 정보</span>
                </a>
            </li> 

            <li class="" style="height: 0px; width: 0px;">
                <a class="" id="" title="0" name="0"><span></span></a>
            </li>
          */

          /* 색깔 바꾼걸로 변경 */
          $('.edit_btn_area li').addClass("on");

          $('.edit_lst_box li').removeClass("on");
          //li.classList.add('on');  
          a.parentNode.classList.add('on');  
          /* 색깔 바꾼걸로 변경 */
          document.getElementById("mainCategoryNameIn").value = "mainCategory."+result.newBoard.mainCategoryNo;
          document.getElementById("mainCategoryNameIn2").value =result.newBoard.mainCategoryName;

          document.getElementById("mainCategoryAdd").value =result.newBoard.mainCategoryNo;
          document.getElementById("mainCategoryNameAdd").value =result.newBoard.mainCategoryName;

          document.getElementById("boardOrderIn").value ="0";
          //

          /* 상세설정 세팅 */
          document.getElementById("mainCategoryNameupdateIN").value = result.newBoard.mainCategoryName;
          document.getElementById("MainCategoryUpdate").value = result.newBoard.mainCategoryNo;

          document.getElementsByClassName("set_box")[0].classList.remove("set_boxBasic");
          document.getElementsByClassName("set_box")[1].classList.remove("set_boxON");
          document.getElementsByClassName("set_box")[2].classList.add("set_boxON");

          /* for(i=0; i<$(".valueRemove2").length;i++){
            $('.valueRemove2')[i].value ="";
          } */

          $('.edit_lst_area').scrollTop(document.getElementById(ul.id).offsetTop-450);

          for(i=0; i<$(".valueRemove3").length;i++){
            $('.valueRemove3')[i].value ="";
          }

          $(".mainCategoryOn a").click(function() {
            $('.edit_btn_area li').addClass("on");
          
            $('.edit_lst_box li').removeClass("on");
            this.parentNode.classList.add('on');
          
            const mainCategoryName = this.parentNode.parentNode.id;
          
            document.getElementById("mainCategoryNameIn").value = mainCategoryName;
          
            const mainCategoryName2 = this.parentNode.parentNode.title;
          
            document.getElementById("mainCategoryNameIn2").value = mainCategoryName2;
          
            const boardAddOrder= document.getElementById(mainCategoryName).lastElementChild.lastElementChild.title; ////////변경
          
            document.getElementById("boardOrderIn").value = boardAddOrder;
          
            document.getElementById("boardCodeIn").value= this.name;

            for(i=0; i<$(".valueRemove2").length;i++){
              $('.valueRemove2')[i].value ="";
            }
          
          });

          $(".mainCategoryClick").click(function() {
            document.getElementById("mainCategoryNameupdateIN").value = document.getElementById("mainCategoryNameIn2").value;
            document.getElementById("MainCategoryUpdate").value = document.getElementById("mainCategoryNameIn").value;
          
            document.getElementsByClassName("set_box")[0].classList.remove("set_boxBasic");
            document.getElementsByClassName("set_box")[1].classList.remove("set_boxON");
            document.getElementsByClassName("set_box")[2].classList.add("set_boxON");
          
            //$('.valueRemov2').value ="";
           
          });

          $(".ge_v1click").click(function() {
            const thisID = this.id;
              document.getElementById("boardCodeUpdate").value = document.getElementById("boardCodeIn").value;
              document.getElementById("settingboardName").value = this.innerText;
              document.getElementById("LevelNo").value =document.getElementById("boardMemberLevelNo"+thisID).value;
                          
              if(document.getElementById("boardLikeYN"+thisID).value == 'Y'){
                      $("#in_type6").prop("checked", true);
              }else{
                      $("#in_type6").prop("checked", false);
              }
          
              if(document.getElementById("titleTagYN"+thisID).value == 'Y'){
                  $("#in_type7").prop("checked", true);
              }else{
                  $("#in_type7").prop("checked", false);
              }
          
              document.getElementsByClassName("set_box")[0].classList.remove("set_boxBasic");
              document.getElementsByClassName("set_box")[2].classList.remove("set_boxON");
              document.getElementsByClassName("set_box")[1].classList.add("set_boxON");
          
              //$('.valueRemove').value ="";
              //id="titleTagYNboard${var.boardCode}"
             //boardLikeYNboard${var.boardCode}
          });

        
        }else{
          alert(result.message);
        }
        
      },
      error: ()=>{
        console.log("메인 카데고리 추가 실패");
      }

    }); 


  }else{

        //게시판 추가했을 떄 코드
        if(mainCategoryNameIn != '' && bordTitleNameIn !='' && boardOrderIn !=''){

          alert("값 넣기 성공");
          $.ajax({
            url: "/insertBoardType",
            data:{
              "mainCategoryNameIn" : mainCategoryNameIn, //mainCategory.3
              "mainCategoryNameIn2" : mainCategoryNameIn2,//질문 코너
              "bordTitleNameIn" : bordTitleNameIn,//앨범형 통합게시판 
              "boardOrderIn" : boardOrderIn,// 현재 게시판 마지막 순서 (넣어줄 때 +1 해줘야함)
              "bordTitleFormIn" : bordTitleFormIn,//A

            },
            type: "POST",
            dataType:"JSON",
            async: false,
            success:(result)=>{
              if(result.message != '게시판 추가에 실패했습니다.'){

                alert(result.message);
                /* 요소 만들어서 넣기 */
                /* 인풋태그 5개*/
                const input = document.createElement("input");
                input.setAttribute("type","hidden");
                input.id = "varboardCodeboard" + result.newBoard.boardCode;
                input.setAttribute("name","varboardCode");
                input.setAttribute("value",result.newBoard.boardCode);

                const input2 = document.createElement("input");
                input2.setAttribute("type","hidden");
                input2.id = "varboardNameboard" + result.newBoard.boardCode;
                input2.setAttribute("name","varboardName");
                input2.setAttribute("value",result.newBoard.boardName);

                const input3 = document.createElement("input");
                input3.setAttribute("type","hidden");
                input3.id = "titleTagYNboard" + result.newBoard.boardCode;
                input3.setAttribute("name","titleTagYN");
                input3.setAttribute("value",result.newBoard.titleTagYN);

                const input4 = document.createElement("input");
                input4.setAttribute("type","hidden");
                input4.id = "boardLikeYNboard" + result.newBoard.boardCode;
                input4.setAttribute("name","boardLikeYN");
                input4.setAttribute("value",result.newBoard.boardLikeYN);

                const input5 = document.createElement("input");
                input5.setAttribute("type","hidden");
                input5.id = "boardMemberLevelNoboard" + result.newBoard.boardCode;
                input5.setAttribute("name","boardMemberLevelNo");
                input5.setAttribute("value",result.newBoard.boardMemberLevelNo);
                /* 인풋태그 5개*/

                const li = document.createElement("li");
                
                const a = document.createElement("a");
                li.setAttribute("class","");
                a.id = "board" + result.newBoard.boardCode;//board${var.boardCode}
                a.setAttribute("title", result.newBoard.boardOrder);  // 보드 순서 잘하기!
                a.setAttribute("class", result.newBoard.boardForm);
                a.classList.add("ge_v1click");
                a.classList.add("ge_v1");
                if(result.newBoard.boardForm == 'A'){
                  a.classList.add("A"); //a.classList.add("ge_v1");
                }
                if(result.newBoard.boardForm == 'B'){
                  a.classList.add("B"); //a.classList.add("ge_v13");
                  a.classList.add("ge_v13"); //a.classList.add("ge_v13");
                }
                a.setAttribute("name", result.newBoard.boardCode);

                const span = document.createElement("span");
                span.innerText = result.newBoard.boardName;

                //document.getElementById(mainCategoryNameIn).append(input);
                //document.getElementById(mainCategoryNameIn).append(input2);
                //document.getElementById(mainCategoryNameIn).append(input3);
                //document.getElementById(mainCategoryNameIn).append(input4);
                //document.getElementById(mainCategoryNameIn).append(input5);

                document.getElementById(mainCategoryNameIn).append(li);
                li.append(input);
                li.append(input2);
                li.append(input3);
                li.append(input4);
                li.append(input5);
                li.append(a);
                a.append(span);
                document.getElementById("boardOrderIn").value = result.newBoard.boardOrder; //순서 +1시키는 코드

                /* 색깔 새로 생긴 카테고리에 설정하고 세팅값 변경 */
                $('.edit_btn_area li').addClass("on");
                
                $('.edit_lst_box li').removeClass("on");
                a.parentNode.classList.add('on');

                
                //document.getElementById("boardOrderIn").value = 위에 세팅값 변경해줌 
                document.getElementById("boardCodeIn").value =result.newBoard.boardCode;

                /* 상세설정 세팅 */
                document.getElementById("boardCodeUpdate").value = result.newBoard.boardCode;
                document.getElementById("settingboardName").value = result.newBoard.boardName;
                document.getElementById("LevelNo").value =result.newBoard.boardMemberLevelNo;
                
                if(result.newBoard.boardLikeYN == 'Y'){
                  $("#in_type6").prop("checked", true);
                }else{
                  $("#in_type6").prop("checked", false);
                }

                if(result.newBoard.titleTagYN == 'Y'){
                  $("#in_type7").prop("checked", true);
                }else{
                  $("#in_type7").prop("checked", false);
                }

                document.getElementsByClassName("set_box")[0].classList.remove("set_boxBasic");
                document.getElementsByClassName("set_box")[2].classList.remove("set_boxON");
                document.getElementsByClassName("set_box")[1].classList.add("set_boxON");

                /* for(i=0; i<$(".valueRemove").length;i++){
                  $('.valueRemove')[i].value ="";
                }
                 */
                /* 위치이동 */
                $('.edit_lst_area').scrollTop(document.getElementById(a.id).offsetTop-450);

                $(a).click(function() {
                  $('.edit_btn_area li').addClass("on");
                
                  $('.edit_lst_box li').removeClass("on");
                  this.parentNode.classList.add('on');
                
                  const mainCategoryName = this.parentNode.parentNode.id;
                
                  document.getElementById("mainCategoryNameIn").value = mainCategoryName;
                
                  const mainCategoryName2 = this.parentNode.parentNode.title;
                
                  document.getElementById("mainCategoryNameIn2").value = mainCategoryName2;
                
                  const boardAddOrder= document.getElementById(mainCategoryName).lastElementChild.lastElementChild.title;//.lastElementChild.firstElementChild.title;
                
                  document.getElementById("boardOrderIn").value = boardAddOrder;

                  document.getElementById("boardCodeIn").value= this.name;
                
                });

                $(".ge_v1click").click(function() {
                  const thisID = this.id;
                    document.getElementById("boardCodeUpdate").value = document.getElementById("boardCodeIn").value;
                    document.getElementById("settingboardName").value = this.innerText;
                    document.getElementById("LevelNo").value =document.getElementById("boardMemberLevelNo"+thisID).value;
                                
                    if(document.getElementById("boardLikeYN"+thisID).value == 'Y'){
                            $("#in_type6").prop("checked", true);
                    }else{
                            $("#in_type6").prop("checked", false);
                    }
                
                    if(document.getElementById("titleTagYN"+thisID).value == 'Y'){
                        $("#in_type7").prop("checked", true);
                    }else{
                        $("#in_type7").prop("checked", false);
                    }
                
                    document.getElementsByClassName("set_box")[0].classList.remove("set_boxBasic");
                    document.getElementsByClassName("set_box")[2].classList.remove("set_boxON");
                    document.getElementsByClassName("set_box")[1].classList.add("set_boxON");
                    
                    //$('.valueRemove').value ="";
                    //id="titleTagYNboard${var.boardCode}"
                   //boardLikeYNboard${var.boardCode}
                });


              }else{
                alert(result.message);
              }
              
            },
            error: ()=>{
              console.log("게시판 추가 실패");
            }



          }); 


        }else{
          alert("추가할 게시판 카테고리와 순서를 선택해주세요.");
        }





  }




});

document.getElementById("edt2_delete_button").addEventListener('click',function(){

  if(document.getElementById("boardCodeUpdate").value == ''){
    document.getElementById("mainCategoryNameupdateIN").value = document.getElementById("mainCategoryNameIn2").value;
    document.getElementById("MainCategoryUpdate").value = document.getElementById("mainCategoryNameIn").value;
  
    //document.forms["boardUpdateFrm"].reset();
  }else{

    if(document.getElementById("inputDisabled").value =='true'){
    
 
      //document.getElementById("settingboardName").readOnly = true;
      document.getElementById("settingboardName").disabled = true;
      //document.getElementById("boardCodeUpdate").value =
      
    }else{
      document.getElementById("settingboardName").disabled = false;
    }
    const thisID = document.getElementById("boardCodeUpdate").value;
      document.getElementById("settingboardName").value =  document.getElementById("beginboardName").value;
      document.getElementById("LevelNo").value =document.getElementById("boardMemberLevelNoboard"+thisID).value;
                  
      if(document.getElementById("boardLikeYNboard"+thisID).value == 'Y'){
              $("#in_type6").prop("checked", true);
      }else{
              $("#in_type6").prop("checked", false);
      }
  
      if(document.getElementById("titleTagYNboard"+thisID).value == 'Y'){
          $("#in_type7").prop("checked", true);
      }else{
          $("#in_type7").prop("checked", false);
      }

  }


})



document.getElementById("edt2_save_button").addEventListener('click',function(){


  document.forms["boardUpdateFrm"].submit();

});


document.getElementById("deleteBoardA").addEventListener('click',function(){

  if($("#mainCategoryNameIn").val()!=''){

    var confirmMessage ='';
    if($("#boardCodeIn").val() ==''){
      confirmMessage = '메인 카테고리를 삭제하시면 안에 게시판도 삭제됩니다. 정말 삭제하시겠습니까?';
    }else{
      confirmMessage = '해당 게시판을 삭제하시겠습니까?';
    }


    if(confirm(confirmMessage)){

      const mainCategoryNameIn = document.getElementById("mainCategoryNameIn").value; //삭제할 메인카테고리No
      const boardCodeIn = document.getElementById("boardCodeIn").value; //삭제할 게시판코드

      $.ajax({
        // 디비에서 delete가 아닌 보드
        url: "/deleteBoardType",
        data: { 
                "mainCategoryNameIn"  : mainCategoryNameIn,
                "boardCodeIn"  : boardCodeIn, //값이 들어 있으면 게시판 삭제 없으면 메인 카테고리 삭제
                "message"      : ""
        },
        type: "POST",
        dataType: "JSON", // 응답 데이터의 형식이 JSON이다. -> 자동으로 JS 객체로 변환
        success: (result) => {
            if(result.message === "삭제 실패되었습니다."){
                
              alert(result.message);
        
          
            }else{
              alert(result.message);
              

              if($("#boardCodeIn").val()==''){ //메인 카테고리 삭제
                
                document.getElementById(mainCategoryNameIn).remove(); 


              }else{ //게시판 삭제
                
                document.getElementById("varboardCodeboard"+boardCodeIn).remove(); 
                document.getElementById("varboardNameboard"+boardCodeIn).remove(); 
                document.getElementById("titleTagYNboard"+boardCodeIn).remove(); 
                document.getElementById("boardLikeYNboard"+boardCodeIn).remove(); 
                document.getElementById("boardMemberLevelNoboard"+boardCodeIn).remove(); 

                document.getElementById("board"+boardCodeIn).parentNode.remove();



              }

              /* 게시판이나 메인카테고리 눌렀을 때 세팅되는 값 다 지우기 */
              document.getElementById("mainCategoryNameIn").value = "";
              document.getElementById("mainCategoryNameIn2").value = "";
              document.getElementById("boardOrderIn").value = "";
              document.getElementById("boardCodeIn").value = "";


              document.getElementById("boardCodeUpdate").value = "";
              document.getElementById("MainCategoryUpdate").value = "";
              document.getElementById("inputDisabled").value = "";
              document.getElementById("beginboardName").value = "";
              /* 게시판이나 메인카테고리 눌렀을 때 세팅되는 값 다 지우기 */

              /* 기본 에디터 보여주기 */
              document.getElementsByClassName("set_box")[0].classList.add("set_boxBasic");
              document.getElementsByClassName("set_box")[2].classList.remove("set_boxON");
              document.getElementsByClassName("set_box")[1].classList.remove("set_boxON");

            }
        },
        error: () => {
            console.log("삭제 반영 실패")
        }


      });

    }
    

  }else{
    alert("삭제할 수 있는 게시판이 없습니다.")
  }

});




document.getElementById("downButton").addEventListener('click',function(){

  const mainCategoryNameIn = document.getElementById("mainCategoryNameIn").value;
  const boardCodeIn = document.getElementById("boardCodeIn").value; //없으면 메인 카테고리

  const boardOrderupdate = document.getElementById("board"+boardCodeIn).getAttribute("title"); 
  //title="1" 기준 순서  

  //document.getElementById("board34").parentNode.previousElementSibling.lastElementChild //게시판 이전 요소
  //document.getElementById("board34").parentNode.previousElementSibling.lastElementChild //의 title이 0이면 이동 X

  //document.getElementById("board35").parentNode.nextElementSibling  이 null이면 마지막 요소   
  //아니면 document.getElementById("board34").parentNode.nextElementSibling.lastElementChild //의 title값
  if($("#mainCategoryNameIn").val()!=''){
    var boolean = false;

    if($("#boardCodeIn").val()!=''){
      if(document.getElementById("board"+boardCodeIn).parentNode.nextElementSibling == null){ //기본 게시판이 마지막이라서 이동X
        boolean = false;
        alert("메인 카테고리 안에서만 이동가능합니다. 마지막 게시판 이동불가")
      }else{
        boolean = true;
      }
    }
    

    if(boolean){ //마지막 요소가 아닐 때 추가 가능
      const nexTBoardOrderupdateCode = document.getElementById("board"+boardCodeIn).parentNode.nextElementSibling.lastElementChild.getAttribute("name"); //다음 보드 코드
      const nextmainCategoryOrder = document.getElementById(mainCategoryNameIn).nextElementSibling.getAttribute('number'); 

      const nexTBoardOrderupdate = document.getElementById("board"+boardCodeIn).parentNode.nextElementSibling.lastElementChild.getAttribute("title");
      //

      const nextboardCodeIn= document.getElementById("board"+boardCodeIn).parentNode.nextElementSibling.getAttribute('class');
      $.ajax({
        // 디비에서 delete가 아닌 보드
        url: "/updateBoardOrderPage",
        data: { 
                "mainCategoryNameIn"  : mainCategoryNameIn, //자르면 순서 들어있음 메인 카테고리
                "boardCodeIn"  : boardCodeIn,                 //값이 들어 있으면 게시판 순서하는데 게시판 코드 들어있음
                "boardOrderupdate"  : boardOrderupdate,       //수정할 요소의 DB값 순서 //7


                "nexTBoardOrderupdate"  : nexTBoardOrderupdate,       //아래 버튼을 눌렀을 때 밑에 있는 수정 요소의 DB값 순서(게시판 다음 요소) //8
                "nexTBoardOrderupdateCode"  : nexTBoardOrderupdateCode,


                "nextmainCategoryOrder"  : nextmainCategoryOrder,       //아래 버튼을 눌렀을 때 밑에 있는 수정 요소의 DB값 순서(메인카테고리 다음 요소)
                "message"      : ""
        },
        type: "POST",
        dataType: "JSON", // 응답 데이터의 형식이 JSON이다. -> 자동으로 JS 객체로 변환


        success: (result) => {
            if(result.message == "이동 실패되었습니다."){
                
              alert(result.message);
        
          
            }else{
              alert(result.message);
              $('.'+nextboardCodeIn).after($('.board'+boardCodeIn));
              document.getElementById("board"+boardCodeIn).parentNode.previousElementSibling.lastElementChild.setAttribute("title",boardOrderupdate); //다음 보드 순서 세팅
              document.getElementById("board"+boardCodeIn).setAttribute("title",nexTBoardOrderupdate); 
            }
        },
        error: () => {
            console.log("이동 반영 실패")
        }


      });


    }

  }else{
      alert("이동 가능한 대상이 아닙니다.")
  }




});


//////////////////////////////

document.getElementById("upButton").addEventListener('click',function(){

  const mainCategoryNameIn = document.getElementById("mainCategoryNameIn").value;
  const boardCodeIn = document.getElementById("boardCodeIn").value; //없으면 메인 카테고리  --현재 기준 보드코드

  const boardOrderupdate = document.getElementById("board"+boardCodeIn).getAttribute("title"); //title="1" 현재 기준 보드 순서  
 //document.getElementById("board34").parentNode.previousElementSibling.lastElementChild //게시판 이전 요소
  //document.getElementById("board34").parentNode.previousElementSibling.lastElementChild //의 title이 0이면 이동 X

  //document.getElementById("board35").parentNode.nextElementSibling  이 null이면 마지막 요소   
  //아니면 document.getElementById("board34").parentNode.nextElementSibling.lastElementChild //의 title값
  if($("#mainCategoryNameIn").val()!=''){
    var boolean = false;

    if($("#boardCodeIn").val()!=''){
      if(document.getElementById("board"+boardCodeIn).parentNode.previousElementSibling.lastElementChild.getAttribute('title') == '0'){ //기본 게시판이 메인 카테고리 안에서 처음이라서 이동X
        boolean = false;
        alert("메인 카테고리 안에서만 이동가능합니다. 첫 게시판 이동불가")
      }else{
        boolean = true;
      }
    }
    

    if(boolean){ //처음 요소가 아닐 때 추가 가능
      const preBoardOrderupdateCode = document.getElementById("board"+boardCodeIn).parentNode.previousElementSibling.lastElementChild.getAttribute("name"); //이전 보드 코드
      const preBoardOrderupdate = document.getElementById("board"+boardCodeIn).parentNode.previousElementSibling.lastElementChild.getAttribute("title");
      //이전 보드 순서 

      const preboardCodeIn= document.getElementById("board"+boardCodeIn).parentNode.previousElementSibling.getAttribute('class');
      //순서 다시 세팅
      $.ajax({
        // 디비에서 delete가 아닌 보드
        url: "/updateBoardOrderPageUP",
        data: { 
                "mainCategoryNameIn"  : mainCategoryNameIn, //자르면 순서 들어있음 메인 카테고리
                "boardCodeIn"  : boardCodeIn,                 //값이 들어 있으면 게시판 순서하는데 게시판 코드 들어있음
                "boardOrderupdate"  : boardOrderupdate,       //수정할 요소의 DB값 순서 //7


                "preBoardOrderupdate"  : preBoardOrderupdate,       //아래 버튼을 눌렀을 때 밑에 있는 수정 요소의 DB값 순서(게시판 다음 요소) //8
                "preBoardOrderupdateCode"  : preBoardOrderupdateCode,
                "message"      : ""
        },
        type: "POST",
        dataType: "JSON", // 응답 데이터의 형식이 JSON이다. -> 자동으로 JS 객체로 변환


        success: (result) => {
            if(result.message == "이동 실패되었습니다."){
                
              alert(result.message);
        
          
            }else{
              alert(result.message);
              $('.'+preboardCodeIn).before($('.board'+boardCodeIn));
              document.getElementById("board"+boardCodeIn).parentNode.nextElementSibling.lastElementChild.setAttribute("title",boardOrderupdate); //다음 보드 순서 세팅
              document.getElementById("board"+boardCodeIn).setAttribute("title",preBoardOrderupdate); 
            }
        },
        error: () => {
            console.log("이동 반영 실패")
        }


      });


    }

  }else{
      alert("이동 가능한 대상이 아닙니다.")
  }


});