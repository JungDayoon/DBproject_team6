var userId = new URLSearchParams(window.location.search).get('userid');
var admin;
var idx=1;
var dname;
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
    if(admin == true)
    {
        var infoStr = "<hr><strong>Student Number: </strong>" + data.uuid + "<br><strong>Name: </strong>" + data.uname + "(관리자)<br><strong>Major: </strong>" + data.dname;
    }
    else
    {
        var infoStr = "<hr><strong>Student Number: </strong>" + data.uuid + "<br><strong>Name: </strong>" + data.uname + "<br><strong>Major: </strong>" + data.dname;
    }
    dname = data.dname;
    console.log(infoStr);
    console.log(admin);
    $("#myinfo").html(infoStr);

    
    if(admin == true)
    {
        $.ajax({
            url: "http://192.168.43.113:8080/items/from/" + dname,
            type: 'GET',
            contentType: "application/json; charset=utf-8",
            data: {}
        }).done((data) => {
        console.log(data);
        $("#myitem_div").html("우리 학부 물품리스트");

        var rowName = "<th>#</th>";
        rowName += "<th>물품명</th>";
        rowName += "<th>카테고리</th>";
        rowName += "<th>학과</th>";
        rowName += "<th>현재수량</th>";
        rowName += "<th>수정할수량</th>"
        rowName += "<th>수정</th>";
        $('#myitem_index').append(rowName);
        for(var i = 0; i < data.length; i++)
        {
        var rowItem = "<tr>"
        rowItem += "<td> "+ idx + "</td>"
        rowItem += "<td>" + data[i].iname + "</td>"
        rowItem += "<td>" + data[i].cname + "</td>"
        rowItem += "<td>" + data[i].dname + "</td>"
        rowItem += "<td>" + data[i].count + "</td>"
        rowItem += "<td><input style='text-align: center;' type='text' placeholder='수정할 수량' id = '"+ data[i].iid +"_quantity'></td>";
        rowItem += "<td><button class = 'btn btn-primary modify' id = '" + data[i].iid + "'>수정하기</button></td>";
        rowItem += "</tr>"
        $('#myitem_table').append(rowItem)
        idx++;
        }

        });
    }

    else {
        $.ajax({
            url: "http://192.168.43.113:8080/users/" + userId + "/myitems",
            type: 'GET',
            contentType: "application/json; charset=utf-8",
            data: {}
        }).done((data) => {
            $("#myitem_div").text("내가 빌린 물품리스트");
            console.log(data);
            var rowName = "<th>#</th>"; 
            rowName += "<th>물품명</th>"; 
            rowName += "<th>대여학과</th>"; 
            rowName += "<th>대여한 수량</th>"; 
            rowName += "<th>대여날짜</th>"; 
            rowName += "<th>반납날짜</th>"; 
            rowName += "<th>반납</th>";
            rowName += "<th></th>"
            $('#myitem_index').append(rowName);

            for (var i = 0; i < data.length; i++) {
                var rowItem = "<tr>"
                rowItem += "<td> " + idx + "</td>"
                rowItem += "<td>" + data[i].iname + "</td>"
                rowItem += "<td>" + data[i].dname + "</td>"
                rowItem += "<td>" + data[i].count + "</td>"
                rowItem += "<td>" + data[i].start_date + "</td>"
                rowItem += "<td>" + data[i].end_date + "</td>"
                rowItem += "<td><button class = 'btn btn-primary return' id = '" + data[i].iid + "'>반납하기</button></td>";
                $('#myitem_table').append(rowItem);
            }
        });
    }
    //location.reload();
});

$("#modify_btn").click((event)=>{ //정보수정
    location.href = 'modify_page?userid=' + userId;
});


$(document).on("click", ".modify", function(event){
    var modify_id = event.currentTarget.id;
    var modify_count = $('#'+modify_id + '_quantity').val();

    console.log(modify_id);
    console.log(modify_count);
    $.ajax({
            url: "http://192.168.43.113:8080/items/update/" + modify_id + "/" + modify_count,
            type: 'PUT',
            contentType: "application/json; charset=utf-8",
            data: {}
        }).done((data) => {
            console.log("modify:" + data);
            if(data == true)
            {
                alert("품목 업데이트가 완료됐습니다");
                location.reload();
            }
        });
});

$(document).on("click", ".return", function(event){
    var return_id = event.currentTarget.id; // + userId로 반납
    console.log(return_id);

    $.ajax({
        url: "http://192.168.43.113:8080/items/return/" + return_id + "/of/" + userId,
        type: 'DELETE',
        contentType: "application/json; charset=utf-8",
        data: {}
    }).done((data) => {
        console.log("modify:" + data);
        if(data == true)
        {
            alert("품목 반납이 완료됐습니다");
            location.reload();
        }
    });
});
$("#signout").click(()=>{
    location.href="/";
});

$("#mainpage").click(()=>{
    location.href="main_page?userid=" + userId;
});