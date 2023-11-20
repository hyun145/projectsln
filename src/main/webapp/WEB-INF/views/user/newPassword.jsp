<%@ page import="project.sln.dto.UserDTO" %>
<%@ page import="project.sln.util.EncryptUtil" %>
<%@ page import="java.util.Optional" %>
<%@ page import="project.sln.util.CmmUtil" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    UserDTO rDTO = (UserDTO) request.getAttribute("rDTO");

    String newPassword = CmmUtil.nvl((String) session.getAttribute("NEW_PASSWORD"));

    String msg = "";

    if (CmmUtil.nvl(rDTO.getUserId()).length() > 0) {
        if (newPassword.length() == 0) {
            msg = "비정상적인 접근입니다. \n비밀번호 재설정 화면에 접근할 수 없습니다.";
        }
        else {
            msg = "회원정보가 존재하지 않습니다.";
        }
    }


%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=CmmUtil.nvl(rDTO.getUserName())%> 회원님의 비밀번호 재설정</title>
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

        <%
        if (msg.length() > 0) {
        %>
        alert("<%=msg%>");
        history.back();
        <%
        }
        %>

        $(document).ready(function () {
            $("#btnLogin").on("click", function () {
                    location.href = "/user/login";
            })


            $("#btnNewPassword").on("click", function () {
                let f= document.getElementById("f");

                if(f.password.value === "") {
                    alert("새로운 비밀번호를 입력하세요.");
                    f.password.focus();
                    return;
                }
                if(f.password.value !== f.password2.value) {
                    alert("입력한 비밀번호가 일치하지 않습니다.");
                    f.password.focus();
                    return;
                }

                f.method = "post";
                f.action = "/user/newPasswordProc"
                f.submit();
                console.log("qew");


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
            <form id ="f" class="validation-form" method="post" novalidate>

                <div class="mb-3"  style="font-size: 130%">새로운 비밀번호
                    <input type="password" class="form-control" name="password "id="password" placeholder="새로운 비밀번호 입력란" required>

                </div>
                <div class="mb-3" style="font-size: 130%">비밀번호 확인란
                    <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인" required>
                </div>


                <hr class="mb-4">
                <div class="mb-4"></div>
                <button class="btn btn-primary btn-lg btn-block" type="submit" id="btnNewPassword" >비밀번호 재설정</button>
                <button class="btn btn-primary btn-lg btn-block" type="button" id="btnLogin">로그인</button>

            </form>
        </div>
    </div>

</div>

</body>

</html>