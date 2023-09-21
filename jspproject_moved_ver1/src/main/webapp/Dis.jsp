<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<title>출발지/도착지 입력</title>
</head>
<body>
<div id="imageContainer"></div>
<form action="DisResult.jsp" type="POST">
<input type="text" id="origin_postcode" placeholder="출발지 우편번호" style="border: 0;">
<label for="searchO" id="searchLabelO" onmouseover="changeSearch('mouseover')" onmouseout="changeSearch('mouseout')" onclick="changeSearch('click')">검색</label>
<input type="button" id="searchO" onclick="execDaumPostcode('origin')" value="검색" style="display: none;" ><br>
<input type="text" id="origin_address"  name="origin_address" placeholder="출발지 주소" style="border: 0;"><br>
<input type="text" id="origin_extraAddress" placeholder="출발지 주소2" style="border: 0;"><br>
<input type="text" id="origin_detailAddress" name="origin_detail" placeholder="출발지 상세주소" style="border: 0;">
<br>
<br>
<input type="text" id="destination_postcode" placeholder="도착지 우편번호" style="border: 0;">
<label for="searchD" id="searchLabelD" onmouseover="changeSearch2('mouseover')" onmouseout="changeSearch2('mouseout')" onclick="changeSearch2('click')">검색</label>
<input type="button" id ="searchD" onclick="execDaumPostcode('destination')" value="검색" style="display: none;"><br>
<input type="text" id="destination_address" name="destination_address" placeholder="도착지 주소" style="border: 0;"><br>
<input type="text" id="destination_extraAddress" placeholder="도착지 주소2" style="border: 0;"><br>
<input type="text" id="destination_detailAddress" name="destination_detail" placeholder="도착지 상세주소" style="border: 0;">
<br>
<label for="submit" id="submitLabel" onmouseover="changeSubmit('mouseover')" onmouseout="changeSubmit('mouseout')" onclick="changeSubmit('click')">확정</label>
<button id="submit" type="submit"style=" display: none;">확정</button>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

const body = document.body;
const submit = document.getElementById("submit");
const submitLabel = document.getElementById("submitLabel");

// 새로 생성한 검색 버튼
const searchLabelO = document.getElementById("searchLabelO");
const searchLabelD = document.getElementById("searchLabelD");
// 우편번호 입력창
const origin_postcode = document.getElementById("origin_postcode");
const destination_postcode = document.getElementById("destination_postcode");
// 출발지/도착지 주소
const origin_address = document.getElementById("origin_address");
const destination_address = document.getElementById("destination_address");
// 출발지/도착지 주소2
const origin_extraAddress = document.getElementById("origin_extraAddress");
const destination_extraAddress = document.getElementById("destination_extraAddress");
// 출발지/도착지 상세주소
const origin_detailAddress = document.getElementById("origin_detailAddress");
const destination_detailAddress = document.getElementById("destination_detailAddress");

const imageContainer = document.getElementById('imageContainer');
const imageElement = document.createElement('img');
imageElement.src = 'img/logo.png';

// 이미지를 imageContainer에 추가
imageContainer.appendChild(imageElement);
imageElement.style.marginTop ='20px';
imageElement.style.marginBottom ='20px';

//body
body.style.display = 'flex';
body.style.flexDirection = 'column';
body.style.alignItems = 'center';
body.style.justifyContent = 'center';

//출발지 검색 버튼
searchLabelO.style.backgroundColor = "#7ABDE9";
searchLabelO.style.color = "white";
searchLabelO.style.height = "20px";
searchLabelO.style.padding = "8px 20px";
searchLabelO.style.marginLeft = "5px";

// 도착지 검색 버튼
searchLabelD.style.backgroundColor = "#7ABDE9";
searchLabelD.style.color = "white";
searchLabelD.style.height = "20px";
searchLabelD.style.padding = "8px 20px";
searchLabelD.style.marginLeft = "5px";

//출발지 입력창
origin_postcode.style.backgroundColor = '#f0f0f0';
origin_postcode.style.height = "20px";
origin_postcode.style.marginLeft = "10px";
origin_postcode.style.padding = "10px 20px";
origin_postcode.style.marginBottom ="5px";

