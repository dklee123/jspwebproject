<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOVED</title>
    <!-- reset -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/contactus.css">
    <link rel="stylesheet" href="css/movedint.css">
    <link rel="stylesheet" href="css/board.css">

    <!-- material icon -->
    <!-- style.css @import 로 변경-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
<body>
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
            <div class="util"></div>

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
    
	
		<!-- 메인영역 -->
		
		<div class="row">
		
		<!-- 스와이퍼 include 페이지 -->
		<div style="background-color:#7ABDE8;">
			<jsp:include page="main_swiper.jsp" />
		</div>
		
		
		 <section>
	  <h1 class="big-title" style="font-size: 55px; margin-bottom: 1em;">Moved Introduce page</h1>  
	  	<img src="img/냉장고.png" alt="냉장고" width="80" height="70">  
		<img src="img/tv.png" alt="tv" width="80" height="70">  
		<img src="img/세탁기.png" alt="세탁기" width="80" height="70">  
		<img src="img/의자.png" alt="의자" width="80" height="70">  
		<img src="img/책상.png" alt="책상" width="80" height="70">  
		<img src="img/침대.png" alt="침대" width="80" height="70">

		<h4 style="font-size: 18px; margin-top: 1em; margin-bottom: 1em;" >- we match up customers and moving company and serve a better environment</h4>
<!-- 	    <p>- 고객으로부터 신뢰받는 Moved가 되겠습니다.</p>
	    <p>- 고객님 들의 사랑은 받게 되어 더없이 영광입니다.</p>
	    <p>- 이는 이사+청소+건물관리+설치/수리를 아우르는 토털서비스에 불편함이 없도록, 고객의 소리에 귀 기울이고 서비스를 한층 업그레이드 하는데 저를 비롯하여 Moved 임직원들이 고민하고 열정을 다했기 때문입니다.</p>
	    <p>- 저희 Moved 고객님이 원하는 것이 무엇인지 항상 고민하고 꼭 필요한 것을 맞춤 서비스하겠습니다.</p>
	    <p>- Moved가 제공하는 서비스 안에서 불필요한 고민이나 걱정없이 마음놓고 고객님들이 이용하실 수 있도록 서비스 품질관리에 만전을 기하겠습니다.</p>    -->
  </section>
<div class="wrapper">
		
	<!-- 메인영역 -->
	<div class="main_wrap">
		
		<div class="content_wrap">
			
	<!-- 		<h2> ▶ 고객 센터 ▶ 자주 묻는 질문 </h2> -->
			<table class="board_table">
				
				<thead>
				<tr>
				   <th class="post_black">번호</th>
	               <th class="post_black">제목</th>
	               <th class="post_black">작성일</th>
	               <th class="post_black">조회수</th>
				</tr>	
				</thead>	
				
				<tbody>
				
			<%
				String curPage = request.getParameter("page");
				if (curPage == null){
					curPage =  "1";
				}
				BoardDao bbsdao = new BoardDao();
				ArrayList<BoardVo> result = bbsdao.getBoardListAll(curPage);
				// out.println(result.size());
				for(int i=0; i<result.size(); i++) {
					BoardVo eachvo = result.get(i);
			%>		
					
				<tr class="post">
					<td class="post_num"><%= eachvo.getNo() %></td>
					<td><a href="bbsread.jsp?page=<%=curPage%>&no=<%= eachvo.getNo() %>"><%= eachvo.getSubject() %></a></td>
					<td class="post_date"><%= eachvo.getRegdate() %></td>
					<td class="post_view"><%= eachvo.getHit() %></td>
				</tr>
			<% 	
				}
			%>	
				</tbody>
			</table>
			
			<div class="board_btns">
				<form class="search" action="boardsearch.jsp" method="GET">
					<select class="search_box" name="search_cate" id="search_cate">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select>
					<input class="search_box" type="text" name="keyword">
					<input class="search_btn" type="submit" value="검색">
				</form>
			</div>
			
			<ul class="board_pages">
				<li class="board_left"><a href='#'>&#10094;</a></li>
				
			<%
				int cntperpage = 10;
				int totpage = bbsdao.calTotPage();
				for(int i=1; i<=totpage; i++){
					
					if(i==Integer.valueOf(curPage)) {
			%>		
				<li class='board_page'><a href='board.jsp?page=<%= i %>' class='active'><%=i %></a></li>
			<% 
					}else{
			%>
				<li class='board_page'><a href='board.jsp?page=<%= i %>'><%=i %></a></li>
			<%		
				
					}
				}
			%>
				
				<li class="board_right"><a href='#'>&#10095;</a></li>
			</ul>			
			
		</div>
