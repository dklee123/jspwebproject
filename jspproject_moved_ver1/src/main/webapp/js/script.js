        // 클릭 이벤트를 처리할 JavaScript 코드
        document.addEventListener("DOMContentLoaded", function() {
            // 첫 번째 섹션의 아이템들에 클릭 이벤트를 추가
            const section1Items = document.querySelectorAll("#main .item");
            section1Items.forEach(item => {
                item.addEventListener("click", function() {
                    // 클릭된 아이템에 따라 다른 페이지로 이동
                    const text = item.querySelector("h3").textContent.trim();
                    if (text === "▶ html") {
                        window.location.href = "html/html_js.html"; // html 페이지로 이동
                    } else if (text === "▶ java") {
                        window.location.href = "java/java.html"; // java 페이지로 이동
                    } else if (text === "▶ python") {
                        window.location.href = "python/python.html"; // python 페이지로 이동
                    } else if (text === "▶ DBMS") {
                        window.location.href = "DBMS/DBMS.html"; // DBMS 페이지로 이동
                    }
                });
            });

            // 두 번째 섹션의 아이템들에 클릭 이벤트를 추가 (동일한 방식으로 처리 가능)
            const section2Items = document.querySelectorAll("#recent .item");
            section2Items.forEach(item => {
                item.addEventListener("click", function() {
                    const text = item.querySelector("h3").textContent.trim();
                    if (text === "▶ Develop") {
                        window.location.href = "develop/develop.html"; // Develop 페이지로 이동
                    } else if (text === "▶ Board") {
                        window.location.href = "board/list.html"; // Board 페이지로 이동
                    } else if (text === "▶ Gallery") {
                        window.location.href = "gallery/list.html"; // Gallery 페이지로 이동
                    } else if (text === "▶ contact") {
                        window.location.href = "contact/contact.html"; // Contact 페이지로 이동
                    }
                });
            });
        });