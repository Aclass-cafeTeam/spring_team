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


                // 프로필 + 댓글내용 등이 들어간 div
                const commentWriter = document.createElement("div");
                commentWriter.classList.add("comment-writer");

                // 프로필이미지 div
                const piArea = document.createElement("div");
                piArea.classList.add("pi-area");

                // 프로필 이미지
                const profileImage = document.createElement("img");

                if( comment.profileImage != null ){ // 프로필 이미지가 있을 경우
                    profileImage.setAttribute("src", comment.profileImage);
                }else{ // 없을 경우 == 기본이미지
                    profileImage.setAttribute("src", "/resources/images/main/프로필.PNG");
                }

                // 프로필이미지 div에 프로필이미지 추가
                piArea.append(profileImage);

                // 닉네임 + 등급이미지 + 댓글 내용 + 작성일이 들어간 div
                const commentArea = document.createElement("div");
                commentArea.classList.add("comment-area");

                // 닉네임 a태그가 들어간 span
                const commentWriterArea = document.createElement("span");
                commentWriterArea.classList.add("comment-writer-area");

                // 닉네임을 누르면 회원정보 페이지로 이동하는 a태그
                const memberNickname = document.createElement("a");
                memberNickname.setAttribute("href", "/member/"+comment.memberNo);
                memberNickname.innerText = comment.memberNickname;

                // commentWriterArea에 닉네임 a태그 추가
                commentWriterArea.append(memberNickname);

                // 등급이미지가 들어간 span
                const commentWriterLevel = document.createElement("span");
                commentWriterLevel.classList.add("comment-writer-level");

                // 등급이미지
                const levelImage = document.createElement("img");
                levelImage.classList.add("levelImage");
                levelImage.setAttribute("src", comment.memberLevelImage);

                // commentWriterLevel에 등급이미지 추가
                commentWriterLevel.append(levelImage);

                // 댓글 내용이 들어간 p태그
                const commentContentArea = document.createElement("p");
                commentContentArea.classList.add("comment-content-area");
                commentContentArea.innerHTML = comment.commentContent;

                // 작성일이 들어간 div
                const commentDate = document.createElement("div");
                commentDate.classList.add("comment-date");
                commentDate.innerText = comment.commentCreateDate;

                // comment-area에 합치기
                commentArea.append(commentWriterArea, commentWriterLevel, commentContentArea, commentDate);

                // commentWriter div에 piArea commentArea 추가
                commentWriter.append(piArea, commentArea);

                // comment-row 에 comment-writer추가
                commentRow.append(commentWriter);
                

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

                        // 로그인회원의 권한이 스탭이거나 로그인회원 == 댓글작성자가 같으면 삭제 버튼 노출
                        if((authorityNo==0 ||authorityNo==1) || memberNo == comment.memberNo){

                            // 삭제 버튼
                            const deleteBtn = document.createElement("button");
                            deleteBtn.innerText = "삭제";
                            // 삭제 버튼에 onclick 이벤트 속성 추가
                            deleteBtn.setAttribute("onclick", "deleteComment("+comment.commentNo+")");                       
                            // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                            commentBtnArea.append(updateBtn, deleteBtn);
                        }
                        // 버튼 영역 마지막 자식으로 수정 버튼 추가
                        commentBtnArea.append(updateBtn);

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
