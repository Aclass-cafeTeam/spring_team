
const detailbutton = document.getElementsByClassName("_showDetailSearch")[0];

const srch_detailBox = document.getElementsByClassName("srch_detail")[0];

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

//

const srch_infoDisplay = document.querySelectorAll(".srch_info"); 

/* const detailchecked = document.querySelector("input[name='srch_detail']:checked"); */



document.querySelectorAll("input[name='srch_detail']")[0].addEventListener("change",function(){
  
  const detailchecked = document.querySelector("input[name='srch_detail']:checked");

  if(detailchecked.value == "postspace"){
    console.log(srch_infoDisplay[0]);
    srch_infoDisplay[0].style.display ="block";
    srch_infoDisplay[1].style.display = "none";
    srch_infoDisplay[2].style.display = "none";
    srch_infoDisplay[3].style.display = "none";
  }

});

// document.querySelector('input[name="srch_detail"]').checked;
document.querySelectorAll("input[name='srch_detail']")[1].addEventListener("change",function(){
  
  const detailchecked = document.querySelector("input[name='srch_detail']:checked");

  if(detailchecked.value == "commentspace"){
    console.log(srch_infoDisplay[1]);
    srch_infoDisplay[0].style.display ="none";
    srch_infoDisplay[1].style.display = "block";
    srch_infoDisplay[2].style.display = "none";
    srch_infoDisplay[3].style.display = "none";
  }

});

document.querySelectorAll("input[name='srch_detail']")[2].addEventListener("change",function(){
  
  const detailchecked = document.querySelector("input[name='srch_detail']:checked");

  if(detailchecked.value == "visitspace"){
    srch_infoDisplay[0].style.display ="none";
    srch_infoDisplay[1].style.display = "none";
    srch_infoDisplay[2].style.display = "block";
    srch_infoDisplay[3].style.display = "none";
  }
});

document.querySelectorAll("input[name='srch_detail']")[3].addEventListener("change",function(){
  
  const detailchecked = document.querySelector("input[name='srch_detail']:checked");

  if(detailchecked.value == "datespace"){
    srch_infoDisplay[0].style.display ="none";
    srch_infoDisplay[1].style.display = "none";
    srch_infoDisplay[2].style.display = "none";
    srch_infoDisplay[3].style.display = "block";
  }

});
//let date = new Date();  
/*   let yyyy = date.getFullYear();
  let mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
  let dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate(); */
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
  /* document.getElementById("limitFrm").submit(); */
  /* document.forms["limitFrm"].submit(); */
  /* selectLimit.form.submit(); */
});

const selecsortMemberLevel = document.getElementById("_sortMemberLevel");
selecsortMemberLevel.addEventListener("change",function(){
 /*  document.getElementById("sortMemberLevelFrm").submit(); */
  document.forms["sortMemberLevelFrm"].submit();
  /* selecsortMemberLevel.form.submit(); */
});

window.onload = function(){
  console.log(document.getElementById("_sortMemberLevel").className);
  var memberLevelNoresult = document.getElementById("_sortMemberLevel").className;
  $("#_sortMemberLevel").val(memberLevelNoresult).prop('selected', true);

  console.log(document.getElementById("limit").className);
  var limitresult = document.getElementById("limit").className;
  $("#limit").val(limitresult).prop('selected', true);

  console.log(document.getElementById("srchOption").className);
  var srchOption = document.getElementById("srchOption").className;
  $("#srchOption").val(srchOption).prop('selected', true);

  //countBy=0&periodOption=1&articleCountInput=6&aboveOption=1#
  const QueryString = new URLSearchParams(location.search);
  const countBy = QueryString.get('countBy'); //조건 체크박스 
  const periodOption = QueryString.get('periodOption'); //기간 옵션 0전체기간/1최근 한달
  const articleCountInput = QueryString.get('articleCountInput');//게시글 수
  const aboveOption = QueryString.get('aboveOption');//이상 1 이하 0
  if(countBy == "0" ||countBy == "1" ||countBy == "2"||countBy == "3"){
    const detailbutton = document.getElementsByClassName("_showDetailSearch")[0];
    const srch_detailBox = document.getElementsByClassName("srch_detail")[0];
    srch_detailBox.style.display = "block";
    detailbutton.style.backgroundColor = "#8994a0";
    detailbutton.style.color="white";
  }
  if(articleCountInput != null && countBy == "0"){
    document.getElementById("_articleCountInput").value = articleCountInput;
  }

  if((countBy == "0" ||countBy == "1" ||countBy == "2")&&periodOption != null){
    $("#periodOption").val(periodOption).prop('selected', true);
  }

  if((countBy == "0" ||countBy == "1" ||countBy == "2")&&aboveOption != null){
    $("#aboveOption").val(aboveOption).prop('selected', true);
  }


};
/* 멤버 정렬 limit 및 등급별  */

function getQueryString(key) {
  // 전체 Url을 가져온다.
  var str = location.href;

  // QueryString의 값을 가져오기 위해서, ? 이후 첫번째 index값을 가져온다.
  var index = str.indexOf("?") + 1;

  // Url에 #이 포함되어 있을 수 있으므로 경우의 수를 나눴다.
  var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;

  // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
  if (index == 0) {
      return "";
  }

  // str의 값은 a=1&b=first&c=true
  str = str.substring(index, lastIndex); 

  // key/value로 이뤄진 쌍을 배열로 나눠서 넣는다.
  str = str.split("&");

  // 결과값
  var rst = "";

  for (var i = 0; i < str.length; i++) {

      // key/value로 나눈다.
      // arr[0] = key
      // arr[1] = value
      var arr = str[i].split("=");

      // arr의 length가 2가 아니면 종료
      if (arr.length != 2) {
          break;
      }

      // 매개변수 key과 일치하면 결과값에 셋팅
      if (arr[0] == key) {
          rst = arr[1];
          break;
      }
  }
  return rst;
};





