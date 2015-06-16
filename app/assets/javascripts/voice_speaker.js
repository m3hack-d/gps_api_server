$(document).ready(function () {
    setInterval(function () {
        $.ajax({
            type: "GET",
            url: "/api/performances/exist_file",
            success: function (json) {
                if (json.result) {
                    audio = new Audio("/audios/hoge.wav");
                    audio.play();
//                    setTimeout(function () {
//                        $.ajax({
//                            type: "DELETE",
//                            url: "/api/performances/delete_file",
//                            success: function () {
//                                console.log("ok");
//                            }
//                        });
//                    }, 3000);

                } else {
                    console.log("nothing");
                }
            }
        });
    }, 10000);
});