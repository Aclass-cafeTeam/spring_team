

$(".c_gy3").click(function() {


  const boardCode = this.id;
    const options = "width=700, height=700";
    window.open("/manager/manageRemoveArticleListPopup/"+boardCode, "popupWindow", options) 

});