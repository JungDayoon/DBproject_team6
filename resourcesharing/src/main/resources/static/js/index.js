var connId;
var connName;
var connMajor;
var infoStr;

$("#signIn").click((event) => {
    $.ajax(
        {
            url: "http://192.168.43.113:8080/services/login/" + $("#userID").val() + "/" + $("#userPW").val(),
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            data: {}
        }
    ).done((data) => {
        console.log(data);
        if (data == false) {
            alert("잘못된 로그인 정보입니다.");
            location.reload();
        } else {
            location.href='main_page?userid=' + $("#userID").val();
        }

    });
});

$("#signUp").click((event) => {
    console.log("signup clicked");
    location.href='signup';
});

$("#myinfo").ready((event)=>{
    console.log("myinfo ready");
    console.log(infoStr);
    $("#myinfo").text(infoStr);
});

$("#title").click((event)=>{
    location.href='/';
})
