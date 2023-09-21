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
		<div class="main_content">
			<form action="joinpro.jsp" method="POST">
			
			<h2>회원 가입</h2>
			<h3>회원 이용정보 입력</h3>
			<table class="join_table">
				
				<tr>
					<td class="join_tag">아이디</td>
					<td>
						<input class="userid" type="text" name="memid" id="memid">
						<input class="join_inner_btn" type="button" value="중복확인" onclick="idcheck();">
						&nbsp;<span class="id_check_msg"></span>
						<p class="alert_id">ID는 4글자 이상의 영문 또는 영문+숫자 조합으로 입력하세요</p>
					</td>
				</tr>
				
				<tr>
					<td class="join_tag">비밀번호</td>
					<td>
						<input class="pass1" type="password" name="mempw">
					</td>
				</tr>
			</table>
			
			<h3>개인정보 입력</h3>
			<table class="join_table">
				
				<tr>
					<td class="join_tag">이름</td>
					<td>
						<input class="username" type="text" name="memname">
					</td>
				</tr>
				
				<tr>
					<td class="join_tag">EMAIL</td>
					<td>
						<input class="useremail" type="text" name="mememail">
					</td>
				</tr>
				
				<tr>
					<td class="join_tag">전화번호</td>
					<td>
						<input class="usertel" type="text" name="memtel">
					</td>
				</tr>
			
			</table>
			
			<div class="join_bths">
				<input type="submit" value="회원등록">
				<input type="reset" value="취소">
			</div>
			
			</form>
		
		</div>
		
		
		<!-- 푸터영역 -->
		</div>
		
		<jsp:include page="footer.jsp" />
		
	
	</div>
</body>
</html>