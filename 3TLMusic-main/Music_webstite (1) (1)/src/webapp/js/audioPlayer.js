document.addEventListener("DOMContentLoaded", function() {
    var audio = document.getElementById("myAudio");
    var playPauseBtn = document.querySelector(".playPause");
    var progressBar = document.getElementById("progressBar");
    var volumeControl = document.getElementById("volumeControl");
    var currentTimeDisplay = document.getElementById("currentTime");
    var totalTimeDisplay = document.getElementById("totalTime");
    var loopButton = document.getElementById("loopButton");
	var songCards = document.querySelectorAll(".song-card");
	var volumeBtn = document.getElementById("volumeBtn");
	var songQueue = []; 
	var currentIndex = 0;
	function getAllSongs() {
	
	  fetch('/api/getAllSongs')	
	    .then(function(response) {
	      return response.json();
	    })
	    .then(function(data) {

	      songList = data;
	     
	    })
	    .catch(function(error) {
	      console.error('Lỗi khi lấy danh sách bài hát: ', error);
	    });
	}
	

	getAllSongs();
	window.onbeforeunload = function() {
	    var audio = document.getElementById('myAudio');
	    var name = document.getElementById('songName').textContent;
	    var src = document.getElementById('songImage').src;
	    localStorage.setItem('audioSrc', audio.src);
	    localStorage.setItem('audioTime', audio.currentTime);
	    localStorage.setItem('audioimg', src);
	    localStorage.setItem('audioname', name);
		localStorage.setItem('audioVolume', audio.volume);
	};
	window.onload = function() {
	    var audio = document.getElementById('myAudio');
	    var savedSrc = localStorage.getItem('audioSrc');
	    var savedTime = localStorage.getItem('audioTime');
		document.getElementById('songImage').src = localStorage.getItem('audioimg');
		document.getElementById('songName').textContent = localStorage.getItem('audioname');
		var savedVolume = localStorage.getItem('audioVolume');
	    if (savedSrc) {
	        audio.src = savedSrc;
	        audio.currentTime = savedTime;
	        if (savedVolume) {
	            audio.volume = savedVolume;
	            volumeControl.value = savedVolume;
	        }
	        audio.play();
	        document.getElementById('imgNameSong').style.display = 'block';
	        playPauseBtn.innerHTML = 
	            '<svg role="img" height="24" width="24" viewBox="0 0 24 24">' +
	            '    <path d="M8 3h3v18H8zM13 3h3v18h-3z"></path>' + // SVG path for pause
	            '</svg>';
	    }
	};
    // Toggle play/pause
	playPauseBtn.onclick = function() {
	    if (audio.paused) {
	        audio.play();
	        // Cập nhật thành biểu tượng pause
	        playPauseBtn.innerHTML = 
	            '<svg role="img" height="24" width="24" viewBox="0 0 24 24">' +
	            '    <path d="M8 3h3v18H8zM13 3h3v18h-3z"></path>' + // SVG path for pause
	            '</svg>';
	    } else {
	        audio.pause();
	        // Cập nhật thành biểu tượng play
	        playPauseBtn.innerHTML = 
	            '<svg role="img" height="24" width="24" viewBox="0 0 24 24">' +
	            '    <path d="M7.05 3.606l13.49 7.788a.7.7 0 010 1.212L7.05 20.394A.7.7 0 016 19.788V4.212a.7.7 0 011.05-.606z"></path>' + // SVG path for play
	            '</svg>';
	    }
	};

    // Update progress bar as the song plays
    audio.ontimeupdate = function() {
        var progress = (audio.currentTime / audio.duration) * 100;
        progressBar.value = progress;

        // Cập nhật thời gian hiện tại
        currentTimeDisplay.textContent = formatTime(audio.currentTime);

        // Cập nhật thời lượng tổng cộng khi bài hát được tải
        if (audio.duration) {
            totalTimeDisplay.textContent = formatTime(audio.duration);
        }
    };

    // Seek in the song when user changes the progress bar
    progressBar.onchange = function() {
        audio.currentTime = (progressBar.value / 100) * audio.duration;
    };

    // Set volume
    volumeControl.onchange = function() {
        audio.volume = volumeControl.value;
    };
	loopButton.onclick = function() {
        audio.loop = !audio.loop; // Toggle the loop property

        // Cập nhật biểu tượng hoặc kiểu của nút
        if (audio.loop) {
            // Thay đổi kiểu của SVG để chỉ ra rằng loop đang được kích hoạt
        } else {
            // Trở lại kiểu mặc định khi loop không được kích hoạt
        }
    };
    volumeBtn.onclick = function() {
	    if (audio.muted) {
	        audio.muted = false;
			volumeControl.value = audio.volume;
	        // Ví dụ: thay đổi class của nút để hiển thị biểu tượng âm lượng bật
	        volumeBtn.innerHTML = 
	        	'<svg role="presentation" height="16" width="16" aria-label="Volume médio" id="volume-icon" viewBox="0 0 16 16">' +
	            '    <path d="M9.741.85a.75.75 0 01.375.65v13a.75.75 0 01-1.125.65l-6.925-4a3.642 3.642 0 01-1.33-4.967 3.639 3.639 0 011.33-1.332l6.925-4a.75.75 0 01.75 0zm-6.924 5.3a2.139 2.139 0 000 3.7l5.8 3.35V2.8l-5.8 3.35zm8.683 6.087a4.502 4.502 0 000-8.474v1.65a2.999 2.999 0 010 5.175v1.649z"></path>' + // SVG path for play
	            '</svg>';

	    } else {
	        audio.muted = true;
	        // Ví dụ: thay đổi class của nút để hiển thị biểu tượng âm lượng tắt
	       	volumeControl.value = 0;
	        volumeBtn.innerHTML = 
	        '<svg role="presentation" height="16" width="16" aria-label="Volume muted" viewBox="0 0 16 16">'+
			    '<path d="M1,5 L4,5 L7,2 L7,14 L4,11 L1,11 Z"></path>'+
			'</svg>';

	    }
	};

	songCards.forEach(function(card) {
	    card.addEventListener("click", function() {
	        var songUrl = card.getAttribute("data-song-url");
	        var songname = card.getAttribute("data-song-name");
	        var songimg = card.getAttribute("data-song-img");

	        if (songUrl) {
				document.getElementById('songName').textContent = songname;
	    		document.getElementById('songImage').src = songimg;
	    		document.getElementById('imgNameSong').style.display = 'block';
	            audio.src = songUrl;
	            document.getElementById("songUrlInput").value = songUrl;
	            document.getElementById("songUrlInputD").value = songUrl;
	            console.log(document.getElementById("songUrlInput").value)
	            audio.load();
	            audio.play();
	            playPauseBtn.innerHTML = 
	            '<svg role="img" height="24" width="24" viewBox="0 0 24 24">' +
	            '    <path d="M8 3h3v18H8zM13 3h3v18h-3z"></path>' + // SVG path for pause
	            '</svg>';
	        } else {
	            console.error("URL của bài hát không tồn tại hoặc không hợp lệ");
	        }
	    });
	});



    function formatTime(seconds) {
        var minutes = Math.floor(seconds / 60);
        var seconds = Math.floor(seconds % 60);
        return minutes.toString().padStart(2, '0') + ":" + seconds.toString().padStart(2, '0');
    }


});
