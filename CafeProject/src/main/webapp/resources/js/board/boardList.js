// 글쓰기로 이동
(()=>{
    const insertBtn = document.getElementById("insertBtn");

    if(insertBtn != null) { // 로그인 후에 글쓰기 버튼이 존재할 때
        insertBtn.addEventListener("click", ()=>{
            location.href = "/board/write/";
        });
    }
})();