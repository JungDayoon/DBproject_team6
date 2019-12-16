<%@ page import="com.dbteam6.resourcesharing.model.dao.UserDao" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>My Page</title>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 부트스트랩 CSS 추가하기 -->

<link rel="stylesheet" href="/css/bootstrap.min.css">

<!-- 커스텀 CSS 추가하기 -->

<link rel="stylesheet" href="/css/custom.css">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <a class="navbar-brand" href="#" id="title">마이페이지</a>
        <button class = "navbar-toggler" type = "button" data-toggle = "collapse" data-target = "#navbar">
                <span class ="navbar-toggler-icon"></span>
        </button>
  
        <div class="collapse navbar-collapse" id="navbar">
        </div>
        <button class="btn btn-info" id="signout">Sign Out</button>
        <button class="btn btn-light" id="mainpage">메인페이지</button>
      </nav>

   <div class="container mt-3"> 
    <div class="d-flex flex wrap">
       <div class="p-2 border bg-light"> 
           <div class="col-3"> 
               <div class="card" style="width: 16rem;"> 
                <div class="card-body"> 
                    <h5 class="card-title">My Info</h5>
                     <p class="card-text" id="myinfo">
                     </p> 
                     <a href="#" class="btn btn-primary">정보 수정</a> 
                </div> 
                </div> 
            </div> 
        </div> 

    <div class = "p-2 border bg-ligh">
            <div class="text-center bg-light m-3" id="contents" style="float: left;">
                <table id = "myitem_table" class="table table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>물품명</th>
                        <th>대여학과</th>
                        <th>대여한 수량</th>
                        <th>대여날짜</th>
                        <th>반납날짜</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
</div>
</div>


<!-- 제이쿼리 자바스크립트 추가하기 -->

<script src="/js/jquery-3.4.1.js"></script>


<!-- Popper 자바스크립트 추가하기 -->

<script src="/js/popper.min.js"></script>

<!-- 부트스트랩 자바스크립트 추가하기 -->

<script src="/js/bootstrap.min.js"></script>

<script src="/js/mypage.js"></script>
  
</body>

</html>