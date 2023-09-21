<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main page</title>

</head>

<style>

</style>

<body>
		
		<!-- 헤더영역 -->

	
		<jsp:include page="header2.jsp" />
		
		<!-- 메인영역 -->

		
		<br>
		<jsp:include page="main_board.jsp" />
		
		
		<!-- 푸터영역 -->
		
		<jsp:include page="footer2.jsp" />

</body>
</html>