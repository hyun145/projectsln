<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Business Frontpage - Start Bootstrap Template</title>
    <link rel="icon" type="image/x-icon" href="../../../../../../../../Users/82103/Desktop/공모전/startbootstrap-business-frontpage-gh-pages/assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="../../../../../../../../Users/82103/Desktop/공모전/startbootstrap-business-frontpage-gh-pages/css/styles.css" rel="stylesheet" />




    <style>
        #zoom-toggle {cursor: pointer; color: #002752; font-weight: bold;}

        #zoom-controls {position: fixed;top: 40px;right: 90px;display: none;border-radius: 15px;top: 30px;font-weight: bold;}

        #zoom-in, #zoom-out {padding: 5px 10px;background-color: white;cursor: pointer;}

        #cancel-zoom-button{cursor: pointer;color:  #002752;font-weight: bold;}

        .fade-in {opacity: 0;animation: fadeIn 1.8s ease-in-out forwards;}

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        {
            display: none;
        }


        .fade-in.complete .icon {display: inline-block;}
        a img{
            transform: scale(1);
            transition: transform 0.7s;
        }

        a:hover img {
            transform: scale(1.05);
        }



    </style>


</head>
<body style="background: linear-gradient(to bottom, #87CEEB, #E6E6FA, #B0E0E6)" class="fade-in" >


<nav class="navbar navbar-expand-lg navbar light bg-light" style="height: 85px;">
    <div class="container px-5">

        <div id="current-date" style="font-size: 24px; color:  #002752; top: 24px; font-weight: bold">현재 날짜</div>
        <a class="navbar-brand" style="font-size: 30px; color:  #002752; font-weight: bold">돋보기팀</a>




        <body>
        <div id="zoom-toggle" onclick="toggleZoomControls()">
            돋보기 사용하기🔍
        </div>

        <div id="zoom-controls" class="ml-auto">
            <span id="zoom-out" onclick="zoomOut()">축소</span>
            <span id="zoom-in" onclick="zoomIn()">확대</span>
        </div>

        <div id="cancel-zoom" style="display: none;">
            <span id="cancel-zoom-button" onclick="cancelZoom()">취소하기</span>
        </div>
        </body>
    </div>
</nav>
<script>
    var zoomControlsVisible = false;

    function toggleZoomControls() {
        zoomControlsVisible = !zoomControlsVisible;
        var zoomControls = document.getElementById("zoom-controls");
        var cancelZoomButton = document.getElementById("cancel-zoom");

        if (zoomControlsVisible) {
            zoomControls.style.display = "block";
            cancelZoomButton.style.display = "block";
            document.getElementById("zoom-toggle").style.display = "none"; // xx
        } else {
            zoomControls.style.display = "none";
            cancelZoomButton.style.display = "none";
            document.getElementById("zoom-toggle").style.display = "block"; //xx
        }
    }

    var currentZoom = 100;

    function changeZoom(zoomValue) {
        currentZoom += zoomValue;
        document.body.style.zoom = currentZoom + "%";
    }

    function zoomIn() {
        changeZoom(10);
    }

    function zoomOut() {
        changeZoom(-10);
    }


    function cancelZoom() {
        currentZoom = 100;
        document.body.style.zoom = currentZoom + "%";
        document.getElementById("cancel-zoom").style.display = "none";
        document.getElementById("zoom-toggle").style.display = "block";
        document.getElementById("zoom-controls").style.display = "none";
    }

    var currentDate = new Date();
    var formattedDate = currentDate.getFullYear() + '년 ' + (currentDate.getMonth() + 1) + '월 ' + currentDate.getDate() + '일';

    document.getElementById('current-date').textContent = formattedDate;

    // HTML로딩이 완료되고, 실행됨
    $(document).ready(function () {

        $("#btnCalendar").on("click", function () {
            let f = document.getElementById("f");

            $.ajax({
                    url: "/user/userProc",
                    type: "post",
                    dataType: "JSON",
                    data: $("#f").serialize(),
                    success: function (json) {

                        if (json.result === 1) {
                            alert(json.msg);
                            location.href = "/info/calendar";
                        } else {
                            alert(json.msg);
                            $("#userId").focus();
                        }

                    }
                }
            )
        })
    })
</script>
</body>
</html>


<div style="height: 26px;"></div>



