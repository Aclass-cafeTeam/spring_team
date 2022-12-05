/* 게시판 추가  게시판 클릭*/
$(".add_lst_btn a").click(function() {
  console.log("클릭");
  document.getElementById("plusBtn").classList.add("on");

  $('.add_lst_btn li').removeClass("on");
  $('.add_lst_btn2 li').removeClass("on");
  this.parentNode.classList.add('on');

  const bordTitleName= this.firstElementChild;
  document.getElementById("bordTitleNameIn").value = bordTitleName.innerText;
  document.getElementById("bordTitleFormIn").value = bordTitleName.title;
  
});

/* 메인 카테고리 추가 그룹 제목(메인 카테고리 클릭)*/
$(".add_lst_btn2 a").click(function() {
  console.log("클릭");
  document.getElementById("plusBtn").classList.add("on");

  $('.add_lst_btn li').removeClass("on");
  this.parentNode.classList.add('on');


  const mainCategoryOrderAdd = document.getElementsByClassName("borderNone")[0].lastElementChild.getAttribute('number');
  document.getElementById("mainCategoryAdd").value = mainCategoryOrderAdd; //메인카테고리 마지막 순서

  const mainTitlenameIn= document.getElementById("mainTitlenameIn").innerText;
  document.getElementById("mainCategoryNameAdd").value = mainTitlenameIn;
  
});



/* 게시판 순서 위 아래 삭제 버튼 세팅 및 값 세팅 */
$(".mainCategoryOn a").click(function() {
  $('.edit_btn_area li').addClass("on");

  $('.edit_lst_box li').removeClass("on");
  this.parentNode.classList.add('on');

  const mainCategoryName = this.parentNode.parentNode.id;

  document.getElementById("mainCategoryNameIn").value = mainCategoryName;

  const mainCategoryName2 = this.parentNode.parentNode.title;

  document.getElementById("mainCategoryNameIn2").value = mainCategoryName2;

  const boardAddOrder= document.getElementById(mainCategoryName).lastElementChild.firstElementChild.title;

  document.getElementById("boardOrderIn").value = boardAddOrder;

  document.getElementById("boardCodeIn").value= this.name;

});


$('#BoardPlusBtn').click(function() {
  const mainCategoryNameIn = document.getElementById("mainCategoryNameIn").value;  //mainCategory.B
  const mainCategoryNameIn2 = document.getElementById("mainCategoryNameIn2").value; //질문코너
  const bordTitleNameIn = document.getElementById("bordTitleNameIn").value;
  const boardOrderIn = document.getElementById("boardOrderIn").value;
  const bordTitleFormIn = document.getElementById("bordTitleFormIn").value;
  const boardCodeIn = document.getElementById("boardCodeIn").value;

  /* 메인 카테고리 추가(그룹) */
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
        if(result.message != '게시판 추가에 실패했습니다.'){

          alert(result.message);

          const ul = document.createElement("ul");
          ul.id = "mainCategory."+result.newBoard.mainCategoryNo;
          ul.setAttribute("class","mainCategory");
          ul.classList.add("mainCategoryOn");
          ul.setAttribute("title",result.newBoard.mainCategoryName);
          ul.setAttribute("number",result.newBoard.mainCategoryNo);

          document.getElementById("borderNone").append(ul);


          //<ul id="mainCategory.4" class="mainCategory mainCategoryOn" title="갤러리 자료" number="4"></ul>


          $(".mainCategoryOn a").click(function() {
            $('.edit_btn_area li').addClass("on");
          
            $('.edit_lst_box li').removeClass("on");
            this.parentNode.classList.add('on');
          
            const mainCategoryName = this.parentNode.parentNode.id;
          
            document.getElementById("mainCategoryNameIn").value = mainCategoryName;
          
            const mainCategoryName2 = this.parentNode.parentNode.title;
          
            document.getElementById("mainCategoryNameIn2").value = mainCategoryName2;
          
            const boardAddOrder= document.getElementById(mainCategoryName).lastElementChild.firstElementChild.title;
          
            document.getElementById("boardOrderIn").value = boardAddOrder;
          
            document.getElementById("boardCodeIn").value= this.name;
          
          });


          document.getElementById("mainCategoryNameupdateIN").value = result.newBoard.mainCategoryName;
          document.getElementById("MainCategoryUpdate").value = result.newBoard.mainCategoryNo;

          document.getElementsByClassName("set_box")[0].classList.remove("set_boxBasic");
          document.getElementsByClassName("set_box")[1].classList.remove("set_boxON");
          document.getElementsByClassName("set_box")[2].classList.add("set_boxON");

          $('.valueRemov2').value ="";

        }else{
          alert(result.message);
        }
        
      },
      error: ()=>{
        console.log("메인 카데고리 추가 실패");
      }

    }); 


  }else{

    
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

                const li = document.createElement("li");
                const a = document.createElement("a");
                li.setAttribute("class","");
                a.id = result.newBoard.boardName;
                a.setAttribute("title", result.newBoard.boardOrder);
                a.setAttribute("class", result.newBoard.boardForm);
                if(result.newBoard.boardForm == 'A'){
                  a.classList.add("ge_v1");
                }
                if(result.newBoard.boardForm == 'B'){
                  a.classList.add("ge_v13");
                }

                const span = document.createElement("span");
                span.innerText = result.newBoard.boardName;

                document.getElementById(mainCategoryNameIn).append(li);
                li.append(a);
                a.append(span);

                $(a).click(function() {
                  $('.edit_btn_area li').addClass("on");
                
                  $('.edit_lst_box li').removeClass("on");
                  this.parentNode.classList.add('on');
                
                  const mainCategoryName = this.parentNode.parentNode.id;
                
                  document.getElementById("mainCategoryNameIn").value = mainCategoryName;
                
                  const mainCategoryName2 = this.parentNode.parentNode.title;
                
                  document.getElementById("mainCategoryNameIn2").value = mainCategoryName2;
                
                  const boardAddOrder= document.getElementById(mainCategoryName).lastElementChild.firstElementChild.title;
                
                  document.getElementById("boardOrderIn").value = boardAddOrder;
                
                });


                document.getElementById("boardCodeUpdate").value = result.newBoard.boardCode;
                document.getElementById("settingboardName").value = result.newBoard.boardName;
                document.getElementById("LevelNo").value =result.newBoard.boardMemberLevelNo;
                
                if(result.newBoard.boardLikeYN == 'Y'){
                  $("#in_type6").prop("checked", true);
                }

                if(result.newBoard.titleTagYN == 'Y'){
                  $("#in_type7").prop("checked", true);
                }

                document.getElementsByClassName("set_box")[0].classList.remove("set_boxBasic");
                document.getElementsByClassName("set_box")[1].classList.add("set_boxON");

                $('.valueRemove').value ="";


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