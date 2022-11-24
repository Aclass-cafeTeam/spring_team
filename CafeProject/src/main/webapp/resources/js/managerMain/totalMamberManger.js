
const detailbutton = document.getElementsByClassName("_showDetailSearch")[0];
const srch_detailBox = document.getElementsByClassName("srch_detail")[0];


/* 상세검색 버튼 누를때 색 변화 */
detailbutton.addEventListener("click",function(){
  if(srch_detailBox.style.display == "block"){
    srch_detailBox.style.display = "none";
    this.style.backgroundColor = "transparent";
    this.style.color="#404040";
    detailbutton.classList.remove("on2");
  }else{
    srch_detailBox.style.display = "block";
    this.style.backgroundColor = "#8994a0";
    this.style.color="white";
    detailbutton.classList.add("on2");
  }

});


// 상세검색 라디오박스
const srch_infoDisplay = document.querySelectorAll(".srch_info"); 

$(document).on("click", "._searchDetailItem", function () {
  $(".srch_info").hide()
  document.querySelectorAll(".srch_info")[document.querySelector("input[name='srch_detail']:checked").value].style.display ="block"

});


/* 가입 최종로그인날짜 상세조회에서 달력 현재 날짜로 세팅하고 미래날짜는 선택 불가 */
document.getElementById('_startDateInput').valueAsDate = new Date();  
document.getElementById('_endDateInput').valueAsDate = new Date();  

var now_utc = Date.now() // 지금 날짜를 밀리초로
// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("_startDateInput").setAttribute("max", today);
document.getElementById("_endDateInput").setAttribute("max", today);




/* 멤버 정렬 limit 및 등급별  */
const selectLimit = document.getElementById("limit");
selectLimit.addEventListener("change",function(){
  console.log(document.getElementById("limitFrm"));
  document.forms["sortMemberLevelFrm"].submit();
});

const selecsortMemberLevel = document.getElementById("_sortMemberLevel");
selecsortMemberLevel.addEventListener("change",function(){
  document.forms["sortMemberLevelFrm"].submit();
});



/* 화면이 로딩되었을 때 세팅되어야하는 것들 */
window.onload = function(){

  /* 멤버등급 세팅된 클래스 이름(0,2,3,4,5,6) 불러와서 거기에 일치하는 옵션(값)에 선택 true*/
  var memberLevelNoresult = document.getElementById("_sortMemberLevel").className;
  $("#_sortMemberLevel").val(memberLevelNoresult).prop('selected', true);

  /* 멤버 몇명씩 정렬할건지 클래스 이름 불러와서 거기에 일치하는 옵션(값)에 선택 true*/
  var limitresult = document.getElementById("limit").className;
  $("#limit").val(limitresult).prop('selected', true);

  /* 아이디 /변경 위에 같은 방식으로 옵션 선택 */
  var srchOption = document.getElementById("srchOption").className;
  $("#srchOption").val(srchOption).prop('selected', true);
  
  
  //countBy=0&periodOption=1&articleCountInput=6&aboveOption=1#
  const QueryString = new URLSearchParams(location.search);
  const countBy = QueryString.get('countBy'); //조건 체크박스 
  const periodOption = QueryString.get('periodOption'); //기간 옵션 0전체기간/1최근 한달
  const articleCountInput = QueryString.get('articleCountInput');//게시글 수
  const commentCountInput = QueryString.get('commentCountInput');//댓글 수
  const aboveOption = QueryString.get('aboveOption');//이상 1 이하 0

  /* 상세검색 후 제출하면 계속 상세검색 창이 보여야함 */
  if(countBy != null){ //countBy == "0" ||countBy == "1" ||countBy == "2"||countBy == "3"
    const detailbutton = document.getElementsByClassName("_showDetailSearch")[0];
    const srch_detailBox = document.getElementsByClassName("srch_detail")[0];
    srch_detailBox.style.display = "block";
    detailbutton.style.backgroundColor = "#8994a0";
    detailbutton.style.color="white";
  }

  /* 검색해서 제출해도 그대로 그 체크박스가 유지되어 있어야함 */
  if(countBy != null){
    const srch_infoDisplay = document.querySelectorAll(".srch_info");
    $(srch_infoDisplay).hide()
    srch_infoDisplay[countBy].style.display ="block";
    // $("._searchDetailItem").eq(countBy).prop("checked", true)
    document.querySelectorAll("._searchDetailItem")[countBy].checked = true;

    /* 상세조회 기간옵션 전체,최신 1개월 */
    $("._period").val(periodOption).prop('selected', true);
    /* 상세조회 이상,이하 */
    if(aboveOption != null){
    $("._above").val(aboveOption).prop('selected', true);
    }
  }

  switch (countBy) {
    case "0":
      $("._count")[countBy].value = articleCountInput;
      break;
    case "1":
      $("._count")[countBy].value = commentCountInput;
      break;
    case "2":
      //$("._count")[countBy].value = commentCountInput;
      break;
  }
  
};






