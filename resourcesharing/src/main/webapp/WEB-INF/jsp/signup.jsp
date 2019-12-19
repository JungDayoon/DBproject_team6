
<%@ page import="com.dbteam6.resourcesharing.model.dao.UserDao" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- 부트스트랩 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/bootstrap.min.css">

    <!-- 커스텀 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/custom.css">
<title>물품공유 웹사이트/회원가입</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">

      <a class="navbar-brand" href="#" id="title">물품 공유 웹 사이트</a>
      <button class = "navbar-toggler" type = "button" data-toggle = "collapse" data-target = "#navbar">
      		<span class ="navbar-toggler-icon"></span>
      </button>
        
    </nav>
    
    <div class="container">
        <div class="col-lg-5"></div>
        <div class="col-lg-5">
            <div class ="jumbotron">
                    <h3 style="text-align:center;">JOIN US</h3>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="학번" name ="userID" maxlength='13' id = "signupID"> <button class = "btn btn-primary" id = "idcheck">중복확인</button>
                    </div>
                    <div class ="form-group">
                        <input type ="password" class="form-control" placeholder="비밀번호" name ="userPassword" maxlength='20' id = "signupPW">
                    </div>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="이름" name ="userName" maxlength='20' id = "signupNAME">
                    </div>
                    <div class ="form-group">
                        <input type ="major" class="form-control" placeholder="학과" name ="userMajor" maxlength='20' id = "signupMAJOR">
                    </div>                   
                    <input type="button" class="btn btn-primary form-control" value="회원가입" id = "signUp">
            </div> 
        </div> 
        <div class="col-lg-4"></div>
    </div> 
   
<!-- 제이쿼리 자바스크립트 추가하기 -->

    <script src="./js/jquery-3.4.1.js"></script>

    <!-- Popper 자바스크립트 추가하기 -->

    <script src="./js/popper.min.js"></script>

    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="./js/bootstrap.min.js"></script>
    
    <script src="/js/signup.js"></script>
</body>
</html>