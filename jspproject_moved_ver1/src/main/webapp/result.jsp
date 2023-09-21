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
<% request.setCharacterEncoding("UTF-8");
String origin_Address = request.getParameter("origin_address");
String destination_Address = request.getParameter("destination_address");
out.println(origin_Address);%><br>
<% out.println(destination_Address); %>
<div id="distanceResult"></div>
<!-- <div id="durationResult"></div> -->



<script>
const originsAddress = '<%=origin_Address%>';
const destinationsAddress = '<%=destination_Address%>';
console.log(originsAddress);
console.log(destinationsAddress);

const geocodingApiKey = "AIzaSyAW9bQ2ZQSPHGTssVKNWorabBJyp6Y8HaI";
const distanceMatrixApiKey = "AIzaSyAW9bQ2ZQSPHGTssVKNWorabBJyp6Y8HaI";
const baseUrl = `https://maps.googleapis.com/maps/api/geocode/json?address=`;
const lastUrl = `&key=`;


async function getGeocode_origin(address) {
	const geocodingUrl_origin = baseUrl + originsAddress + lastUrl + geocodingApiKey;
	  const response = await fetch(geocodingUrl_origin);
	  const data = await response.json();
	  
	  if (data.status === "OK") {
	    const location = data.results[0].geometry.location;
	    return [location.lat, location.lng];
	  } else {
	    return null;
	  }
	}

async function getGeocode_destination(address) {
	const geocodingUrl_destinations = baseUrl + destinationsAddress + lastUrl + geocodingApiKey;
	  const response = await fetch(geocodingUrl_destinations);
	  const data = await response.json();
	  
	  if (data.status === "OK") {
	    const location = data.results[0].geometry.location;
	    return [location.lat, location.lng];
	  } else {
	    return null;
	  }
	}
	
	async function main() {
	  const origins = await getGeocode_origin(originsAddress);
	  const destinations = await getGeocode_destination(destinationsAddress);

	  if (origins && destinations) {
	    const mode = "transit";
	    const base = "https://maps.googleapis.com/maps/api/distancematrix/json?";
	    
	    const url = base + 'origins=' + origins[0] +',' + origins[1] +'&destinations='+destinations[0] +',' + destinations[1] + '&mode=transit&key=' + distanceMatrixApiKey
	    
	    const response = await fetch(url);
	    const data = await response.json();
	    
	    if (data.status === "OK") {
	      const distance = data.rows[0].elements[0].distance.text;
	      const duration = data.rows[0].elements[0].duration.text;
	      console.log(`거리 : `+ distance);
	      console.log(`소요 시간: `+ duration);
	      
	      const distanceResult = document.getElementById("distanceResult");
	      distanceResult.innerHTML = `거리 : ` + distance;
	     /*  const durationResult = document.getElementById("durationResult");
	      durationResult.innerHTML = `소요 시간 : ` + duration; */
	    } else {
	      console.log("거리 및 시간 정보를 가져오지 못했습니다.");
	    }
	  } else {
	    console.log("좌표를 가져오지 못했습니다.");
	  }
	}

	main();
</script>

</body>
</html>