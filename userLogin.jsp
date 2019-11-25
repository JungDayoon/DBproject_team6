<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">

        <span class="navbar-toggler-icon"></span>

      </button>

     
    </nav>

	<div style = "display:inline; min-width: 900px;">
		<div class = "container mt-5" style ="text-align: center; display:inline; float:left; max-width: 600px;">
		team6 project 입니다.
		</div>
    	<div class="container mt-5" style="display:inline; float:left; max-width: 500px;">

      <form method="post" action="./userLoginAction.jsp">

        <div class="form-group">

          <label>Username</label>

          <input type="text" name="userID" class="form-control">

        </div>

        <div class="form-group">

          <label>Password</label>

          <input type="password" name="userPassword" class="form-control">

        </div>

<!--         <button type="submit" class="btn btn-primary" >Sign in</button> -->

			<input class = "btn btn-primary" type = "button" value = "sign in" onclick = "location.href = 'index.jsp'">
      </form>

    </div>
	</div>

   
    <!-- 제이쿼리 자바스크립트 추가하기 -->

    <script src="./js/jquery.min.js"></script>

    <!-- Popper 자바스크립트 추가하기 -->

    <script src="./js/popper.min.js"></script>

    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="./js/bootstrap.min.js"></script>

  </body>

</html>