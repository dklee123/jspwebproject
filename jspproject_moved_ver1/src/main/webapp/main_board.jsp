<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/board.css">
</head>
<body>


<div class="wrapper">
		
	<!-- 메인영역 -->
	<div class="main_wrap">
		
		<div class="content_wrap">
			
			<h2> ▶ 고객 센터 ▶ 자주 묻는 질문 </h2>
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
		
	</div>
</body>
</html>