<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출발지/도착지 주소</title>
</head>
<body>
    <h1>출발지/도착지 주소</h1>
    <ul>
        <%
        request.setCharacterEncoding("UTF-8");
        String originsAddress = request.getParameter("address");
        String destinationsAddress = request.getParameter("address2");
        %>
        <br>
        <li id="originsAddress"><%= originsAddress %></li>
        <li id="destinationsAddress"><%= destinationsAddress %></li>
    </ul>
    <input type="button" value="거리계산하기" onclick="main()"><br>


    <script>
    const geocodingApiKey = 'AIzaSyAW9bQ2ZQSPHGTssVKNWorabBJyp6Y8HaI';
    const distanceMatrixApiKey = 'AIzaSyAW9bQ2ZQSPHGTssVKNWorabBJyp6Y8HaI';

    const originsAddress = "<%= originsAddress %>";
    const destinationsAddress = "<%= destinationsAddress %>";

    async function getGeocode(address) {
      const geocodingUrl = `https://maps.googleapis.com/maps/api/geocode/json?address=${address}&key=${geocodingApiKey}`;
      const response = await fetch(geocodingUrl);
      const data = await response.json();
      
      if (data.status === "OK") {
        const location = data.results[0].geometry.location;
        return [location.lat, location.lng];
      } else {
        return null;
      }
    }

    async function main() {
      try {
        const origins = await getGeocode(originsAddress);
        const destinations = await getGeocode(destinationsAddress);

        if (origins && destinations) {
          const mode = "transit";
          const baseUrl = "https://maps.googleapis.com/maps/api/distancematrix/json?";
          
          const url = `${baseUrl}origins=${origins[0]},${origins[1]}&destinations=${destinations[0]},${destinations[1]}&mode=${mode}&key=${distanceMatrixApiKey}`;
          
          const response = await fetch(url);
          const data = await response.json();
          
          if (data.status === "OK") {
            const distance = data.rows[0].elements[0].distance.text;
            const duration = data.rows[0].elements[0].duration.text;

          } else {
            console.log("거리 및 시간 정보를 가져오지 못했습니다.");
          }
        } else {
          console.log("좌표를 가져오지 못했습니다.");
        }
      } catch (error) {
        console.error("오류 발생:", error);
      }
    }

    </script>
</body>
</html>