origin_address.style.backgroundColor = '#f0f0f0';
origin_address.style.height = "20px";
origin_address.style.marginLeft = "10px";
origin_address.style.padding = "10px 20px";
origin_address.style.marginBottom ="5px";

origin_extraAddress.style.backgroundColor = '#f0f0f0';
origin_extraAddress.style.height = "20px";
origin_extraAddress.style.marginLeft = "10px";
origin_extraAddress.style.padding = "10px 20px";
origin_extraAddress.style.marginBottom ="5px";

origin_detailAddress.style.backgroundColor = '#f0f0f0';
origin_detailAddress.style.height = "20px";
origin_detailAddress.style.marginLeft = "10px";
origin_detailAddress.style.padding = "10px 20px";
origin_detailAddress.style.marginBottom ="5px";

// 도착지 입력창
destination_postcode.style.backgroundColor = '#f0f0f0';
destination_postcode.style.height = "20px";
destination_postcode.style.marginLeft = "10px";
destination_postcode.style.padding = "10px 20px";
destination_postcode.style.marginBottom ="5px";

destination_address.style.backgroundColor = '#f0f0f0';
destination_address.style.height = "20px";
destination_address.style.marginLeft = "10px";
destination_address.style.padding = "10px 20px";
destination_address.style.marginBottom ="5px";

destination_extraAddress.style.backgroundColor = '#f0f0f0';
destination_extraAddress.style.height = "20px";
destination_extraAddress.style.marginLeft = "10px";
destination_extraAddress.style.padding = "10px 20px";
destination_extraAddress.style.marginBottom ="5px";

destination_detailAddress.style.backgroundColor = '#f0f0f0';
destination_detailAddress.style.height = "20px";
destination_detailAddress.style.marginLeft = "10px";
destination_detailAddress.style.padding = "10px 20px";
destination_detailAddress.style.marginBottom ="5px";

// 확정
submitLabel.style.backgroundColor = '#d3d3d3';
submitLabel.style.height = "20px";
submitLabel.style.padding ="10px 20px";
submitLabel.style.display = 'flex';
submitLabel.style.marginTop = '10px';
submitLabel.style.flexDirection = 'column';
submitLabel.style.alignItems = 'center';
submitLabel.style.justifyContent = 'center';

// 호버/클릭시 색변경 함수
function changeSearch(eventType) {
	  if (eventType === 'mouseover') {
	    searchLabelO.style.backgroundColor = '#A4D1F0';
	  } else if (eventType === 'mouseout') {
	    searchLabelO.style.backgroundColor = '#7ABDE9';
	  } else if (eventType === 'click') {
	    searchLabelO.style.backgroundColor = '#A4D1F0';
	  }
	}

function changeSearch2(eventType) {
	  if (eventType === 'mouseover') {
	    searchLabelD.style.backgroundColor = '#A4D1F0';
	  } else if (eventType === 'mouseout') {
	    searchLabelD.style.backgroundColor = '#7ABDE9';
	  } else if (eventType === 'click') {
	    searchLabelD.style.backgroundColor = '#A4D1F0';
	  }
	}

//호버, 클릭 시 색 변경 함수
function changeSubmit(eventType) {
  if (eventType === 'mouseover') {
    submitLabel.style.backgroundColor = '#e0e0e0';
  } else if (eventType === 'mouseout') {
    submitLabel.style.backgroundColor = '#d3d3d3';
  } else if (eventType === 'click') {
    submitLabel.style.backgroundColor = 'd0d0d0';
  }
}

function execDaumPostcode(type) {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일 때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById(type + "_extraAddress").value = extraAddr;
            } else {
                document.getElementById(type + "_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById(type + '_postcode').value = data.zonecode;
            document.getElementById(type + "_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById(type + "_detailAddress").focus();
        }
    }).open();
}

</script>
<p>처음 부터 다시 시작 하려면 아래의 버튼을 눌러 주세요</p>
<a href="Calendar.jsp"><button type="button" class="">돌아가기</button></a>
</body>
</html>
