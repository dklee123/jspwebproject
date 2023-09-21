<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
header {
position:relative;

}
.top {
	border: 5px dotted red;	
	height: 50px;
	/* background-color: white; */
}

ul.topmenu {
	border: 5px dotted orange;
	height: 50px;
	width: 150px;
	float: right;
	margin: 0;
	padding-left:30px;
	padding-right:30px;
	
} 

ul.topmenu li {
	text-align: center;
	list-style-type: none;
}

ul.topmenu li a {
	text-decoration:none;
	color:black;
	float:left;	
	padding-left:10px;	
	padding-top:15px;	
	padding-right:5px;
	font-weight:bold;	
	
	
}

.logo {
	width:100px;
	height:0px;
	padding-top: 15px;
}
.logo img{
	width:130px;
	padding-top:20px;
}

.menu {
	border: 5px dotted yellow;
	padding-left:250px;
	padding-right:250px;
	list-style-type:none;
	height:100px;
	overflow: auto;
}

.menu li {

	float:left;
	padding-top:35px;
	padding-left:50px;
	font-size:25px;
	
}

.menu a{
	text-decoration:none;
	color:black;
}
.menu a:hover{
	background-color:black;
	color:white;
}



</style>


<body>
	
		<%
			String loginBtn = "로그인";
			String loginLink = "login.jsp";
			if(session.getAttribute("memid")==null) {
				loginBtn = "로그인";
				loginLink = "login.jsp";
			}else {
				loginBtn = "로그아웃";
				loginLink = "logout.jsp";
			}
		%>
		
		<!-- 헤더영역 -->
		<header>
		
			<div class="top">
				<ul class="topmenu">
					<!-- 로그인  -->
					<li><a href="<%=loginLink%>"><%=loginBtn%></a></li>
					
					<!-- 회원가입 -->
					<li><a href="join.jsp">회원가입</a></li>
				</ul>			
			</div>
			
			<div class="logo">
				<a href=main.jsp><img src="images/logo.png"></a>			
			</div>
			
			<nav>
				<ul class="menu">
					<!-- <li><a href=main.jsp><img src="images/logo.png"></a></li> -->
					<li><a href="main.jsp">HOME</a></li>
					<li>/</li>
					<li><a href="main.jsp">Moved소개</a></li>
					<li>/</li>
					<li><a href="main.jsp">Moved내용</a></li>
					<li>/</li>
					<li><a href="board.jsp">고객센터</a></li>
					<li>/</li>
					<li><a>About us</a></li>
					<!-- <li><a href="mypage.jsp">MYPAGE</a></li>
					<li><a href="admin/mng_login.html" target="_black">관리자</a></li> -->
				</ul>
			</nav>
			
		</header>
</body>
</html>