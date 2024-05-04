// Eable Disable Script
function enabledisable(element) {
  console.log(element.style)
  if (element.style.fill != "rgb(29, 185, 84)") {
    element.style.setProperty('fill', '#1db954');
  } else {
    element.style.setProperty('fill', '#fff');
  }
}

// Greeetngs Script
const greeting = document.getElementById("greeting");
const hour = new Date().getHours();
const welcomeTypes = ["Good morning", "Good afternoon", "Good evening"];
let welcomeText = "";

if (hour < 12) welcomeText = welcomeTypes[0];
else if (hour < 18) welcomeText = welcomeTypes[1];
else welcomeText = welcomeTypes[2];

greeting.innerHTML = welcomeText;



//Scrolling nav bar code
const nav=document.querySelector("#topNav");
const sectionOne=document.querySelector(".fw-bold");
const sectionOneOptions={};
const sectionOneObserver = new IntersectionObserver(function(entries , sectionOneObserver) {
  entries.forEach(entry => {
    if(!entry.isIntersecting){      
      nav.style.backgroundColor="black";
    } else{     
      nav.style.backgroundColor="transparent";
    }
  })
} , sectionOneOptions);
sectionOneObserver.observe(sectionOne);

document.addEventListener("DOMContentLoaded", function() {
    // Lắng nghe sự kiện click trên danh sách bài hát
    var songLinks = document.querySelectorAll(".song-card a");
    songLinks.forEach(function(link) {
        link.addEventListener("click", function(event) {
            event.preventDefault();
            var songUrl = this.getAttribute("href");
            // Gửi yêu cầu mở bài hát đến server (có thể sử dụng AJAX)
            sendMusicCommand("openSong", songUrl);
        });
    });

    // Lắng nghe sự kiện click trên các nút của thanh autobar
    var playPauseButton = document.querySelector(".playPause");
    var stopButton = document.querySelector(".stop"); // Thêm nút stop
    // Thêm nút stop vào các nút khác trong thanh autobar
    var autobarButtons = [playPauseButton, stopButton];

    autobarButtons.forEach(function(button) {
        button.addEventListener("click", function() {
            var command = this.classList.contains("playPause") ? "playPause" : "stop";
            // Gửi yêu cầu play/pause hoặc stop đến server (có thể sử dụng AJAX)
            sendMusicCommand(command);
        });
    });

    // Hàm gửi yêu cầu âm nhạc đến server (thay thế AJAX theo cách bạn muốn)
    function sendMusicCommand(command, songUrl) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Xử lý phản hồi từ server nếu cần
                console.log(xhr.responseText);
            }
        };
        var url = "<%= request.getContextPath() %>/ControllerMusicServlet?command=" + command;
        if (songUrl) {
            url += "&songUrl=" + encodeURIComponent(songUrl);
        }
        xhr.open("GET", url, true);
        xhr.send();
    }
});
