<%@ page import="net.minidev.json.JSONArray" %>
<%@ page import="net.minidev.json.JSONObject" %>
<%@ page import="com.dbteam6.resourcesharing.model.dao.CategoryDao" %>
<%@ page import="com.dbteam6.resourcesharing.model.dao.DeptDao" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!doctype html>

<html>

<head>
    <title>물품 공유 웹 사이트</title>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- 부트스트랩 CSS 추가하기 -->

    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- 커스텀 CSS 추가하기 -->

    <link rel="stylesheet" href="/css/custom.css">

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">

    <a class="navbar-brand" href="#" id="title">물품 공유 웹 사이트</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbar">

        <ul class="navbar-nav mr-auto">
            <%
                CategoryDao cDao = CategoryDao.getInstance();
                JSONArray categorys = cDao.findAll();
                for (Object category : categorys) {
                    JSONObject eachCat = (JSONObject) category;
                    out.println("<li class='nav-item active' id='test'> "
                            + "<a class='nav-link category_list' href='#' id='" + eachCat.get("cname") + "'>" + eachCat.get("cname") + "</a>"
                            + "</li>");
                }
            %>


        </ul>

        <button class="btn btn-info" id="signout">Sign Out</button>
        <button class="btn btn-light" id="mypage">마이페이지</button>

    </div>

</nav>

<div class="col-md-2" style="float:left">
    <!-- 사이드 바 메뉴-->
    <!-- 패널 타이틀1 -->
    <div id="sidebar" class="panel panel-info">
        <div class="panel-heading">
            <h5 class="panel-title">학과</h5>
        </div>
        <!-- 사이드바 메뉴목록1 -->

        <ul class="list-group">
            <%
                DeptDao dDao = DeptDao.getInstance();
                JSONArray departments = dDao.findAll();
                for(Object dept : departments){
                    JSONObject eachDept = (JSONObject) dept;
                    out.println("<li class='list-group-item'>"+
                        "<div class='custom-control custom-checkbox dept-list'>"+
                            "<input type='checkbox' checked id= '" + eachDept.get("dname") + "' class='custom-control-input'/>" + 
                            "<label class='custom-control-label' for='" + eachDept.get("dname") + "'>" + eachDept.get("dname") +"</label></div></li>");
                }
            %>
        </ul>
    </div>

</div>
</div>

<div class="text-center bg-light m-3" id="contents" style="float: left;">
    <table class="table table-hover" id="table">
        
        <tbody id = "item_table">
        </tbody>
    </table>
    <button class="btn large btn-light">+</button> <!-- 이 버튼은 관리자만 보이게 하기 -->
</div>
<!-- 제이쿼리 자바스크립트 추가하기 -->

<script src="/js/jquery-3.4.1.js"></script>

<!-- Popper 자바스크립트 추가하기 -->

<script src="/js/popper.min.js"></script>

<!-- 부트스트랩 자바스크립트 추가하기 -->

<script src="/js/bootstrap.min.js"></script>
<script src="/js/main_page.js"></script>
</body>

</html>