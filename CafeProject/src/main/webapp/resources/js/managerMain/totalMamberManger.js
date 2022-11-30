
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
  const visitCountInput = QueryString.get('visitCountInput');//방문 수
  const aboveOption = QueryString.get('aboveOption');//이상 1 이하 0
  const entryType = QueryString.get('entryType');//최종방문1 가입 0
  const endDateInput = QueryString.get('endDateInput');//최종방문1 가입 0
  const startDateInput = QueryString.get('startDateInput');//최종방문1 가입 0

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
    //$("_period").val(periodOption).prop('selected', true);

    /* 상세조회 이상,이하 */
    //if(aboveOption != null){
    //$("_above").val(aboveOption).prop('selected', true);
    /* 상세조회 기간옵션 전체,최신 1개월 *$("._count:nth-last-of-type()")*/

    /* 상세조회 기간옵션 전체,최신 1개월 */
    if(periodOption != null){
      $("._period")[countBy].value =periodOption;
    }
    
    /* 상세조회 이상,이하 */
    if(aboveOption != null){
      $("._above")[countBy].value =aboveOption;
    }

    /* 상세조회 가입/최종방문 */
    if(entryType != null){
      $("#_entryType").val(entryType).prop('selected', true);
      document.getElementById("_startDateInput").value =startDateInput;
      document.getElementById("_endDateInput").value =endDateInput;
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
      $("._count")[countBy].value = visitCountInput;
      break;
  }
  
};

/* 테이블 체크박스 */
$("._checkAll").click(function() {
  if($("._checkAll").is(":checked")) $("input[name=c1]").prop("checked", true);
  else $("input[name=c1]").prop("checked", false);
});


function CheckValue(){
  let checkNum = $('._checkMember:checkbox:checked').length;
  let chk_val = [];
  let chk_level =[];
  $('._checkMember:checkbox:checked').each(function(){
    chk_val.push($(this).val());
    chk_level.push(document.getElementById("ico_level"+$(this).val()).innerText);
  });
  const checkObj = {
    "checkNum": checkNum,
    "chk_val": chk_val,
    "chk_level" : chk_level
  };
  return checkObj;
}


const changeLevel = document.getElementById("_changeLevel"); //등급 변경
const stopActivity = document.getElementById("_stopActivity"); //활동정지
const secedeButton = document.getElementById("_forceWithdrawal"); //강제탈퇴

//등급 변경
changeLevel.addEventListener("click", function () {
  // 옵션이 지정된 팝업창

  // 옵션 작성 방법 : "K=V,K=V,K=V" , 크기 단위 작성 X(px 고정)
  const checkObj = CheckValue();

  
  if(checkObj["chk_level"].includes('카페매니저') || checkObj["chk_level"].includes('부매니저') || checkObj["checkNum"] <= 0){

    if(checkObj["checkNum"] <= 0){
      alert("멤버를 선택해주세요");
    }else{

      document.getElementById("_layerChangeLevel").style.display = "block";
      document.getElementById("_layerChangeLevel").style.overflow = "visible";
      document.getElementById("_layerChangeLevel").style.zoom = "1";
    }

  }else{
    const options = "width=400, height=520";
    window.open("/manager/ManageLevelUpPopup", "popupWindow", options)
  }
  
});


//활동정지
stopActivity.addEventListener("click", function () {

  const checkObj = CheckValue();
  if(checkObj["chk_level"].includes('카페매니저') || checkObj["chk_level"].includes('부매니저')|| checkObj["checkNum"] <= 0){

    if(checkObj["checkNum"] <= 0){
      alert("멤버를 선택해주세요");
    }else{

    document.getElementById("_layerStopActivity").style.display = "block";
    document.getElementById("_layerStopActivity").style.overflow = "visible";
    document.getElementById("_layerStopActivity").style.zoom = "1";
    }

  }else{
    const options = "width=508, height=494";
    window.open("/manager/ManageActivityStopPopup", "popupWindow", options) 

  }
  
});


$("._hideLayer").click(function() {
  document.getElementById("_layerChangeLevel").style.display = "none";
  document.getElementById("_layerStopActivity").style.display = "none";
});



//강제탈퇴
secedeButton.addEventListener("click", function () {

  const checkObj = CheckValue();
  if(checkObj["chk_level"].includes('카페매니저') || checkObj["checkNum"] <= 0){

    if(checkObj["checkNum"] <= 0){
      alert("멤버를 선택해주세요");
    }else{
      alert("카페매니저는 탈퇴시킬 수 없습니다.");
    }

  }else{
    const options = "width=508, height=494";
    window.open("/manager/ManageSecedePopup", "popupWindow", options) 

  }
  
});