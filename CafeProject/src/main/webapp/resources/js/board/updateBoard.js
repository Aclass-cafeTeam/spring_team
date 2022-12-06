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