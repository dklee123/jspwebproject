<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/jquery.min.js"></script>

</head>
<style>
.header{ background-color:white; height: 100px;}

.main{ margin: 0 auto;
    width: 30%;
}

.main h4{
    margin: 60px auto;
    text-align: center;
    font-size: 2em;
}

fieldset{
    border: none;
}

fieldset > div{
    position: relative;
    margin-bottom: 10px;
}
img {
    width: 80px;
    height: 60px; 
    position: relative;
    top: 75%;
    left: 50%;
    transform: translate(-50%, -50%);
}



.none{
    display: none;
}


.error{ 
    font-size: 0.8em;
    position: absolute;
    width: auto;
    top: 18px; right: 10px;
    text-align: right;
    color: red;
}

.vaild{
    font-size: 0.8em;
    position: absolute;
    width: 150px;
    top: 18px; right: 10px;
    text-align: right;
    color: rgb(0, 0, 0);
}
#login_select{
    border-radius: 4px;
    border: 1px solid #ccc;
    display: flex;
}
.select{
    display: block;
    height: 100%; width: 50%;
    border-right: 1px solid #ccc;
}
input[type=text], select, input[type=password], input[type=email] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=submit],input[type=button],input[type=reset] {
    width: 100%;
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

#login_select{
    border-radius: 4px;
    border: 1px solid #ccc;
    display: flex;
}
.gender{
    display: block;
    height: 100%; width: 50%;
    border-right: 1px solid #ccc;
}
.no_line{
    border-right:none;
}
.gender > label {
    display: block;
    /*width: 100%; height: 100%;*/
    padding: 10px 0;
    text-align: center;
    font-size: 0.8em;
    color: #666;
}
input[type=radio]{
   display: none;
}
.gender_act{
    display: inline-block;
    height: 100%; width: 50%;
    background-color: rgb(0, 0, 0);
    color:#fff;
}
.gender_act > label {
    display: inline-block;
    width: 100%; height: 100%;
    padding: 10px 0;
    text-align: center;
    font-size: 0.8em;
    color: #fff;
}
/* .id_check_msg { */
/*   color: blue; */
/* } */


</style>

<body>



		<!-- 메인영역 -->
		<div class="main">
			<form action="joinpro.jsp" method="POST">
			
			<h4>회원 가입</h4>
			<a href="index.jsp"><img src="img/logo.png"></a>
			
			<fieldset>	
			<div id="login_select">
                <span id="wrap_man" class="gender gender_act">
                <input type="radio" id="man" name="gender" onclick="ck_gender()"> <label for="man"> 일반 </label>
                </span>

                <span id="wrap_woman" class="gender no_line">
                <input type="radio" id="woman" name="gender" onclick="ck_gender()"> <label for="woman" onclick="ck_gender()"> 업체 </label>
                </span>
            </div>
				
			<div>
				
				<input type="text" id="name" name="memname" placeholder="이름" onblur="ck_name()">
				
				<table class="join_table">
				<tr>
					<td width="100%">
						<input class="userid" type="email" id="memid" name="memid" placeholder="이메일 ( ex@example.com)" onblur="ck_email()">
					</td>
					
					<td>
						<input class="join_inner_btn" type="button" value="중복확인" onclick="idcheck();">
					</td>
				</tr>
				</table>
				
						<span class="id_check_msg"></span>
				
				<input class="pass1" type="password" id="pwd" name="mempw" placeholder="비밀번호" onblur="ck_pwd()">
				<input class="pass1" type="password" id="pwd_ck" name="lastname" placeholder="비밀번호 확인" onblur="ck_pwd2()">
                <span id="MsgPwck" class="none">유효성체크</span> 
				
			</div>
			
				
<!-- 			<br>			 -->
<!-- 			<h3>개인정보 입력</h3> -->
<!-- 			<hr> -->
<!-- 			<table class="join_table"> -->
				
<!-- 				<tr> -->
<!-- 					<td class="join_tag">이름</td> -->
<!-- 					<td> -->
<!-- 						<input class="username" type="text" name="memname"> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				
<!-- 				<tr> -->
<!-- 					<td class="join_tag">EMAIL</td> -->
<!-- 					<td> -->
<!-- 						<input class="useremail" type="text" name="mememail"> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				
<!-- 				<tr> -->
<!-- 					<td class="join_tag">TEL</td> -->
<!-- 					<td> -->
<!-- 						<input class="usertel" type="text" name="memtel"> -->
<!-- 					</td> -->
<!-- 				</tr> -->
			
<!-- 			</table> -->
			
			<div class="join_bths">
				<input type="submit" value="가입">
				<input type="reset" value="취소">
			</div>
			</fieldset>
			</form>
		
		</div>
		

	
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
		function idcheck() {
			id = $('#memid').val();	// GET방식

			window.open("checkid.jsp?memid="+id, "chkid", "width=400, height=200");
		}
		
		function useable_id() {
			$('.id_check_msg').text('사용할 수 있는 아이디입니다').css('color','blue');
		}
		function unuseable_id() {
			$('.id_check_msg').text('중복된 아이디입니다').css('color','red');
		}
	</script>
	
</body>
</html>