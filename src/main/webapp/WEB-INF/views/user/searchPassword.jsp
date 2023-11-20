<%@ page import="project.sln.dto.UserDTO" %>
<%@ page import="project.sln.util.EncryptUtil" %>
<%@ page import="java.util.Optional" %>
<%@ page import="project.sln.util.CmmUtil" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 화면</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">

    <style>
        body {
            min-height: 100vh;

            background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
            background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
        }

        .input-form {
            max-width: 680px;

            margin-top: 80px;
            padding: 32px;

            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }

        h4 {
            /* 수평 중앙 정렬하기 */
            text-align: center;
        }
    </style>

    <script type="text/javascript">

        $(document).ready(function () {

            $("#btnSearchPassword").on("click", function (event) {
                event.preventDefault();

                let f = document.getElementById("f");

                if (f.userName.value === "") {
                    alert("이름을 입력하세요.");
                    f.userName.focus();
                    return;

                }
                if (f.birthDay.value === "") {
                    alert("생년월일을 입력하세요.");
                    f.birthDay.focus();
                    return;
                }
                if (f.userId.value === "") {
                    alert("아이디를 입력하세요.")
                    f.userId.focus()
                    return;
                }

                f.method = "post";
                f.action = "/user/searchPasswordProc"

                f.submit();


            })
        })


    </script>

</head>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">

    <style>
        body {
            min-height: 100vh;

            background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
            background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
        }

        .input-form {
            max-width: 680px;

            margin-top: 80px;
            padding: 32px;

            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }

        h4 {

            /* 수평 중앙 정렬하기 */
            text-align: center;
        }
        input[type=checkbox] {

            zoom: 1.5;

        }
    </style>
</head>



<body>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3" text-align>비밀번호 찾기</h4>
            <form id ="f" class="validation-form" novalidate>

                <div class="mb-3"  style="font-size: 130%">아이디
                    <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디 입력란" required>

                </div>
                <div class="mb-3" style="font-size: 130%">이름
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="이름 입력란" required>
                </div>

                <div class="mb-3" style="font-size: 130%">생년월일
                    <input type="password" class="form-control" id="birthDay" name="birthDay" placeholder="생년월일 입력란" required>
                </div>






                <hr class="mb-4">
                <div class="mb-4"></div>
                <button class="btn btn-primary btn-lg btn-block" type="submit" id="btnSearchPassword">비밀번호 찾기</button>
            </form>
        </div>
    </div>

</div>

</body>

</html>