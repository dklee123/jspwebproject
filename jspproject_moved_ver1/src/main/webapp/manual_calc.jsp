<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.google.api.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 및 결제 정보</title>
</head>
<body style="text-align: center;">
	<img src="img/logo.png" />
	<div style="margin-top: 20px" id="imageContainer"></div>
	<%
	double totalAmount = 0;
	Enumeration<String> parameterNames = request.getParameterNames();

	// 수량, 가격, 소계 한줄씩 계산
	while (parameterNames.hasMoreElements()) {
		String paramName = parameterNames.nextElement();
		if (paramName.startsWith("quantity_")) {
			String productName = paramName.substring("quantity_".length());
			int quantity = Integer.parseInt(request.getParameter(paramName));
			double price = Double.parseDouble(request.getParameter("selectedProducts"));
			int productPrice = (int) Math.floor(price);
			double subtotal = quantity * productPrice;
			int subtotalPrice = (int) Math.floor(subtotal);
			totalAmount += subtotal;
	%>
	<p><%=productName%>
		-
		<%=quantity%>개,
		<%=subtotalPrice%>원
	</p>
	<%
	}
	}
	%>
	<p>
		총
		<%=(int) totalAmount%>원
	</p>

	<h1 style="color: #5C5D5D;">가구 목록</h1>
	<form action="" method="post">
		<%
		// 오라클 DB에서 GOODS 테이블의 모든 요소 SELECT
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "jsp", "123456");
		PreparedStatement pstmt = conn.prepareStatement("SELECT NAME, PRICE FROM GOODS");
		ResultSet rs = pstmt.executeQuery();

		// 한줄씩 읽어온 뒤, 상품명, 가격 저장
		while (rs.next()) {
			String productName = rs.getString("NAME");
			double price = rs.getDouble("PRICE");
			// PRICE를 정수로 변환
			int productPrice = (int) Math.floor(price);
		%>
		<label> <input type="checkbox" name="selectedProducts"
			id="<%=productName%>" value="<%=productPrice%>"> <%=productName%>
			- <%=productPrice%>원 <input type="number" size="2"
			style="width: 35px;" name="quantity_<%=productName%>" value="0"
			disabled>
		</label><br>
		<%
		}
		// DB와 연결 종료
		rs.close();
		pstmt.close();
		conn.close();
		%>
		<!-- 계산하기 버튼 -->
		<br> <input id="calculate" type="submit" value="계산하기">
	</form>
	<script>
		// 계산하기 버튼 변수 선언
		const calculate = document.getElementById("calculate");
		// 업로드 버튼
		calculate.style.backgroundColor = "#7ABDE9";
		calculate.style.color = "white";
		calculate.style.fontSize = "16px";
		calculate.style.fontFamily = "malgunGothic";
		calculate.style.border = "none";
		calculate.style.margin = '10px 0';
		calculate.style.padding = "10px 20px";

		// 체크박스 작동 스크립트
		var checkboxes = document
				.querySelectorAll('input[type="checkbox"][name="selectedProducts"]');
		checkboxes.forEach(function(checkbox) {
			checkbox.addEventListener('change', function() {
				var productName = this.nextSibling.textContent.split('-')[0]
						.trim();
				var quantityInput = document
						.querySelector('input[type="number"][name="quantity_'
								+ productName + '"]');
				var imageContainer = document.getElementById('imageContainer');
				var image = new Image();
				// 이미지 경로 지정
				var imagePath = 'img/' + productName + ".png";
				image.src = imagePath;
				image.alt = productName;

				// 현재 이미지가 없을 경우
				if (this.checked) {
					imageContainer.appendChild(image);
				} else {
					// 현재 이미지가 존재할 경우
					var existingImage = document.querySelector('img[alt="'
							+ productName + '"]');
					if (existingImage) {
						imageContainer.removeChild(existingImage);
					}
				}
				quantityInput.disabled = !this.checked;
			});
		});
	</script>
	 	<p>다음 내용으로 넘어 가려면 아래 next를 누르세요</p>
     <a href="Dis.jsp"><button type="button" class="">NEXT</button></a>
</body>
</html>
