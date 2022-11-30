window.onload = function(){
  const use_check = document.getElementsByClassName("use_check");
  if($('#join_get01').hasClass('N')){
    $('input:radio[name=join_get]:input[value="N"]').attr("checked", true);
  }else{
    $('input:radio[name=join_get]:input[value="Y"]').attr("checked", true);
  }
}



function JoinSubmit() {
  var jbResult = false;
  var checkResult =  $('input[name="join_get"]:checked').val();
  if(checkResult === 'N'){
    jbResult = confirm( '가입 신청 받지 않기로 변경하시면 가입 신청 불가합니다! 정말 변경하시겠습니까?' );
  }
  if(checkResult === 'Y'){
    jbResult = confirm( '가입 신청 받기로 변경하시겠습니까?');
  }
  if(jbResult){
    return true;
  }else{
    return false;
  }
}