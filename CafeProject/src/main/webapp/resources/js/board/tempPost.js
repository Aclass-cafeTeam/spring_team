

// 임시등록(modal사용)
const tempSave = document.getElementById("btn-tempSave"); // 임시등록
const modalBtn = document.getElementById("modalBtn"); // 모달창으로 이동
const boardModal = document.getElementById("boardModal"); // 모달창
const btnClose = document.getElementById("btn-close"); // 닫기버튼



// 임시등록 버튼 누르면 임시저장
tempSave.addEventListener("click", ()=>{
    // const boardTitle = document.querySelector("[name='boardTitle']");
    // const boardContent = document.querySelector("[name='boardContent']");

    // 게시판 선택
    if(boardCode.value=='') {
        alert("게시판을 선택하세요.");
        return false;
    }

    // 태그 선택
    if(titleTagNo.value=='') {
        alert("태그여부를 선택하세요.");
        return false;
    }

    if(boardTitle.value.trim().length==0){
        alert("제목을 입력하세요.");
        boardTitle.value="";
        boardTitle.focus();
        return false;
    }

    if(boardContent.value.trim().length==0){
        alert("내용을 입력하세요.");
        boardContent.value="";
        boardContent.focus();
        return false;
    }

    // + 방금 작성한 내용과 같은 내용으로 바로 다시 시도할 때 연속 저장 제어 생각해보자 +


    // 임시등록 테이블에 저장
    const fm = document.getElementById("boardWriteForm");
    // console.log(fm);
    $.ajax({
        url: "/board/write/tempPost",
        type: "post",
        data: $(fm).serialize(),
        success: (boardNo)=>{
            // 저장 성공 시 알럿창 띄우기
            if(boardNo > 0) {
                alert("임시등록이 완료되었습니다.");
                modalBtn.innerText = Number(modalBtn.innerText) + 1; // 갯수 1 증가
            }
        },
        error:()=>{
            alert("임시등록 실패");
        }
    })
})


// 카운트(수)를 누르면 임시등록 모달창으로 이동
modalBtn.addEventListener("click",()=>{
    boardModal.style.display="flex";
    

    // 임시등록글 목록 조회(AJAX)
    $.ajax({
        url: "/board/tempPost/list",
        data: { "memberNo" : memberNo},
        type: "GET",
        dataType : "JSON",
        success: function(tPost) {
            // console.log(tPost);
            // 기존에 존재하는 임시등록글 삭제
            const tempList = document.getElementById("temp-list");
            tempList.innerHTML = "";

            // tPost에 하나씩 접근
            for(let temp of tPost){
                const tempRow = document.createElement("li");
                tempRow.style.listStyle = "none";
                tempRow.classList.add("temp-item");
                
                const tempLink = document.createElement("a");
                tempLink.classList.add("temp-link");
                const boardCode = temp.boardCode;
                const boardNo = temp.boardNo;
                tempLink.setAttribute('href',  "/board/" + boardCode +"/"+ boardNo +"/tempPost");

                const tempTitle = document.createElement("strong");
                tempTitle.classList.add("temp-item-title");
                tempTitle.innerHTML = temp.boardTitle;
                tempLink.append(tempTitle);
                
                const tempItemTool = document.createElement("div");
                tempItemTool.classList.add("temp-item-tool");
                
                const tempTime = document.createElement("span");
                tempTime.classList.add("temp-time");
                tempTime.innerHTML = temp.boardCreateDate;
                
                const delBtn = document.createElement("button");
                delBtn.classList.add("btn-temp-del");
                
                const iT = document.createElement("i");
                iT.classList.add("fa-regular", "fa-trash-can");
                delBtn.append(iT);
                tempItemTool.append(tempTime);
                tempItemTool.append(delBtn);
                
                tempRow.append(tempLink);
                tempRow.append(tempItemTool);
                
                tempList.append(tempRow);

                
                // 임시 저장글 한 행 삭제
                delBtn.addEventListener("click", function(e){
                    // console.log(boardNo);
                    if(!confirm("임시글을 삭제하시겠습니까?")){
                        e.preventDefault;
                        e.stopPropagation;
                
                    } else {
                        $.ajax({
                            url: "/board/tempPost/delete",
                            type: "post",
                            data: {"boardNo" : boardNo},
                            success: (result)=>{
                                // 저장 성공 시 알럿창 띄우기
                                if(result > 0) {
                                    alert("내용이 삭제되었습니다.");
                                    tempRow.remove();
                                    modalBtn.innerText = Number(modalBtn.innerText) - 1;
                                }
                            },
                            error:()=>{
                                alert("임시등록 삭제 실패");
                            }
                        })
                    }   
                });

                
                // 임시 저장글 -> 일반 게시글로
                tempLink.addEventListener("click", function(e){
                    
                    if(!confirm("임시글을 불러오면 작성 중인 글은 사라집니다. <br>" 
                            + "선택한 글을 불러오시겠습니까?")) {
                        e.preventDefault;

                    } else {
                        location.href = "/board/" + boardCode +"/"+ boardNo +"/tempPost";
                    }
                })

            }
            console.log(tempList);
        },
        error:function(){
            console.log("임시등록 에러 발생");
        }
    });    
});


// 모달창 닫기 버튼
btnClose.addEventListener("click", () =>{
    boardModal.style.display="none";
});


// 임시등록글 전체 삭제
$(".all-del-btn").click(function(e){
    console.log(memberNo);

    if(!confirm("임시글을 모두 삭제하겠습니까?")){
        e.preventDefault;
        e.stopPropagation;

    } else { 

        $.ajax({
            url: "/board/tempPost/deleteAll",
            type: "post",
            data: { "memberNo" : memberNo},
            success: (result)=>{
                // 저장 성공 시 알럿창 띄우기
                if(result > 0) {
                    alert("모두 삭제되었습니다.");
                    modalBtn.innerText = '0';
                    
                    $("#temp-list").remove();
                }
            },
            error:()=>{
                alert("임시등록 삭제 실패");
            }
        });
    }
});