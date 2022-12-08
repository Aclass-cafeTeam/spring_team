console.log("tempToBoard.js 연결확인");

// select 토글 버튼 (∧ ∨)
const select =document.querySelectorAll(".select")
const wrapper = document.querySelectorAll(".wrapper");
const boardCode = document.getElementById("boardCode");
const boardForm = document.getElementById("boardForm");
const titleTagNo = document.getElementById("titleTagNo");


// 게시판 선택 
select[0].addEventListener("click", ()=>{
    wrapper[0].classList.toggle("open")

});


function selectType(type) {
    wrapper[0].classList.remove("open");
    select[0].firstElementChild.innerText = type.innerText;
    boardCode.value = parseInt(type.getAttribute("id"));
    select[0].firstElementChild.style.lineHeight= "1px";
    console.log(boardCode);
}    


// 태그 선택
select[1].addEventListener("click", ()=>{
    wrapper[1].classList.toggle("open")
});

if(select[1].firstElementChild.innerText == '말머리 선택') {
    titleTagNo.value = parseInt(0);

    function selectTag(type) {
        wrapper[1].classList.remove("open");
        select[1].firstElementChild.innerText = type.innerText;
        titleTagNo.value = parseInt(type.getAttribute("id"));
        select[1].firstElementChild.style.lineHeight= "1px";
        console.log(titleTagNo);
    }    
}

// 공지 여부 선택
const boardNotice = document.getElementById("boardNotice");
const setting = document.getElementById("setting");
const noticeFlag = document.getElementById("noticeFlag");

if(boardNotice != null) {
    // (관리자들) 공지로 등록이 체크되었을 때
    boardNotice.addEventListener("change", (e)=>{
        if(!(memberLevelNo == 0 || memberLevelNo ==1)) {
            alert("공지로 등록은 관리자만 접근할 수 있습니다!");
            boardNotice.checked=false;
        } else {
            if(boardNotice.checked) {
                setting.style.display='block';
                
            } else {
                setting.style.display='none';
            }
            console.log(noticeFlag.value);
        }
    });
}

const comment = document.getElementById("comment");
// 댓글 허용(무조건 체크)
if(comment != null) {
    comment.addEventListener("change", (e)=>{
        comment.checked=true;
        alert("내일로, 기차로 회원 여러분! 게시판은 모두가 볼 수 있는 공간이니 매너있게 작성해주세요.\n\n")
    })
}


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
