// 댓글 목록 조회(AJAX)
function selectCommentList(){
    
    // boardNo, memberNo 전역 변수 사용
    $.ajax({
        url : "/comment/list",
        data : {"boardNo" : boardNo},
        type : "GET",
        dataType : "JSON", // JSON 형태의 문자열 응답 데이터를 JS 객체로 자동 변환
        success : function(replyList){
            // replyList : 반환 받은 댓글 목록 
            console.log(replyList);

            // 화면에 출력되어 있는 댓글 목록 삭제
            const commentList = document.getElementById("comment-list"); // ul태그
            commentList.innerHTML = "";

            // replyList에 저장된 요소를 하나씩 접근
            for(let comment of replyList){

                // 행
                const commentRow = document.createElement("li");
                commentRow.classList.add("comment-row");

                // 답글일 경우 child-comment 클래스 추가
                if(comment.parentNo != 0)  commentRow.classList.add("child-comment");


                // 작성자
                const commentWriter = document.createElement("p");
                commentWriter.classList.add("comment-writer");

                // 프로필 이미지
                const profileImage = document.createElement("img");

                if( comment.profileImage != null ){ // 프로필 이미지가 있을 경우
                    profileImage.setAttribute("src", comment.profileImage);
                }else{ // 없을 경우 == 기본이미지
                    profileImage.setAttribute("src", "/resources/images/main/프로필.PNG");
                }
  
                // 작성자 닉네임
                const memberNickname = document.createElement("span");
                memberNickname.innerText = comment.memberNickname;
                
                // 작성일
                const commentDate = document.createElement("span");
                commentDate.classList.add("p-date");
                commentDate.innerText =  "(" + comment.commentCreateDate + ")";

                // 작성자 영역(p)에 프로필,닉네임,작성일 마지막 자식으로(append) 추가
                commentWriter.append(profileImage , memberNickname , commentDate);

                // 댓글 내용
                const commentContent = document.createElement("p");
                commentContent.classList.add("comment-content");

                // 왜 innerHTML?  <br> 태그 인식을 위해서
                commentContent.innerHTML = comment.commentContent;

                // 행에 작성자, 내용 추가
                commentRow.append(commentWriter, commentContent);

              
                // 로그인이 되어있는 경우 답글 버튼 추가
                if(memberNo != ""){
                    // 버튼 영역
                    const commentBtnArea = document.createElement("div");
                    commentBtnArea.classList.add("comment-btn-area");

                    // 답글 버튼
                    const childCommentBtn = document.createElement("button");
                    childCommentBtn.setAttribute("onclick", "showInsertComment("+comment.commentNo+", this)");
                    childCommentBtn.innerText = "답글";

                    // 버튼 영역에 답글 버튼 추가
                    commentBtnArea.append(childCommentBtn);

                    // 로그인한 회원번호와 댓글 작성자의 회원번호가 같을 때만 버튼 추가
                    if( memberNo == comment.memberNo   ){

                        // 수정 버튼
                        const updateBtn = document.createElement("button");
                        updateBtn.innerText = "수정";

                        // 수정 버튼에 onclick 이벤트 속성 추가
                        updateBtn.setAttribute("onclick", "showUpdateComment("+comment.commentNo+", this)");                        


                        // 삭제 버튼
                        const deleteBtn = document.createElement("button");
                        deleteBtn.innerText = "삭제";
                        // 삭제 버튼에 onclick 이벤트 속성 추가
                        deleteBtn.setAttribute("onclick", "deleteComment("+comment.commentNo+")");                       


                        // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                        commentBtnArea.append(updateBtn, deleteBtn);

                    } // if 끝
                    

                    // 행에 버튼영역 추가
                    commentRow.append(commentBtnArea); 
                }
                

                // 댓글 목록(ul)에 행(li)추가
                commentList.append(commentRow);
            }

        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    });
}

// 댓글 등록
const addComment = document.getElementById("addComment");
const commentContent = document.getElementById("commentContent");

addComment.addEventListener("click", function(){ // 댓글 등록 버튼이 클릭이 되었을 때

    // 1) 로그인이 되어있나? -> 전역변수 memberNo 이용
    if(memberNo == ""){ // 로그인 X
        alert("로그인 후 이용해주세요.");
        return;
    }

    // 2) 댓글 내용이 작성되어있나?
    if(commentContent.value.trim().length == 0){ // 미작성인 경우
        alert("댓글을 작성한 후 버튼을 클릭해주세요.");

        commentContent.value = ""; // 띄어쓰기, 개행문자 제거
        commentContent.focus();
        return;
    }

    // 3) AJAX를 이용해서 댓글 내용 DB에 저장(INSERT)
    $.ajax({
        url : "/comment/insert",
        data : {"commentContent" : commentContent.value,
                "memberNo" : memberNo,
                "boardNo" : boardNo },
        type : "post",
        success : function(result){

            if(result > 0){ // 등록 성공
                alert("댓글이 등록되었습니다.");

                commentContent.value = ""; // 작성했던 댓글 삭제

                selectCommentList(); // 비동기 댓글 목록 조회 함수 호출
                // -> 새로운 댓글이 추가되어짐

            } else { // 실패
                alert("댓글 등록에 실패했습니다...");
            }

        },

        error : function(req, status, error){
            console.log("댓글 등록 실패")
            console.log(req.responseText);
        }
    });

});
