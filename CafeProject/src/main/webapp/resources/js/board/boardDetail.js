// 좋아요 버튼 클릭 시 동작
// (전역변수 memberNo, boardNo 사용(boardDetail.jsp))
const boardLike = document.getElementById("boardLike");

if (boardLike != null) {

    boardLike.addEventListener("click", e =>{
        // 로그인 상태가 아닌 경우
    if(memberNo==""){
        alert("로그인 후 이용해주세요.")
        return;
    }

    // 좋아요 수
    const likeCount = document.getElementById("likeCount");

    // 로그인 상태이면서 좋아요 상태가 아닌 경우
    if(e.target.classList.contains('fa-regular')){ //빈하트인 경우

        $.ajax({
            url : "/boardLikeUp",
            data : {"boardNo" : boardNo , "memberNo" : memberNo},
            type : "GET" ,
            success : (result)=>{
                if(result >0){ // 성공

                    e.target.classList.remove('fa-regular'); // 빈하트 클래스 삭제
                    e.target.classList.add('fa-solid'); // 채워진 하트 클래스 추가
                    likeCount.innerText = Number(likeCount.innerText)+1; // 1증가
                }else{ // 실패
                    console.log("증가 실패");
                }
            },
            error : ()=>{ console.log("증가 에러"); }
        });
    } 
    
    // 로그인 상태이면서 좋아요 상태인 경우
    else{ // 채워진 하트인 경우
        $.ajax({
            url : "/boardLikeDown",
            data : {"boardNo" : boardNo , "memberNo" : memberNo},
            type : "GET" ,
            success : (result)=>{
                if(result >0){ // 성공

                    e.target.classList.add('fa-regular'); // 빈하트 클래스 추가
                    e.target.classList.remove('fa-solid'); // 채워진 하트 클래스 삭제
                    likeCount.innerText = Number(likeCount.innerText)-1; // 1 감소

                }else{ // 실패
                    console.log("감소 실패");
                }
            },
            error : ()=>{ console.log("감소 에러"); }
        });
    }
});

}


// 게시글 삭제
const deleteBtn = document.getElementById("deleteBtn");

if (deleteBtn != null) {
    deleteBtn.addEventListener("click", ()=>{
        
        console.log("연결확인");
        if(confirm("게시글을 삭제하시겠습니까?")) {
            // /board/{boardCode}/{boardNo}/delete GET방식
            // 삭제 후 /board/{boardCode}
            
            location.href = location.pathname + "/delete";
            // /board/1/1998/delete
        }
    });

}


// 게시글 수정
const updateBtn = document.getElementById("updateBtn");

if (updateBtn != null) {
    updateBtn.addEventListener("click", ()=>{

        // /board/{boardCode}/{boardNo}/update?cp=10 GET방식
        location.href = location.pathname + "/update"; // + location.search;
                    // /board/{boardCode}/{boardNo}/update      // ?cp=10
        
    });
}



// const countComment = document.getElementById("count-comment");
// updateBtn.addEventListener("click", ()=>{
//     document.getElementById("commentContent").focus();
// });
