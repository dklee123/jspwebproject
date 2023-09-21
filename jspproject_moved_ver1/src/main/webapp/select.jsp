<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/select.css">
 
</head>
<style>
img.main{
width:200px;
}
</style>


<body>

<!-- 헤더영역 -->
<jsp:include page="header2.jsp" />

<!-- 메인영역  -->
<section>
<div class="container1">
        <a href="manual_calc.jsp">
        <div class="box">
            <p class="btn1"><img class="main" src="img/키보드아이콘.png"></p>
            <p class="btn-hover1"><img class="main" src="img/키보드호버.png"></p>
            <h1></h1>

            <p>직접견적</p>
        </div>
        </a>
    </div>
    
    
    <div class="container2">
        <a href="solution.jsp">
       <div class="box2">
            <p class="btn1"><img class="main" src="img/모니터.png"></p>
            <p class="btn-hover1"><img class="main" src="img/모니터호버.png"></p>
            <h1></h1>

            <p>머신러닝</p>
        </div>
        </a>
    </div>
</section>

<!-- 푸터영역 -->
<jsp:include page="footer2.jsp" />

</body>



</html>