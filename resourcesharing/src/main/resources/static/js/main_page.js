var category_name = new Array();
var admin;
var dname;
var selected_cname;
var d1 = "컴퓨터학부"
var d2 = "전기공학과"
var d3 = "전자공학부"
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
    admin = data.admin;
    dname = data.dname;

    if(admin == false)
    {
        $("#add-item").hide();
    }
    else{
        console.log(dname);
        $("#admin-dname").text(dname);
    }
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
        
        var idx = 1;

        var thead =
       
            "<tr><th>품목</th>"+
            "<th>대여학과</th>"+
            "<th>대여가능수량</th>"+
            "<th>수량선택</th>"+
            "<th>대여</th></tr>";    
            // var text = $('#table').text(); 
            // $('#table').text(thead + text);
            
        $('#table_head').html(thead);
        $('#item_table').empty();
        for (var i = 0; i < data.length; i++) {
            //console.log(data);
            var rowItem = `<tr class='${data[i].dname} ${data[i].cname} item'>`
            rowItem += "<td>" + data[i].iname + "</td>"
            rowItem += "<td>" + data[i].dname + "</td>"
            rowItem += "<td id = '" + data[i].iid + "_count'>" + data[i].count + "</td>"
            rowItem += "<td><input style='text-align: center;' type='text' placeholder='수량입력' id = '"+ data[i].iid +"_quantity'></td>"
            rowItem += "<td><button class='btn btn-info borrow' id = '"+ data[i].iid +"'>빌리기</button></td>"
            rowItem += "</tr>"
            $('#item_table').append(rowItem)
            idx++;
        }
    });
}

renderTable("/items");

/* 리스너 */
$("#mypage").click((event) => {
    console.log("my page clicked");
    location.href = 'mypage?userid=' + userId;
});

$(".category_list").click((event) => {
    var category_name = event.currentTarget.id;

    renderTable(`/items/of/${category_name}`);
    // console.log(`${category_name}category clicked`);
    
    // $(d1).clicked = true;
    // $(d2).clicked = true;
    // $(d3).clicked = true;

    // $(".item").hide();
    // $(`.${category_name}`).show();


});

$(".dropdown-menu a").click(function(){
    console.log($(this).text());
    $("#add-cname").text($(this).text());

    // $("#add-name").text($("#selected").text());
})
$(".dept_list").change((event) =>{
    console.log('changed');
    var dept_name = event.currentTarget.id;
    console.log(dept_name);
    if($(`#${dept_name}`).is(":checked")){
        $(`.${dept_name}`).show();
    } else{
        $(`.${dept_name}`).hide();
    }
});


$("#title").click(()=>{
    location.reload();
});

$("#signout").click(()=>{
    location.href="/";
})


$("#add-button").click(()=>{

    console.log("http://192.168.43.113:8080/add/" + $("#add-iname").val() +"/" + dname + "/" + $("#add-cname").text() + "/" + $("#add-count").val());

    $.ajax(
        {
            url: "http://192.168.43.113:8080/items/add/" + $("#add-iname").val() +"/" + dname + "/" + $("#add-cname").text() + "/" + $("#add-count").val(),
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            data: {}
        }
    ).done((data) => {
        if(data == true)
        {
            alert("품목 추가가 완료되었습니다");
            location.reload();
        }
    });
});

$(document).ready(function(){
    $(document).on("click", ".borrow", function(event){
        var borrow_iid = event.currentTarget.id; //빌리기를 누른 아이템의 iid
        var borrow_quantity = Number($('#' + borrow_iid + '_quantity').val()); 
        var item_quantity = parseInt($('#' + borrow_iid + '_count').text()); 
    
        console.log("iid: " + borrow_iid + " 빌릴수량: " + borrow_quantity + " count: " + item_quantity);
    
        if(borrow_quantity > item_quantity)
        {
            alert("대여하려는 수량이 남은 수량보다 많습니다");
            //reload();
            return;
        }
    
        $.ajax(
            {
                url: "http://192.168.43.113:8080/services/" + userId + "/borrow/" + borrow_iid + "/" + borrow_quantity,
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                data: {}
            }
        ).done((data) => { //end_date 받아오기
            console.log(data);
            $.ajax(
                {
                    url: "http://192.168.43.113:8080/items/" + userId + "/" + borrow_iid,
                    type: 'GET',
                    contentType: "application/json; charset=utf-8",
                    data: {}
                }
            ).done((data) => {
                console.log(data);
                
                var string = "반납일은 " + data.end_date + " 입니다";
                alert(string);
                location.href = "mypage?userid=" + userId;
            });
        });
    })
})
