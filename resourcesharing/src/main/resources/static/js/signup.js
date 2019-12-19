var id = null;
$("#idcheck").click(function (event) {
    id = $("#signupID").val();
    console.log(id);
    $.ajax({
        url: "http://192.168.43.113:8080/services/checkdup/" + id,
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        data: {}
    }).done(function (data) {
        console.log(data);

        if (data == false)
            alert("사용가능한 학번입니다");
        else {
            alert("이미 사용 중인 학번입니다");
            id = undefined;
        }

    });
});

$("#signUp").click(function (event) {
    var pw = $("#signupPW").val();
    var name = $("#signupNAME").val();
    var major = $("#signupMAJOR").val();
    console.log(id);
    console.log(pw);
    console.log(name);
    console.log(major);
    if (id == undefined){
        alert("아이디는 필수 입력값입니다.");
        return;
    }
    
    $.ajax({
        url: "http://192.168.43.113:8080/users/" + id + "/" + name + "/" + pw + "/" + major,
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        data: {}
    }).done(function (data) {
        console.log(data);
        alert("회원가입이 완료되었습니다.");
        location.href = "/";
    });

});

$("#title").click((event)=>{
    location.href = "/";
});
