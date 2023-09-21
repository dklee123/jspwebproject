<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main page</title>
<link rel="stylesheet" href="css/style.css">
</head>

<style>
.main {
	border: 5px dotted green;
	height:800px;
}
</style>



<body>
		
		<!-- 헤더영역 -->
	<div class="wrapper">
	
		<jsp:include page="header.jsp" />
		
		<div class="maincontent">
		
		<!-- 메인영역 -->
		<div class="main">
			<h1>메인영역</h1>
		</div>
		
		
		<!-- 푸터영역 -->
		</div>
		
		<jsp:include page="footer.jsp" />
		
	
	</div>
</body>
</html>