<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!doctype html>

<html>

  <head>

    <title>물품 공유 웹 사이트</title>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- 부트스트랩 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/bootstrap.min.css">

    <!-- 커스텀 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/custom.css">

  </head>

  <body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">

      <a class="navbar-brand" href="index.jsp">물품 공유 웹 사이트</a>
      <button class = "navbar-toggler" type = "button" data-toggle = "collapse" data-target = "#navbar">
      		<span class ="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbar">
    
        <ul class="navbar-nav mr-auto">

          <li class="nav-item active">

            <a class="nav-link" href = "index.jsp">item1</a>

          </li>

		<li class="nav-item">

            <a class="nav-link" href = "#">item2</a>

          </li>
        <li class="nav-item">

            <a class="nav-link" href = "#">item3</a>

          </li>
        <li class="nav-item">

            <a class="nav-link" href = "#">item4</a>

          </li>
        <li class="nav-item">

            <a class="nav-link" href = "javascript:window.location.reload(true)">item5</a>

          </li>        

        </ul>
        
        <a class = "navbar-brand" href = "#">마이페이지</a> 

        <form class="form-inline my-2 my-lg-0">

          <input class="form-control mr-sm-2" type="search" placeholder="물품을 검색하세요." aria-label="Search">

          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">search</button>

        </form>

      </div>

    </nav>

	<div class="col-md-2" style="float:left">
<!-- 사이드 바 메뉴-->
  <!-- 패널 타이틀1 -->
<div id = "sidebar" class="panel panel-info">
    <div class="panel-heading">
      <h5 class="panel-title">IT대학</h5>
    </div>
    <!-- 사이드바 메뉴목록1 -->
    <ul class="list-group" >
      <li class="list-group-item"><a href="#">컴퓨터학부</a></li>
      <li class="list-group-item"><a href="#">전자공학부</a></li>
      <li class="list-group-item"><a href="#">전기공학과</a></li>
    </ul>
</div>
  <!-- 패널 타이틀2 -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h5 class="panel-title">Panel Title</h5>
  </div>
    <!-- 사이드바 메뉴목록2 -->
      <ul class="list-group">
        <li class="list-group-item"><a href="#">jQuery</a></li>
        <li class="list-group-item"><a href="#">BootStrap</a></li>
      </ul>
</div>      
  <!-- 패널 타이틀3 -->
<div class="panel panel-info">
  <div class="panel-heading">
    <h5 class="panel-title">Panel Title</h5>
  </div>
      <!-- 사이드바 메뉴목록3 -->
      <ul class="list-group">
        <li class="list-group-item"><a href="#">About</a></li>
        <li class="list-group-item"><a href="#">Help</a></li>
      </ul>
    </div>
</div> 

<div class = "text-center bg-light m-3" id = "contents" style = "float: left;" >
<table class="table table-hover">
      <thead>
        <tr>
          <th>#</th>
          <th>물품명</th>
          <th>대여장소</th>
          <th>대여가능수량</th>
          <th>수량선택</th>
          <th>대여</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>라즈베리파이</td>
          <td>IT융복합관 324호</td>
          <td>10</td>
          <td><form><input style = "text-align: center;" type = "text" placeholder= "수량입력"></form></td>
          <td><button class="btn btn-info" >빌리기</button></td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>의자</td>
          <td>IT2호관 1층</td>
          <td>30</td>
          <td><form><input style = "text-align: center;" type = "text" placeholder= "수량입력"></form></td>
          <td><button class="btn btn-info" >빌리기</button></td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>스피커</td>
          <td>공대9호관 4층</td>
          <td>3</td>
          <td><form><input style = "text-align: center;" type = "text" placeholder= "수량입력"></form></td>
          <td><button class="btn btn-info" >빌리기</button></td>
        </tr>
      </tbody>
    </table>
    <button class = "btn large btn-light">+</button> <!-- 이 버튼은 관리자만 보이게 하기 -->
</div>
    <!-- 제이쿼리 자바스크립트 추가하기 -->

    <script src="./js/jquery-3.4.1.js"></script>

    <!-- Popper 자바스크립트 추가하기 -->

    <script src="./js/popper.min.js"></script>

    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="./js/bootstrap.min.js"></script>

  </body>

</html>



