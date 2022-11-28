// select 토글 버튼 (∧ ∨)
const select =document.querySelectorAll(".select")
const wrapper = document.querySelectorAll(".wrapper");

/* boardType */
select[0].addEventListener("click", ()=>{
    wrapper[0].classList.toggle("open")
});

function selectType(type) {
    wrapper[0].classList.remove("open");
    select[0].firstElementChild.innerText = type.innerText;
    select[0].firstElementChild.style.margin = "auto 0px";
}    


select[1].addEventListener("click", ()=>{
    wrapper[1].classList.toggle("open")
});

function selectTag(type) {
    wrapper[1].classList.remove("open");
    select[1].firstElementChild.innerText = type.innerText;
    // select.firstElementChild.style.alignSelf = "center";
}    




// 게시판 공지사항/자유게시판일 때만 말머리가 활성화....







// 임시등록(modal사용)
const tempSave = document.getElementById("btn-tempSave"); 
const tempCount = document.getElementById("btn-tempCount");
const modal = document.getElementById("modal");

tempSave.addEventListener("click", ()=>{
    // 임시등록 버튼 누르면 임시저장

    // 임시등록 테이블에 저장하고
    // 저장 성공 시 알럿창 띄우기 (ajax)
})


tempCount.addEventListener("click",()=>{
    // 카운트(수)를 누르면 임시등록 모달창으로 이동
    // modal.location.href = "/board/tempPost";
    // window.open(modal);
    // console.log(location);
})