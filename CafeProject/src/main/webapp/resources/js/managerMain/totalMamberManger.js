
const detailbutton = document.getElementsByClassName("_showDetailSearch")[0];

const srch_detailBox = document.getElementsByClassName("srch_detail")[0];

detailbutton.addEventListener("click",function(){
  if(srch_detailBox.style.display == "block"){
    srch_detailBox.style.display = "none";
    this.style.backgroundColor = "transparent";
    this.style.color="#404040";
  }else{
    srch_detailBox.style.display = "block";
    this.style.backgroundColor = "#8994a0";
    this.style.color="white";
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