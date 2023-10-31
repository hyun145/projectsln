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
                <a href="http://localhost:11000/page/ls">
                    <img src="/image/로그인.jpg" width="327.7px" height="327.7px" style="border-radius: 10px; cursor: pointer; display: block; margin: 0 auto;">
                </a>
            </div>

            <div class="col-lg-4 mb-5 mb-lg-0">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="font-size: 27px; border-radius: 5px; text-align: center;">우울증 테스트 하기</div>
                <a href="http://localhost:11000/gds/gdsTest">
                    <img src="/image/테스트.jpg" width="327.7px" height="327.7px" style="border-radius: 10px; cursor: pointer; display: block; margin: 0 auto;">
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
                <a href="http://localhost:11000/info/calender">
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

<%--<section class="bg-light py-5 border-bottom">--%>
<%--    <div class="container px-5 my-5">--%>
<%--        <div class="text-center mb-5">--%>
<%--            <h2 class="fw-bolder">Pay as you grow</h2>--%>
<%--            <p class="lead mb-0">With our no hassle pricing plans</p>--%>
<%--        </div>--%>
<%--        <div class="row gx-5 justify-content-center">--%>
<%--            <!-- Pricing card free-->--%>
<%--            <div class="col-lg-6 col-xl-4">--%>
<%--                <div class="card mb-5 mb-xl-0">--%>
<%--                    <div class="card-body p-5">--%>
<%--                        <div class="small text-uppercase fw-bold text-muted">Free</div>--%>
<%--                        <div class="mb-3">--%>
<%--                            <span class="display-4 fw-bold">$0</span>--%>
<%--                            <span class="text-muted">/ mo.</span>--%>
<%--                        </div>--%>
<%--                        <ul class="list-unstyled mb-4">--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                <strong>1 users</strong>--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                5GB storage--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Unlimited public projects--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Community access--%>
<%--                            </li>--%>
<%--                            <li class="mb-2 text-muted">--%>
<%--                                <i class="bi bi-x"></i>--%>
<%--                                Unlimited private projects--%>
<%--                            </li>--%>
<%--                            <li class="mb-2 text-muted">--%>
<%--                                <i class="bi bi-x"></i>--%>
<%--                                Dedicated support--%>
<%--                            </li>--%>
<%--                            <li class="mb-2 text-muted">--%>
<%--                                <i class="bi bi-x"></i>--%>
<%--                                Free linked domain--%>
<%--                            </li>--%>
<%--                            <li class="text-muted">--%>
<%--                                <i class="bi bi-x"></i>--%>
<%--                                Monthly status reports--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                        <div class="d-grid"><a class="btn btn-outline-primary" href="#!">Choose plan</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="col-lg-6 col-xl-4">--%>
<%--                <div class="card mb-5 mb-xl-0">--%>
<%--                    <div class="card-body p-5">--%>
<%--                        <div class="small text-uppercase fw-bold">--%>
<%--                            <i class="bi bi-star-fill text-warning"></i>--%>
<%--                            Pro--%>
<%--                        </div>--%>
<%--                        <div class="mb-3">--%>
<%--                            <span class="display-4 fw-bold">$9</span>--%>
<%--                            <span class="text-muted">/ mo.</span>--%>
<%--                        </div>--%>
<%--                        <ul class="list-unstyled mb-4">--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                <strong>5 users</strong>--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                5GB storage--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Unlimited public projects--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Community access--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Unlimited private projects--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Dedicated support--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Free linked domain--%>
<%--                            </li>--%>
<%--                            <li class="text-muted">--%>
<%--                                <i class="bi bi-x"></i>--%>
<%--                                Monthly status reports--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                        <div class="d-grid"><a class="btn btn-primary" href="#!">Choose plan</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="col-lg-6 col-xl-4">--%>
<%--                <div class="card">--%>
<%--                    <div class="card-body p-5">--%>
<%--                        <div class="small text-uppercase fw-bold text-muted">Enterprise</div>--%>
<%--                        <div class="mb-3">--%>
<%--                            <span class="display-4 fw-bold">$49</span>--%>
<%--                            <span class="text-muted">/ mo.</span>--%>
<%--                        </div>--%>
<%--                        <ul class="list-unstyled mb-4">--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                <strong>Unlimited users</strong>--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                5GB storage--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Unlimited public projects--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Community access--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Unlimited private projects--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Dedicated support--%>
<%--                            </li>--%>
<%--                            <li class="mb-2">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                <strong>Unlimited</strong>--%>
<%--                                linked domains--%>
<%--                            </li>--%>
<%--                            <li class="text-muted">--%>
<%--                                <i class="bi bi-check text-primary"></i>--%>
<%--                                Monthly status reports--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                        <div class="d-grid"><a class="btn btn-outline-primary" href="#!">Choose plan</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<section class="py-5 border-bottom">--%>
<%--    <div class="container px-5 my-5 px-5">--%>
<%--        <div class="text-center mb-5">--%>
<%--            <h2 class="fw-bolder">Customer testimonials</h2>--%>
<%--            <p class="lead mb-0">Our customers love working with us</p>--%>
<%--        </div>--%>
<%--        <div class="row gx-5 justify-content-center">--%>
<%--            <div class="col-lg-6">--%>

