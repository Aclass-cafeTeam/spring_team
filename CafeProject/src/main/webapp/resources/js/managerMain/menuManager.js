$(".add_lst_btn a").click(function() {
  console.log("클릭");
  document.getElementById("plusBtn").classList.add("on");

  $('.add_lst_btn li').removeClass("on");
  this.parentNode.classList.add('on');
});

$(".mainCategoryOn a").click(function() {
  $('.edit_btn_area li').addClass("on");

  $('.edit_lst_box li').removeClass("on");
  this.parentNode.classList.add('on');
});
