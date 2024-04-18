$(function () {
    //아이디 저장하기 체크박스가 체크되었다가 해제되었을 때 mid 쿠키를 삭제함
    $("input:checkbox:checked").on("change", function () {
        //쿠키 삭제하기
        document.cookie = "val =; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/;";
        //현재 페이지를 새로고침해야 쿠키 삭제가 적용됨
        location.reload();
    });
})