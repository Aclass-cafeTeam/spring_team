// 글쓰기로 이동
(()=>{
    const insertBtn = document.getElementById("insertBtn");

    if(insertBtn != null) { // 로그인 후에 글쓰기 버튼이 존재할 때
        insertBtn.addEventListener("click", ()=>{
            location.href = "/board/write/";
        });
    }
})();

// 목록으로 버튼
// const goToListBtn = document.getElementById("goToListBtn");

// goToListBtn.addEventListener("click", ()=>{

//     // location : 주소, 주소창과 관련 내장 격체
//     // location.href : 현재 주소 (전체)
//     // location.href = "주소" : 작성된 주소로 요청
//     // location pathname = 현재 요청 주소만을 빈환(프로토콜,ip,포트 제외)
//     // location.search 쿼리스트링만 힙합

//     const pathname = location.pathname; // /board/1/1500

//     const queryString = location.search; // ?cp=7

//      // /board/1?cp=7
//      // &key=t&query=test
//     const url = pathname.substring(0, pathname.lastIndexOf("/"))
//         + queryString;

//     location.href = url;
// });

// 검색을 한 경우 검색창에 검색 key, query 남겨놓기
(() => {
    const select = document.getElementById("search-key");
    const input = document.getElementById("search-query");
    const option = document.querySelectorAll("#search-key > option");

    if (select != null) { // 검색창이 존재할 때
        const params = new URL(location.href).searchParams; // 주소에서 쿼리스트링만 분리한 객체
        
        const key = params.get("key");
        const query = params.get("query");

        // input에 이전 검색어를 값으로 추가
        input.value = query;

        // select에서 이전 검색한 key의 값과 일치하는 option 태그에
        // selected 속성 추가
        for(let op of option){

            // option의 value와 key가 일치할 때
            if(op.value == key){
                // op.setAttribute("selected", true);
                op.selected = true;
            }
        }
    }
})();


// 공지 숨기기
document.getElementById("noticeHide").addEventListener("change", function(e){
    console.log(e);
    const strongList = document.getElementsByClassName("strong");
    let ds;
    if(e.target.checked){ // 체크 되었을 때
        ds = "none";
    }else{
        ds = "table-row";
    }

    // ajax -> 숨기기 체크 여부 세션에 올리기
    // $.ajax({
    //     url : "/board",
    //     data: {},
    //     type: "GET",
    //     success: function(result){
    //         if(result > 0){

    //         }
    //     }

    // })
    // ajax-success
    for(let item of strongList){
        item.parentElement.style.display = ds;
    }

    
})

// + 페이지 이동 시 체크여부를 확인해서 
// 1) 체크박스 체크 할지 말지
// 2) 공지 출력 할지 말지