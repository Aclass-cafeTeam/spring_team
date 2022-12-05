

// 카페정보 버튼
const btn1 = document.getElementById("btn1");
// 나의활동 버튼
const btn2 = document.getElementById("btn2");

btn2.addEventListener("click", function(){ //나의 활동 정보가 보이고 싶을 때 
    
    const info = document.querySelectorAll("#content > .basicCafe-info")[0];
   
    const active = document.querySelectorAll("#content > .basicMy-active")[0];
    
    if(info.classList.contains("basicCafe-info")){
        info.classList.remove("cafe-info");  //카페정보 보일 때
        info.classList.add("cafe-info2");  //카페정보 안 보일 때
        
        active.classList.remove("my-active");  //나의 정보가 안 보일때 
        active.classList.add("my-active2"); //나의 정보가 보일때 
    }

});

btn1.addEventListener("click", function(){//카페 정보가 보이고 싶을 때 
    
    const info = document.querySelectorAll("#content > .basicCafe-info")[0];

    const active = document.querySelectorAll("#content > .basicMy-active")[0];

    if(active.classList.contains("basicMy-active")){
        active.classList.remove("my-active2"); //나의 정보가 보일때 
        active.classList.add("my-active");//나의 정보가 안 보일때
        
        info.classList.remove("cafe-info2"); //카페정보 안 보일 때
        info.classList.add("cafe-info"); //카페정보 보일 때
    }

});

// 멤버 랭킹-댓글 버튼
const memberComment = document.getElementById("member_comment");
// 멤버 랭킹-게시글 버튼
const memberBoard = document.getElementById("member_board");
// 멤버 랭킹-방문 버튼
const memberVisit = document.getElementById("member_visit");

// 멤버랭킹 - 댓글
const memberCommentRank = document.getElementsByClassName("memberCommentRank");
// 멤버랭킹 - 게시글
const memberBoardRank = document.getElementsByClassName("memberBoardRank");
// 멤버랭킹 - 방문
const memberLoginRank = document.getElementsByClassName("membeLoginRank");

// memberBoard.addEventListener("click", function(){ // 랭킹-게시글 보이고 싶을때
    
//     const comment = document.querySelectorclass("#ranking > .memberCommentRank");
//     const board = document.querySelectorclass("#ranking > .memberBoardRank");
//     const visit = document.querySelectorAll("#ranking > .basicMy-active")[0];

//     // document.getElementsByClassName("memberCommentRank").style.display = "none";
//     // document.getElementsByClassName("memberBoardRank").style.display = "block";

//     $(".memberCommentRank").hide();
//     $(".memberBoardRank").show();
    
// });

// $(function(){

//     memberComment.on("click", function(){
//         console.log("버튼누름");
//         memberBoardRank.show();
//         memberVisitRank.hide();
//         memberCommentRank.hide();
//     })

// });

$(function() {
    // 멤버랭킹 - 게시글 버튼 눌렀을 때
    $("#member_board").on("click", function() {
        $(".memberBoardRank").show();
        $(".memberCommentRank").hide();
        $(".memberLoginRank").hide();
        console.log("버튼누름");
        // 버튼 css 바뀌기
        $("#member_board").css("color", "red");
        $("#member_board").css("cursor", "text");
        $("#member_board").css("text-decoration", "none");
        // 다른 버튼 css 기본값으로
        $("#member_visit").css("color", "#333333");
        $("#member_visit").css("cursor", "pointer");
        $("#member_comment").css("color", "#333333");
        $("#member_comment").css("cursor", "pointer");
    });

    // 멤버랭킹 - 방문 버튼 눌렀을 때
    $("#member_visit").on("click", function() {
        $(".memberBoardRank").hide();
        $(".memberCommentRank").hide();
        $(".memberLoginRank").show();
        console.log("버튼누름");
        // 버튼 css 바뀌기
        $("#member_visit").css("color", "red");
        $("#member_visit").css("cursor", "text");
        $("#member_visit").css("text-decoration", "none");
        // 다른 버튼 css 기본값으로
        $("#member_board").css("color", "#333333");
        $("#member_board").css("cursor", "pointer");
        $("#member_comment").css("color", "#333333");
        $("#member_comment").css("cursor", "pointer");
        $("#member_board").css("text-decoration", "none");
    })

    $("#member_comment").on("click", function() {
        $(".memberBoardRank").hide();
        $(".memberCommentRank").show();
        $(".memberLoginRank").hide();
        console.log("버튼누름");
        // 버튼 css 바뀌기
        $("#member_comment").css("color", "red");
        $("#member_comment").css("cursor", "text");
        $("#member_comment").css("text-decoration", "none");
        // 다른 버튼 css 기본값으로
        $("#member_visit").css("color", "#333333");
        $("#member_visit").css("cursor", "pointer");
        $("#member_board").css("color", "#333333");
        $("#member_board").css("cursor", "pointer");
    })


    
})

// memberBoard.addEventListener("click", function(){

//     console.log("버튼누름");
//     memberCommentRank.hide();
//     memberVisitRank.hide();
//     // memberBoardRank.add();

// });

// memberComment.addEventListener("click", function(){ // 랭킹-게시글 보이고 싶을때
    
//     const comment = document.querySelectorAll("#ranking > .memberCommentRank");
//     const board = document.querySelectorAll("#ranking > .memberBoardRank");
//     const visit = document.querySelectorAll("#ranking > .basicMy-active")[0];

//     $(board).hide();
//     $(comment).show();
    
    

// });

// memberComment.addEventListener("click", function(){ // 랭킹-댓글 보이고 싶을때
    
//     const comment = document.querySelectorAll("#ranking > .memberCommentRank")[0];
//     const board = document.querySelectorAll("#ranking > .memberBoardRank")[0];
//     const visit = document.querySelectorAll("#ranking > .basicMy-active")[0];
    
//     if(info.classList.contains("memberCommentRank")){
//         comment.classList.remove("memberCommentRank");  //댓글랭킹 보일 때
//         comment.classList.add("memberCommentRank2");  //댓글랭킹 안 보일 때
        
//         board.classList.remove("memberBoardRank");  //게시글랭킹 안 보일때 
//         board.classList.add("memberBoardRank2"); //게시글랭킹 보일때

//     }

// });