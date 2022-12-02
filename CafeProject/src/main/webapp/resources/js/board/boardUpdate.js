console.log("update관련js 연결확인");



// 게시글 삭제
const deleteBtn = document.getElementById("deleteBtn");
deleteBtn.addEventListener("click", ()=>{
    
    if(confirm("게시글을 삭제하시겠습니까?")) {
        // /board/{boardCode}/{boardNo}/delete GET방식
        // 삭제 후 /board/{boardCode}
        
        location.href = location.pathname + "/delete";
        // /board/1/1998/delete
    }
});


// 게시글 수정
const updateBtn = document.getElementById("updateBtn");
updateBtn.addEventListener("click", ()=>{

    // /board/{boardCode}/{boardNo}/update?cp=10 GET방식
    location.href = location.pathname + "/update" + location.search;
                // /board/{boardCode}/{boardNo}/update      // ?cp=10
    
});


// 게시글 수정 유효성 검사
function updateValidate() {
    const boardTitle = document.querySelector("[name='boardTitle']");
    const boardContent = document.querySelector("[name='boardContent']");

    if(boardTitle.value.trim().length == 0) {
        alert("제목을 입력해주세요.");
        boardTitle.value = "";
        boardTitle.focus();
        return false;
    }

    if(boardContent.value.trim().length == 0) {
        alert("내용을 입력해주세요.");
        boardContent.value = "";
        boardContent.focus();
        return false;
    }    
    return true;
}