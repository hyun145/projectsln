<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>




<!DOCTYPE html>
<html lang="en">
<head>
    <mvc:resources mapping="/resources/**" location="/resources/"/>

    <title>Login V1</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/image/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/css/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/css/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/css/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/css/util.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <!--===============================================================================================-->

    <!--===============================================================================================-->
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <!--===============================================================================================-->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="/js/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="/js/tilt.jquery.min.js"></script>
    <script >
        $('.js-tilt').tilt({
            scale: 1.1
        })
    </script>
    <!--===============================================================================================-->
    <script src="/js/main.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $("#btnLogin").on("click", function () {
                let f = document.getElementById("f"); // form 태그


                if(f.userId.value === "") {
                    alert("아이디를 입력하세요.");
                    f.userId.focus();
                    return;
                } if (f.password.value === "") {
                    alert("비밀번호를 입력하세요.");
                    f.password.focus();
                    return;
                }
                $.ajax({
                    url: "/user/loginProc",
                    type: "post", // 전송방식은 Post
                    dataType: "JSON", // 전송 결과는 JSON으로 받기
                    data: $("#f").serialize(), // form 태그 내 input 등 객체를 자동으로 전송할 형태로 변경하기
                    success: function (json) { // /notice/noticeUpdate 호출이 성공했다면..

                        if (json.result === 1) { // 로그인 성공

                            location.href = "/page/index"; // 로그인 성공 페이지 이동	<< main 페이지로 만들어야함.

                        } else { // 로그인 실패
                            alert(json.msg); // 메시지 띄우기
                            $("#userId").focus(); // 아이디 입력 항목에 마우스 커서 이동
                        }

                    }
                })

            })


        })
    </script>
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
                <img src="/image/img-01.png" alt="IMG">
            </div>

            <form class="login100-form validate-form" id="f">
					<span class="login100-form-title">
						SLN Project Login
					</span>

                <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                    <input class="input100" type="text" name="userId" placeholder="ID" >
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
                </div>

                <div class="wrap-input100 validate-input" data-validate = "Password is required">
                    <input class="input100" type="password" name="password" placeholder="Password">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
                </div>

                <div class="container-login100-form-btn">
                    <button id="btnLogin" type="button" class="login100-form-btn" >Login </button>
                </div>

                <div class="text-center p-t-12">

                    <a class="txt2" href="/user/searchUserId" style="font-size: 23px">
                        아이디 찾기
                    </a>
                    <a class="txt2" style="font-size: 15px"> / </a>
                    <a class="txt2" style="font-size: 23px" href="/user/searchPassword ">
                        비밀번호 찾기
                    </a>
                </div>

                <div class="text-center p-t-136">
                    <a class="txt2" href="/user/userReg" style="font-size: 150%">
                        회원가입 하러가기
                        <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>





</body>
</html>