var userId = new URLSearchParams(window.location.search).get('userid');
var idx=1;
$.ajax(
    {
        url: "http://192.168.43.113:8080/users/" + userId,
        type: 'GET',
        contentType: "application/json; charset=utf-8",
        data: {}
    }
).done((data) => {
    console.log(data);
    var infoStr = "Student Number: " + data.uuid + "<br>Name: " + data.uname + "<br>Major: " + data.dname;
    console.log(infoStr);
    $("#myinfo").html(infoStr);
});

$.ajax(
    {
        url: "http://192.168.43.113:8080/users/" + userId +"/myitems",
        type: 'GET',
        contentType: "application/json; charset=utf-8",
        data: {}
    }
).done((data) => {
    console.log(data);
    for(var i = 0; data.length; i++)
    {
        var rowItem = "<tr>"
        rowItem += "<td> "+ idx + "</td>"
        rowItem += "<td>" + data[i].iname + "</td>"
        rowItem += "<td>" + data[i].dname + "</td>"
        rowItem += "<td>" + data[i].count + "</td>"
        rowItem += "<td>" + data[i].start_date + "</td>"
        rowItem += "<td>" + data[i].end_date + "</td>"
        rowItem += "</tr>"
        $('#myitem_table').append(rowItem)
        idx++;
    }
});

$("#mainpage").click((event) => {
    console.log("main page clicked");
    location.href = 'main_page?userid=' + userId;
});

$("#signout").click(()=>{
    location.href="/";
});

$("#title").click(()=>{
    location.reload();
});