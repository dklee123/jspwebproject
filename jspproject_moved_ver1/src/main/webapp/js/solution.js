const fileInput = document.getElementById("fileInput");
const fileLabel = document.getElementById("fileLabel");
const uploadName = document.getElementById("uploadName");
const uploadButton = document.getElementById("uploadButton");
const resultContainer = document.getElementById("resultContainer");
const h2Element = document.querySelector("h2");
const body = document.body;

// 로고 표시
const imageContainer = document.getElementById('imageContainer');
const imageElement = document.createElement('img');
imageElement.src = 'img/logo.png';

// 이미지를 imageContainer에 추가
imageContainer.appendChild(imageElement);

// body
body.style.display = 'flex';
body.style.flexDirection = 'column';
body.style.alignItems = 'center';
body.style.justifyContent = 'center';

// h2
h2Element.style.fontSize = "24px";
h2Element.style.color = "#5C5D5D";
h2Element.style.textAlign = 'center';

// 파일 선택과 식별 버튼을 같은 줄에
const buttonAndInput = document.createElement('div');
buttonAndInput.style.display = 'flex';
buttonAndInput.style.alignItems = 'center';

// 기존에 있던 '파일 선택' 버튼과 파일명 표시하는 부분은 숨김
fileInput.style.position = "absolute";
fileInput.style.width = "0";
fileInput.style.height = "0";
fileInput.style.padding = "0";
fileInput.style.border = "0";

// 새로 생성한 파일 선택 버튼(레이블)
fileLabel.style.backgroundColor = '#f0f0f0';
fileLabel.style.height = "20px";
fileLabel.style.marginLeft = "10px";
fileLabel.style.padding = "10px 20px";

// 호버, 클릭 시 색 변경 함수
function changeInput(eventType) {
  if (eventType === 'mouseover') {
    fileLabel.style.backgroundColor = '#e0e0e0';
  } else if (eventType === 'mouseout') {
    fileLabel.style.backgroundColor = '#f0f0f0';
  } else if (eventType === 'click') {
    fileLabel.style.backgroundColor = '#d0d0d0';
  }
}

// 새로 생성한 파일명 표시하는 부분
uploadName.style.color = "#d3d3d3";
uploadName.style.fontSize = "16px";
uploadName.style.border = "none";
uploadName.style.display = "inline-block";
uploadName.style.padding = "12px 20px";
uploadName.style.marginLeft = "10px";

// 업로드 버튼
uploadButton.style.backgroundColor = "#7ABDE9";
uploadButton.style.color = "white";
uploadButton.style.fontSize = "16px";
uploadButton.style.fontFamily = "malgunGothic";
uploadButton.style.border = "none";
uploadButton.style.margin = '10px 0';
uploadButton.style.padding = "10px 20px";

// 호버, 클릭 시 색 변경 함수
function changeUpload(eventType) {
  if (eventType === 'mouseover') {
    uploadButton.style.backgroundColor = '#A4D1F0';
  } else if (eventType === 'mouseout') {
    uploadButton.style.backgroundColor = '#7ABDE9';
  } else if (eventType === 'click') {
    uploadButton.style.backgroundColor = '#A4D1F0';
  }
}

// 결과창
resultContainer.style.fontFamily = "malgunGothic";
resultContainer.style.textAlign ="center";

const googleApiKey ="AIzaSyAudjpTypPWJYwQeCpwwifiwJPWFpRmML8"

// 클래스 이름 번역 함수
async function translateClassName(className) {
  try {
    const response = await fetch(`https://translation.googleapis.com/language/translate/v2?key=${googleApiKey}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        q: className,
        target: 'ko',
      }),
    });

    const data = await response.json();
    if (data && data.data && data.data.translations && data.data.translations[0]) {
      return data.data.translations[0].translatedText;
    } else {
      return className;
    }
  } catch (error) {
    console.error('번역 오류:', error);
    return className;
  }
}

async function loadImageBase64(file) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = (error) => reject(error);
  });
}

const classPrices = {};

goodsData.forEach(item => {
  classPrices[item.name] = item.price;
});

document.getElementById("uploadButton").addEventListener("click", async () => {
  const fileInput = document.getElementById("fileInput");
  const file = fileInput.files[0];
  const resultContainer = document.getElementById("resultContainer");

  if (!file) {
    alert("이미지 파일을 선택해주세요.");
    return;
  }

  try {
    const image = await loadImageBase64(file);

    const response = await axios({
      method: "POST",
      url: "https://detect.roboflow.com/appliance-vbmjz/1",
      params: {
        api_key: "xWix8kvq3rK2f2b3ljxR"
      },
      data: image,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      }
    });

    const classValues = response.data.predictions.map(prediction => prediction.class);

    const classCount = {};
    let totalPrice = 0;

    classValues.forEach(classValue => {
      if (classCount[classValue]) {
        classCount[classValue]++;
      } else {
        classCount[classValue] = 1;
      }
      totalPrice += classPrices[classValue] || 0;
    });

    let resultHTML = "<p style='font-weight: bold; font-size: 24px; font-family: malgunGothic; color: #5C5D5D;'>분석 결과</p><ul>";
    for (const className in classCount) {
      const translatedClassName = await translateClassName(className);
      const classPrice = classPrices[className] || 0;
      const classTotalPrice = classPrice * classCount[className];
      resultHTML += `<li style="list-style:none; font-family: malgunGothic;">${translatedClassName}: ${classCount[className]}개, ${classTotalPrice}원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>`;
    }
    resultHTML += "</ul>";
    resultHTML += `<p style="font-family: malgunGothic;">합계 : ${totalPrice}원</p>`;

    resultContainer.innerHTML = resultHTML;
  } catch (error) {
    console.error(error.message);
  }
});