<div class="user-wrap" style="position: relative; width: 100%; margin: 10px auto">
    <div class="custom-header centered-image" style="background-size: cover; height: 650px;">
        <img src="/image/편지지1.jpg" style="width: 61.73%; height: 700px; display: block; margin: 0 auto; border-radius: 19px; margin-top: 50px">

        <%--        <img src="/image/노인.png" style="position: absolute; top: 0; bottom: 0; left: 0; height: 100px; width: 70px">--%>


        <div class="user-text" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;
        font-size: 42px; font-family: '나눔손글씨 펜'; max-width: 61.73%;">
            안녕하세요 방문자 여러분, 저희 사이트에 오신걸 환영합니다.<br>
            이곳은 노년 시기를 행복하고 건강하게 보낼 수 있도록 도움을 드리기 위한 곳입니다.<br>
            노인 우울증을 예방하고 행복한 노년 시기를 즐길 수 있도록, 우리의 커뮤니티와 정보를<br> 활용해 주시기 바랍니다.<br>
            밑으로 내려가시면 다양한 정보들이 있습니다.

            <div style="text-align: center; margin-top: 42px; font-family: '나눔손글씨 펜'">
                <a href="#features1" style="text-decoration: none;">
                    <p class="scroll-text">아래로 이동↓</p>
                </a>
            </div>






        </div>
    </div>
</div>








<section class="py-5 border-bottom" id="features1" style="margin-top: 400px;">
    <div class="container px-5 my-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-4 mb-5 mb-lg-0">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="font-size: 27px; border-radius: 5px; text-align: center;">로그인/회원가입 하기</div>
                <a href="/page/ls">
                    <img src="/image/로그인.jpg" width="327.7px" height="327.7px" style="border-radius: 10px; cursor: pointer; display: block; margin: 0 auto;">
                </a>
            </div>

            <div class="col-lg-4 mb-5 mb-lg-0">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="font-size: 27px; border-radius: 5px; text-align: center;">우울증 테스트 하기</div>
                <a href="/gds/gdsTest">
                    <img src="/image/테스트.jpg" width="327.7px" height="327.7px" style="border-radius: 10px; cursor: pointer; display: block; margin: 0 auto;">
                </a>
            </div>

            <div class="col-lg-4 mb-5 mb-lg-0">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="font-size: 27px; border-radius: 5px; text-align: center;">커뮤니티</div>
                <a href="/notice/noticeList">
                    <img src="/image/커뮤니티.jpg" width="327.7px" height="327.7px" style="border-radius: 10px; cursor: pointer; display: block; margin: 0 auto;">
                </a>
            </div>

        </div>
    </div>
</section>

<section class="py-5 border-bottom" id="features">
    <div class="container px-5 my-5">
        <div class="row gx-5">

            <div class="col-lg-4 mb-5 mb-lg-0">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="font-size: 27px; border-radius: 5px">병원 찾기</div>
                <a href="/searchHospital/test">
                    <img src="/image/병원찾기.jpg" width="327.7px" height="327.7px" style="border-radius: 10px; cursor: pointer">
                </a>
            </div>

            <div class="col-lg-4 mb-5 mb-lg-0">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="font-size: 27px; border-radius: 5px">심리치료</div>
                <a href="운동 페이지 URL">
                    <img src="/image/심리치료.jpg" width="327.7px" height="327.7px" style="border-radius: 10px; cursor: pointer">
                </a>
            </div>

            <div class="col-lg-4 mb-5 mb-lg-0">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="font-size: 27px; border-radius: 5px">일정관리</div>
                <a href="/info/calender">
                    <img src="/image/일정관리.jpg" width="327.7px" height="327.7px" style="border-radius: 10px; cursor: pointer">
                </a>
            </div>

        </div>
    </div>
</section>



<section class="py-5 border-bottom" id="features1">
    <div class="container px-5 my-5">
        <div class="row gx-5">

            <div class="col-lg-4 mb-5 mb-lg-0">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="font-size: 27px; border-radius: 5px">운동</div>
                <a href="운동 페이지 URL">
                    <img src="/image/운동.jpg" width="327.7px" height="327.7px" style="border-radius: 10px; cursor: pointer">
                </a>
            </div>

            <div class="col-lg-4 mb-5 mb-lg-0">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="font-size: 27px; border-radius: 5px">식단</div>
                <a href="운동 페이지 URL">
                    <img src="/image/식단.jpg" width="327.7px" height="327.7px" style="border-radius: 10px; cursor: pointer">
                </a>
            </div>

            <div class="col-lg-4 mb-5 mb-lg-0">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="font-size: 27px; border-radius: 5px">수면</div>
                <a href="운동 페이지 URL">
                    <img src="/image/수면.jpg" width="327.7px" height="327.7px" style="border-radius: 10px; cursor: pointer">
                </a>
            </div>

        </div>
    </div>
</section>


</body>
</html>
