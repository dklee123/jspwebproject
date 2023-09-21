<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Intro page</title>
</head>

<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.container1{
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;

}
.container1  .box {
    
    padding: 50px;
    font-weight: 900;
}
    .container1  .box:hover {
        color: white;
        background-color: black;
    }
.container1 .box h1 {
    text-align: center;
}
.container1 .box p{
    text-align: center;
}

.container1 .box p.btn{
    text-align: center;
}
.container1  .box p.btn-hover{
    text-align: center;
    display: none;
}
.container1  .box:hover p.btn{
    text-align: center;
    display: none;
}
.container1  .box:hover p.btn-hover{
    text-align: center;
    display: block;
}


div.box{
    width: 500px;
    height: 280px;
}
div.box2{
    width: 500px;
    height: 280px;
}

.container2  .box2 {
    
    padding: 50px;
    font-weight: 900;
}
    .container2  .box2:hover {
        color: white;
        background-color: black;
    }

.container2  .box2 h1{
    text-align: center;
}
.container2  .box2 p{
    text-align: center;
}

.container2  .box2 p.btn{
    text-align: center;
}
.container2  .box2 p.btn-hover{
    text-align: center;
    display: none;
}
.container2  .box2:hover p.btn{
    text-align: center;
    display: none;
}
.container2  .box2:hover p.btn-hover{
    text-align: center;
    display: block;
}


    a {
        text-decoration: none;
        color:black;
    }
    
    
    </style>
<body>

    <header>
       

    </header>


   <div class="container1">
        <a href="login.jsp">
        <div class="box">
            <p class="btn"><img src="img/intro_login.png"></p>
            <p class="btn-hover"><img src="img/intro_login_hover.png"></p>
            <h1>Member</h1>

            <p>* 일반회원 & 업체회원 로그인</p>

            <!-- <a href="customerlogin.jsp">더 알아보기</a> -->

        </div>
        </a>
    </div>
    
    
    <div class="container2">
        <a href="index.jsp">
        <div class="box2" onclick="alert('회원가입 유도 문구')">
            <p class="btn"><img src="img/intro_login2.png"></p>
            <p class="btn-hover"><img src="img/intro_login2_hover.png"></p>
            <h1>Guest</h1>

            <p>* 비회원 로그인</p>

            <!-- <a href="companylogin.jsp">더 알아보기</a> -->

        </div>
        </a>
    </div>

</body>

</html>