<%--                <div class="card mb-4">--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="d-flex">--%>
<%--                            <div class="flex-shrink-0"><i class="bi bi-chat-right-quote-fill text-primary fs-1"></i></div>--%>
<%--                            <div class="ms-4">--%>
<%--                                <p class="mb-1">Thank you for putting together such a great product. We loved working with you and the whole team, and we will be recommending you to others!</p>--%>
<%--                                <div class="small text-muted">- Client Name, Location</div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="card">--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="d-flex">--%>
<%--                            <div class="flex-shrink-0"><i class="bi bi-chat-right-quote-fill text-primary fs-1"></i></div>--%>
<%--                            <div class="ms-4">--%>
<%--                                <p class="mb-1">The whole team was a huge help with putting things together for our company and brand. We will be hiring them again in the near future for additional work!</p>--%>
<%--                                <div class="small text-muted">- Client Name, Location</div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<section class="bg-light py-5">--%>
<%--    <div class="container px-5 my-5 px-5">--%>
<%--        <div class="text-center mb-5">--%>
<%--            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>--%>
<%--            <h2 class="fw-bolder">Get in touch</h2>--%>
<%--            <p class="lead mb-0">We'd love to hear from you</p>--%>
<%--        </div>--%>
<%--        <div class="row gx-5 justify-content-center">--%>
<%--            <div class="col-lg-6">--%>
<%--                <!-- * * * * * * * * * * * * * * *-->--%>
<%--                <!-- * * SB Forms Contact Form * *-->--%>
<%--                <!-- * * * * * * * * * * * * * * *-->--%>
<%--                <!-- This form is pre-integrated with SB Forms.-->--%>
<%--                <!-- To make this form functional, sign up at-->--%>
<%--                <!-- https://startbootstrap.com/solution/contact-forms-->--%>
<%--                <!-- to get an API token!-->--%>
<%--                <form id="contactForm" data-sb-form-api-token="API_TOKEN">--%>
<%--                    <!-- Name input-->--%>
<%--                    <div class="form-floating mb-3">--%>
<%--                        <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />--%>
<%--                        <label for="name">Full name</label>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>--%>
<%--                    </div>--%>
<%--                    <!-- Email address input-->--%>
<%--                    <div class="form-floating mb-3">--%>
<%--                        <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />--%>
<%--                        <label for="email">Email address</label>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>--%>
<%--                    </div>--%>
<%--                    <!-- Phone number input-->--%>
<%--                    <div class="form-floating mb-3">--%>
<%--                        <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />--%>
<%--                        <label for="phone">Phone number</label>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>--%>
<%--                    </div>--%>
<%--                    <!-- Message input-->--%>
<%--                    <div class="form-floating mb-3">--%>
<%--                        <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>--%>
<%--                        <label for="message">Message</label>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>--%>
<%--                    </div>--%>
<%--                    <!-- Submit success message-->--%>
<%--                    <!---->--%>
<%--                    <!-- This is what your users will see when the form-->--%>
<%--                    <!-- has successfully submitted-->--%>
<%--                    <div class="d-none" id="submitSuccessMessage">--%>
<%--                        <div class="text-center mb-3">--%>
<%--                            <div class="fw-bolder">Form submission successful!</div>--%>
<%--                            To activate this form, sign up at--%>
<%--                            <br />--%>
<%--                            <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Submit error message-->--%>
<%--                    <!---->--%>
<%--                    <!-- This is what your users will see when there is-->--%>
<%--                    <!-- an error submitting the form-->--%>
<%--                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>--%>
<%--                    <!-- Submit Button-->--%>
<%--                    <div class="d-grid"><button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">Submit</button></div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<%--<!-- Footer-->--%>
<%--<footer class="py-5 bg-dark">--%>
<%--    <div class="container px-5"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>--%>
<%--</footer>--%>
<%--<!-- Bootstrap core JS-->--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--<!-- Core theme JS-->--%>
<%--<script src="../../../../../../../../Users/82103/Desktop/공모전/startbootstrap-business-frontpage-gh-pages/js/scripts.js"></script>--%>
<%--<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->--%>
<%--<!-- * *                               SB Forms JS                               * *-->--%>
<%--<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->--%>
<%--<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->--%>
<%--<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>--%>
</body>
</html>
