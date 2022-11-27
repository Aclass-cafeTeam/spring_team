const selectLimit = document.getElementById("limit");
selectLimit.addEventListener("change",function(){
  document.forms["sortActivityStopMemberFrm"].submit();
});

window.onload = function(){
  var limitresult = document.getElementById("limit").className;
  $("#limit").val(limitresult).prop('selected', true);
}

const searchMember =document.getElementById("searchMember");
searchMember.addEventListener("focus",function(){
  this.value = "";
  this.style.color = '#404040';
});