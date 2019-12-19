var userId = new URLSearchParams(window.location.search).get('userid');
$.ajax(
    {
        url: "http://192.168.43.113:8080/users/" + userId,
        type: 'GET',
        contentType: "application/json; charset=utf-8",
        data: {}
    }
).done((data) => {
    console.log(data);
});

$("#modify_done").click(function (event) {
    pw = $("#new_pw").val();
    cpw = $("#confirm_pw").val();
    console.log(pw + ", " + cpw);
    if(pw != cpw)
    {
        alert("비밀번호 입력이 맞지 않습니다");
        return;
    }
    $.ajax({
        url: "http://192.168.43.113:8080/users/" + userId + "/pwd/" + pw,
        type: 'PUT',
        contentType: "application/json; charset=utf-8",
        data: {}
    }).done(function (data) {
        console.log(data);
        if(data == 1){
            console.log("변경완료");
            location.href = "/";
        }
            
    });
});
