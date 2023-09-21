<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>
</head>
<style>
.main{ 
	margin: 0 auto;
    width: 50%;
}

.join_table{
	text-align: left;
}

.centered-row {
    text-align: left;
}

input[type=text], select, input[type=password], input[type=email] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    text-align: center;
}
input[type=submit],input[type=button],input[type=reset] {
    width: 60%;
    background-color: rgb(0, 0, 0);
    color: white;
    padding: 14px 20px;
    margin: 8px auto;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=submit]:hover,input[type=button]:hover,input[type=reset]:hover {
    background-color: skyblue;
}
</style>
<body>
<%
	String loginBtn = "로그인";
	String loginLink = "login.jsp";
	String id = "";
	MemberVo resultvo = new MemberVo();
	// 세션정보를 확인해서 페이지를 보여줄지 여부를 판단
	if(session.getAttribute("memid")==null){
		loginBtn = "로그인";
		loginLink = "login.jsp";
		out.println("<script>alert('로그인 후 사용가능합니다');</script>");
		out.println("<script>location.href='login.jsp'</script>");
	}else{
		id = (String)session.getAttribute("memid");
		loginBtn = "로그아웃";
		loginLink = "logout.jsp";
		
		// 세션이 생성 확인 후 
		// 지역변수 자리
		MemberDao memdao = new MemberDao();
		resultvo = memdao.getMemberById(id);
		
	}
%>

<%-- 		<!-- 헤더영역 -->
		<jsp:include page="header2.jsp" /> --%>
		
		
		<!-- 메인영역 -->
		<div class="main">
		
			<form action="mypagemod.jsp" method="POST">
			
			<h2>마이페이지 정보확인</h2>
			<h3>▶ 개인 정보 확인</h3>
							<br>
			<table class="join_table">
				
				<tr class="centered-row">
					<td class="join_tag">아이디</td>
					<td>
						<p><%= id %></p>				
					</td>
				</tr>
				<tr class="centered-row">
					<td class="join_tag">비밀번호</td>
					<td>
						<input class="pass1" type="password" name="mempw">
					</td>
				</tr>
			</table>
				<br>
				<h3>▶ 개인정보 입력</h3>
								<br>
		         <table class="join_table"> 
		            
		            <tr class="centered-row">
		               <td class="join_tag">이름</td>
		               <td>
		                  <input class="username" type="text" name="memname" value="<%= resultvo.getName() %>">
		               </td>
		            </tr>            
		            <tr class="centered-row">
		               <td class="join_tag">EMAIL</td>
		               <td>
		                  <input class="usermail" type="text" name="mememail" value="<%= resultvo.getEmail() %>">
		               </td>
		            </tr>
		            <tr class="centered-row">
		               <td class="join_tag">전화번호</td>
		               <td>
		                  <input class="usertel" type="text" name="memtel" value="<%= resultvo.getPhone() %>">
		               </td>
		            </tr>
		         </table>   	
													<br>	
			<div class="join_bths">
				<input type="submit" value="회 원 정보 수 정" >
				<input type="reset" value="수 정 취 소">
					</div>
			
			</form>
					</div>

		
<%-- 		<!-- 푸터영역 -->
		
		<jsp:include page="footer2.jsp" /> --%>
		
</body>
</html>