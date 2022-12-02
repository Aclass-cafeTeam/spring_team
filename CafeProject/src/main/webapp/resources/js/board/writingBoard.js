console.log("writingBoard.js 연결확인");

// summnernote
$(function(){
    // summernote 출력 및 부가 기능 메소드
    $('#summernote').summernote({
        width : 859.99,      // 에디터 넓이
        height: 410,        // 에디터 높이
        focus: true,        // 에디터 로딩후 포커스를 맞출지 여부
        lang: 'ko-KR',      // 언어 : 한국어 설정
        placeholder: '내용을 입력하세요.',
        disableResizeEditor: true, // textarea size 고정
        toolbar: [
            // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture','link','video']]],
            fontNames: ['맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체','Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50'],
        // 이미지 업로드 이벤트가 발생했을 때 
        callbacks : { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files, editor) {
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadImageFile(files[i], this);
                }
            }
        }
    });
});


// 업로드된 이미지를 ajax를 이용하여 서버로 전송하여 저장하는 함수
function uploadImageFile(file, editor){
    
    // 매개변수 
    // file : 업로드된 이미지 정보
    // editor : 이미지 업로드가 발생한 summernote 에디터 요소
    
    form_data = new FormData();
    // FormData : form 태그 내부 값 전송을 위한  k:v 쌍을 쉽게 생성할 수 있는 객체
    
    form_data.append("file", file);
    // FormData 객체에 새로운 K, V 를 추가
    
    $.ajax({
        url : "/uploadImageFile",
        type : "post",
        data : form_data,
        dataType: "json",
        enctype: "multipart/form-data",   // 파일을 전달하기 때문에 enctype 설정 필수
        cache : false,
        contentType : false,
        // contentType : 서버로 전송되는 데이터의 형식 설정
        // 기본값  : application/x-www-form-urlencoded; charset=UTF-8
        // 파일 전송 시 multipart/form-data 형식으로 데이터를 전송해야 하므로
        // 데이터의 형식이 변경되지 않도록 false로 지정.
        
        processData : false,
        // processData : 서버로 전달되는 값을 쿼리스트링으로 보낼경우 true(기본값), 아니면 false
        //            파일 전송 시 false로 지정 해야 함.
        
        success : function(at){
            // console.log(at.url);
            // contextPath(최상위 주소)를 javascript로 얻어오는 방법
            // -> js 파일에서는 EL을 사용할 수 없음 (EL은 JSP에서만 사용 가능) 
            // var contextPath = location.pathname.substring(0, window.location.pathname.indexOf("/",2));
            
            // 저장된 이미지를 에디터에 삽입(이미지)
            $(editor).summernote('editor.insertImage', at.url);
        },
        error : function(e) {
            console.log(e);
        }
    })
}


// select 토글 버튼 (∧ ∨)
const select =document.querySelectorAll(".select")
const wrapper = document.querySelectorAll(".wrapper");
const boardCode = document.getElementById("boardCode");
const titleTagNo = document.getElementById("titleTagNo");
const noticeFlag = document.getElementById("noticeFlag");


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

if(boardCode.value != '') {
    console.log("버튼 활성화");
    document.querySelector(".tagBtn").classList.add("title-tag", "open");
}

select[1].addEventListener("click", ()=>{
    wrapper[1].classList.toggle("open")
});

function selectTag(type) {
    wrapper[1].classList.remove("open");
    select[1].firstElementChild.innerText = type.innerText;
    titleTagNo.value = parseInt(type.getAttribute("id"));
    select[1].firstElementChild.style.lineHeight= "1px";
    console.log(titleTagNo);
}    


// noticeFlag 선택
// const boardNotice = document.getElementById("boardNotice");
// const setting = document.getElementById("setting");

// // 공지로 등록을 선택하면
// boardNotice.addEventListener("change", ()=>{
    
//     if(this.checked){
//         // noticeFlag 선택
//         setting.style.display="block";
//     } else{
//         this.checked = false;
//         setting.style.display="none";
//     }
// });


// function noticeFlag(type) {
//     wrapper[2].classList.remove("open");
//     select[2].firstElementChild.innerText = type.innerText;
//     noticeFlag.value = parseInt(type.getAttribute("id"));
//     select[2].firstElementChild.style.lineHeight= "1px";
//     console.log(noticeFlag);

// }    


// 게시판 공지사항/자유게시판일 때만 말머리가 활성화....




// 글쓰기 작성 기본 유효성 검사
const boardTitle = document.querySelector("[name='boardTitle']");
const boardContent = document.querySelector("[name='boardContent']");

function writeValidate() {
    console.log("글 작성 유효성 검사");
    

    if(boardCode.value=='') {
        alert("게시판을 선택하세요.");
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
    return true;
}




// 임시등록(modal사용)
const tempSave = document.getElementById("btn-tempSave"); // 임시등록
const modalBtn = document.getElementById("modalBtn"); // 모달창으로 이동
const boardModal = document.getElementById("boardModal"); // 모달창
const btnClose = document.getElementById("btn-close"); // 닫기버튼


// 임시등록 버튼 누르면 임시저장
tempSave.addEventListener("click", (e)=>{
    // const boardTitle = document.querySelector("[name='boardTitle']");
    // const boardContent = document.querySelector("[name='boardContent']");

    // 제목이나 내용이 없을 때
    if(boardTitle.value.trim().length==0 || boardContent.value.trim(). length==0) {
        alert("제목이나 내용을 입력해주세요.");
        e.preventDefault();
    }
        
    // 임시등록 테이블에 저장
    // var formValues = new FormData($("form[name='boardWriteForm']")[0]);
    // alert(formValues.boardTitle);
    const fm = document.getElementById("boardWriteForm");

    $.ajax({
        url: "/board/write/tempPost",
        type: "post",
        data: $(fm).serialize(),

        success: (result)=>{
            // 저장 성공 시 알럿창 띄우기
            if(result > 0) {
                alert("임시등록이 완료되었습니다.");
            }
        },
        error:()=>{
            alert("임시등록 실패");
        }


    })
})


// 카운트(수)를 누르면 임시등록 모달창으로 이동
modalBtn.addEventListener("click",()=>{
    if(boardModal != null) {
        boardModal.style.display="flex";
    }
})

btnClose.addEventListener("click", () =>{

    boardModal.style.display="none";
})