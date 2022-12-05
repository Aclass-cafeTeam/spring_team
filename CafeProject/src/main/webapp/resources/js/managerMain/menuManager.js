/* 메인 카테고리 추가 */
$(".add_lst_btn a").click(function() {
  console.log("클릭");
  document.getElementById("plusBtn").classList.add("on");

  $('.add_lst_btn li').removeClass("on");
  this.parentNode.classList.add('on');

  const bordTitleName= this.firstElementChild;
  document.getElementsByName("bordTitleNameIn")[0].value = bordTitleName.innerText;
  
});


/* 게시판 순서 삭제 */
$(".mainCategoryOn a").click(function() {
  $('.edit_btn_area li').addClass("on");

  $('.edit_lst_box li').removeClass("on");
  this.parentNode.classList.add('on');

  const mainCategoryName = this.parentNode.parentNode.id;

  document.getElementById("bordTitleNameIn").value = mainCategoryName;

  const boardAddOrder= document.getElementById(mainCategoryName).lastElementChild.firstElementChild.title;

  document.getElementById("boardOrderIn").value = boardAddOrder;

});



document.getElementById("plusBtn").click(function() {
  const mainCategoryNameIn = document.getElementById("mainCategoryNameIn").value;
  const bordTitleNameIn = document.getElementById("bordTitleNameIn").value;
  const boardOrderIn = document.getElementById("boardOrderIn").value;

  if(mainCategoryNameIn != '' ||bordTitleNameIn !='' ||boardOrderIn !=''){

    alert("값 넣기 성공");
   /*  $.ajax({




    }); */


  }else{
    alert("추가할 게시판 카테고리와 순서를 선택해주세요.");
  }

});