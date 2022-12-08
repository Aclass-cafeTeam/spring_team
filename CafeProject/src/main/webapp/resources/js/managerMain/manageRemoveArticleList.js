

  $(".c_gy3").click(function() {


    const boardCode = this.id;
      const options = "width=700, height=700";
      window.open("/manager/manageRemoveArticleListPopup/"+boardCode, "popupWindow", options) 

  });


  $(".reBtn").click(function() {

    const boardCode = this.getAttribute("title"); 
    const TypeDelFL = document.getElementById("TypeDelFL"+boardCode).value;

    if($(".TypeDelFL"+boardCode).val() =='Y'){
      alert("게시글이 써진 게시판이 삭제되어 복구할 수 없습니다.");
    }else{
          $.ajax({
            // 디비에서 delete가 아닌 보드
            url: "/RemoveArticle",
            data: { 
                    "boardCode"  : boardCode,
                    "TypeDelFL"  : TypeDelFL, 
                    "message"      : ""
            },
            type: "POST",
            dataType: "JSON", // 응답 데이터의 형식이 JSON이다. -> 자동으로 JS 객체로 변환
            success: (result) => {
              if(result.message === "삭제 실패되었습니다."){
                alert(result.message);
              }else{

                document.getElementById("tr"+boardCode).remove();
                alert(result.message);
              }
            },
            error: () => {
              console.log("복구 반영 실패")
            }


          });
    
      }

});