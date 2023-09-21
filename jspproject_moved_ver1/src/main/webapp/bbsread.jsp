<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<%@ page import="human.dao.FilesDao" %>
<%@ page import="human.vo.FilesVo" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/board.css">
</head>
<body>


		<header>
		<jsp:include page="header2.jsp" />
		</header>
		
		<%
			String curPage = request.getParameter("page");
			String no = request.getParameter("no");
			
			BoardVo tempvo = new BoardVo();
			BoardDao bbsdao = new BoardDao();			
			tempvo = bbsdao.readBoardByNo(no);
			
			FilesVo filesvo = new FilesVo();
			FilesDao filedao = new FilesDao();
			filesvo = filedao.readFilesByNo(no);
		%>
		
		
	<!-- 메인영역 -->
	<div class="main_wrap">
		
		<div class="content_wrap">
			<br>
			<h2> ▶ 공지사항</h2>
			<table class="board_table">
				
				<thead>
				<tr>
					<th colspan="6" class="post_title">글읽기</th>
				</tr>	
				</thead>	
				
				<tbody>
				<tr>
					<th class="post_writer">작성자</th>
					<td><%= tempvo.getWriter() %></td>
					
					<th class="post_date">작성일</th>
					<td><%= tempvo.getRegdate() %></td>
					
					<th class="post_view">조회수</th>
					<td><%= tempvo.getHit() %></td>
					
				</tr>
				<tr>
					<th class="post_email">이메일</th>
					<td colspan="2"><%= tempvo.getEmail() %></td>
					<th class="post_date">연락처</th>
					<td colspan="2"><%= tempvo.getHp() %></td>								
				</tr>
				
				<tr>
					<th class="post_subject">제목</th>
					<td colspan="5"><%= tempvo.getSubject() %></td>
				</tr>
				<tr>
					<th class="post_content">내용</th>
					<td colspan="5"><%= tempvo.getContent() %></td>
				</tr>			
				<tr>
					<th class="post_file">첨부파일</th>					
					<td colspan="5"><a href="filedown.jsp?filename=<%= filesvo.getFilename() %>"><%= filesvo.getFilename() %></a></td>
				</tr>			
				</tbody>
				
			</table>
			
			<div class="board_btns">
				<form class="control" action="board.jsp" method="GET">
					<input type="hidden" name="page" value="<%=curPage%>">
					<input class="control_btn" type="submit" value="목록">
				</form>
			</div>
			
		</div>
		
		
		
	</div>
</body>
</html>





