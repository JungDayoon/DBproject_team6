<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

</nav>

<div class="container-fluid">
    <div class="jumbotron text-center mb-0">
        <h1 class="display-4"> team6 project 입니다.</h1>
        <p class="lead"> 물품공유 웹사이트</p>
        <p>DB 팀 프로젝트로 제작된 물품공유 웹사이트 입니다</p>
    </div>
</div>
<div class="container-fluid" style="text-align: center; position: relative; display:inline-block; padding: 6px;">
    <div class="banner center-block col-md-4">
        <div class="container mt-5" style="display:inline; max-width: 500px;">


            <div class="form-group">

                <label>학번</label>

                <input type="text" name="userID" class="form-control" id="userID">

            </div>

            <div class="form-group">

                <label>Password</label>

                <input type="password" name="userPassword" class="form-control" id="userPW">

            </div>

            <!--         <button type="submit" class="btn btn-primary" >Sign in</button> -->

            <button class="btn btn-primary" type="button" id="signUp">Join Us</button>
            <input class="btn btn-primary" type="button" value="sign in" id="signIn">


        </div>
    </div>
</div>
<!-- 제이쿼리 자바스크립트 추가하기 -->

<script src="/js/jquery-3.4.1.js"></script>

<!-- Popper 자바스크립트 추가하기 -->

<script src="/js/popper.min.js"></script>

<!-- 부트스트랩 자바스크립트 추가하기 -->

<script src="/js/bootstrap.min.js"></script>

<!-- Custom javascript-->
<script src="/js/index.js"></script>

</body>

</html>