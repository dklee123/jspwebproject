<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 
   <script>
    var goodsData = [];
    <%
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "jsp", "123456");
            PreparedStatement pstmt = conn.prepareStatement("SELECT NAME, PRICE FROM GOODS");
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                String name = rst.getString("NAME");
                double price = rst.getDouble("PRICE");
    %>
                goodsData.push({
                    name: '<%= name %>',
                    price: <%= price %>
                });
    <%
            }
            rst.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("오류: " + e.getMessage());
        }
    %>
</script>
    <title>가구 식별</title>
</head>

<body>


	<div id="imageContainer"></div>
	<h2>AI 가구 식별</h2>
		<div id="buttonAndInput">
			<label for="fileInput" id="fileLabel"onmouseover="changeInput('mouseover')" onmouseout="changeInput('mouseout')" onclick="changeInput('click')">파일 선택 </label>
			 <input id="uploadName" placeholder="첨부파일" disabled/>
			<input type="file" id="fileInput" accept="image/*">
			<button id="uploadButton" onmouseover="changeUpload('mouseover')" onmouseout="changeUpload('mouseout')" onclick="changeUpload('click')">식별</button>
		</div>
	<div id="resultContainer" style='text-align:center;'></div>
    <script src="js/solution.js"></script>
 	<p>다음 내용으로 넘어 가려면 아래 next를 누르세요</p>
     <a href="Dis.jsp"><button type="button" class="">NEXT</button></a>
</body>
</html>
