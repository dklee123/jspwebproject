<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/contactus.css">
<link rel="stylesheet" href="css/movedint.css">
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/0743fc8aa3.js" crossorigin="anonymous"></script>
</head>
<style>
div.login{
}

ul.login{
list-style:none;
float: right;
padding-right:15px;

}

li.login{
float:left;
margin-left:15px;
}
</style>

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

	
			
<header>
<!-- 로그인|로그아웃 / 회원가입 -->
   
   <div class="login">
      <ul class="login">
          
         <!-- 로그인 & 회원가입 -->
         <% if(session.getAttribute("memid") == null) { %>
         <li class="login"><a href="<%=loginLink%>"><i class="fa-solid fa-lock"></i> <%=loginBtn%></a></li>
         <li class="login"><a href="join.jsp"><i class="fa-solid fa-right-to-bracket"></i> 회원가입</a></li>
         <% } %>
         
         <!-- 로그아웃 & MYPAGE -->
         <% if(session.getAttribute("memid") != null) { %>
         <li class="login"><a href="<%=loginLink%>"><i class="fa-solid fa-unlock"></i> <%=loginBtn%></a></li>
         <li class="login"><a href="mypage.jsp"><i class="fa-solid fa-house"></i> MYPAGE</a></li>
         <% } %>
         
      </ul>
   </div>
	
	
			
   <div class="headname">
    <h3><a href=index.jsp><img src="images/logo.png"></a></h3>
    </div>
    
    
    		<!--로고-->
    		<div class="logo">
				<!-- <li><a href=main.jsp><img src="images/logo.png"></a></li> -->
			</div>
            
            <!-- 로그인 | 회원가입 -->
            <div class="util">
            
            </div>

<!-- 메인 메뉴 -->
<div class="menu">

    <nav>
        <ul class="pc">
        	
            <li><a href="index.jsp">Home</a></li>
            <li><a href="movedint.jsp">Moved 소개</a></li>
            <li><a href="Calendar.jsp">Moved 이사견적</a></li>
            <li><a href="">신청현황</a></li>
            <li><a href="board.jsp" class="contact-link">고객센터</a></li>

        </ul>
        <ul class="mobile">
            <li>
                <a href="index.jsp"><span class="material-symbols-outlined">home</span></a>
            </li>
            <li>
                <a href="javascript:;" id="btn-menu"><span class="material-symbols-outlined">menu</span></a>
            </li>
        </ul>
    </nav>
</div>

<script src="js/script.js"></script>
</header>


<body>

<!-- 사이드바 -->
    <aside id="sidebar">
        <!-- X (닫기) 버튼 -->
        <div class="top flex main-end">
            <a href="javascript:;" id="btn-close">
                <span class="material-symbols-outlined">close</span>
            </a>
        </div>
        <!-- 사이드바 - 메인 메뉴 -->
        <ul>
                <li><a href="index.jsp" class="home-link">Home</a></li>
                <li><a href="movedint.jsp" class="home-link">Moved 소개</a></li>
                <li><a href="Calendar.jsp" class="home-link">Moved 이사견적</a></li>
                <li><a href="" class="home-link">신청현황</a></li>
                <li><a href="board.jsp" class="home-link">고객센터</a></li>
        </ul>
    </aside>
    
    <!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="js/main.js"></script>
    
</body>
</html>