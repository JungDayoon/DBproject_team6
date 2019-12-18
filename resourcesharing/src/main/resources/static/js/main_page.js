var category_name;
var dept_name;


/* URL parameter로 유저 정보 획득 */
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



/* 렌더링 함수 */
var renderTable = async function (uri) {
    $.ajax(
        {
            url: "http://192.168.43.113:8080" + uri,
            type: 'GET',
            contentType: "application/json; charset=utf-8",
            data: {}
        }
    ).done((data) => {
        $('#item_table').empty();
        var idx = 1;
        var thead = "<tr>"+
            "<th>물품명</th>"+
            "<th>대여학과</th>"+
            "<th>대여가능수량</th>"+
            "<th>수량선택</th>"+
            "<th>대여</th>        </tr>"
        $('#table').prepend(thead);
        for (var i = 0; i < data.length; i++) {
            
            var rowItem = `<tr class='${data[i].dname}'>`
            rowItem += "<td>" + data[i].iname + "</td>"
            rowItem += "<td>" + data[i].dname + "</td>"
            rowItem += "<td>" + data[i].count + "</td>"
            rowItem += "<td><input style='text-align: center;' type='text' placeholder='수량입력'></td>"
            rowItem += "<td><button class='btn btn-info'>빌리기</button></td>"
            rowItem += "</tr>"
            $('#item_table').append(rowItem)
            idx++;
        }
    });
}

renderTable("/items");

/* 리스너 */
$("#mypage").click((event) => {
    console.log("main page clicked");
    location.href = 'mypage?userid=' + userId;
});

$(".category_list").click((event) => {
    console.log("clicked");
    category_name = event.currentTarget.id;
    renderTable(`/items/of/${category_name}`);
});


$(".dept_list").change((event) =>{
    dept_name = event.currentTarget.id;
    if($(`#${dept_name}`).is(":checked")){
        $(`.${dept_name}`).show();
    }else {
        $(`.${dept_name}`).hide();
    }
});

$(".borrow").click((event) => {
    var category_name = event.currentTarget.id;
});


$("#signout").click(()=>{
    location.href="/";
});

$("#title").click(()=>{
    location.reload();
});