</div>  
<!--   <section>
	  <h1 class="big-title">Moved Service</h1>
 
		<img src="img/냉장고.png" alt="냉장고" width="80" height="70">  
		<img src="img/tv.png" alt="tv" width="80" height="70">  
		<img src="img/세탁기.png" alt="세탁기" width="80" height="70">  
		<img src="img/의자.png" alt="의자" width="80" height="70">  
		<img src="img/책상.png" alt="책상" width="80" height="70">  
		<img src="img/침대.png" alt="침대" width="80" height="70">  
		<br>
		<p>- 고객으로부터 신뢰받는 Moved가 되겠습니다.</p>
	    <p>- 고객님 들의 사랑은 받게 되어 더없이 영광입니다.</p>
	    <p>- 이는 이사+청소+건물관리+설치/수리를 아우르는 토털서비스에 불편함이 없도록, 고객의 소리에 귀 기울이고 서비스를 한층 업그레이드 하는데 저를 비롯하여 Moved 임직원들이 고민하고 열정을 다했기 때문입니다.</p> 
  </section> -->

    
  <!-- <section>
	<h1 class="big-title">Moved Introduce page</h1>
	    <img src="img/냉장고.png" alt="냉장고"> 
	    <p>- we match up customers and moving company and serve a better environment</p>
	    <p>- we match up customers and moving company and serve a better environment</p>
	    <p>- we match up customers and moving company and serve a better environment</p>
	    <p>- we match up customers and moving company and serve a better environment</p>
	    <p>- we match up customers and moving company and serve a better environment</p>   
  </section> -->

		
<!-- 		<div style="background-color:#black;"> -->
<%-- 			<jsp:include page="movedint.jsp" /> --%>
<!-- 		</div> -->
		
<!-- 			 	<div class="leftcolumn"> -->
<!-- 				<div class="card">		    -->
<!-- 				      <h2>moved소개</h2> -->

<!-- 				      <div class="fakeimg"><img src="img/10.jpg"></div> -->
<!-- 				      <p>Some text..</p> -->
<!-- 				      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit,  -->
<!-- 				        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  -->
<!-- 				        Ut enim ad minim veniam, quis nostrud exercitation ullamco. -->
<!-- 				      </p> -->
<!-- 			    </div> -->
<!-- 			    <div class="card"> -->
<!-- 				      <h2>TITLE HEADING</h2> -->
<!-- 				      <h5>Title description, Sep 2, 2017</h5> -->
<!-- 				      <div class="fakeimg"><img src="img/10.jpg"></div> -->
<!-- 				      <p>Some text..</p> -->
<!-- 				      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit,  -->
<!-- 				        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  -->
<!-- 				        Ut enim ad minim veniam, quis nostrud exercitation ullamco. -->
<!-- 				      </p> -->
<!-- 			    </div> -->
<!-- 			</div> -->
		
<!-- 			  <div class="rightcolumn"> -->
<!-- 				  <div class="card"> -->
<!-- 				      <h2>About Me</h2> -->
<!-- 				      <div class="fakeimg"><img src="img/12.jpg"></div> -->
<!-- 				      <p>Some text about me in culpa qui officia deserunt mollit anim..</p> -->
<!-- 				  </div> -->
<!-- 			      <div class="card"> -->
<!-- 				      <h3>Popular Post</h3> -->
<!-- 				      <div class="fakeimg"><p><img src="img/moved2.png"></p></div> -->
<!-- 				      <div class="fakeimg"><p><img src="img/moved2.png"></p></div> -->
<!-- 				      <div class="fakeimg"><p><img src="img/moved2.png"></p></div> -->
<!-- 			      </div> -->
<!-- 			    <div class="card"> -->
<!-- 				      <h3>Follow Me</h3> -->
<!-- 				      <p>Some text..</p> -->
<!-- 			    </div> -->
<!-- 			  </div> -->
<!-- 		</div> -->

		
	</div>
    <!-- footer 부분 -->
    <footer class="bottom">
       <!--<div class="container">-->
            <!--<div class="site-map">-->
                <ul>
                    <li>
                        <p>&copy; Moved since 2023. All rights reserved.</p> 
                    </li>
                </ul>
            </div>
     </footer>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>