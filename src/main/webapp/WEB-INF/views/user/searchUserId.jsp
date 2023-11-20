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

            $("#btnSearchUserId").on("click", function (event) {
                event.preventDefault()
                method= "post";
                let f = document.getElementById("f");

                if(f.userName.value === "") {
                    alert("이름을 입력하세요.");
                    f.userName.focus();
                    return;

                }
                if(f.birthDay.value ==="") {
                    alert("생년월일을 입력하세요.");
                    f.birthDay.focus();
                    return;
                }

                console.log(f.birthDay.value);
                console.log(f.userName.value);

                $.ajax({
                    url: "/user/searchUserIdProc",
                    method: "post", // 전송방식은 Post
                    dataType: "JSON", // 전송 결과는 JSON으로 받기
                    data: $("#f").serialize(), // form 태그 내 input 등 객체를 자동으로 전송할 형태로 변경하기
                    success: function (json) {
                    //     아약스를 호출했을 때 컨트롤러쪽에서 rDTO로 DB에 저장되있는 것을 넘겨줘야함. 그럼 위에 선언해줘야하는거 아닌가?
                    //     위에 작성한 데이터를 보낸 것이 data 부분임 . 맞지 ?  ㅇㅋ 그럼 이제 이것을 DB에서 확인해서 맞으면 넘겨줄거임. 맞나?  모르겠다

                            alert(json.msg);
                            window.location.href ="/user/login";




                    }
                })


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
    <title>아이디찾기 화면</title>

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
            <h4 class="mb-3" text-align>아이디 찾기</h4>
            <form id ="f" class="validation-form" novalidate>

                <div class="mb-3"  style="font-size: 130%">이름
                    <input type="text" class="form-control" name="userName"id="userName" placeholder="회원가입 할 때 적으셨던 이름을 입력해주세요." required>

                </div>
                <div class="mb-3" style="font-size: 130%">생년월일
                    <input type="password" class="form-control" id="birthDay" name="birthDay" placeholder="회원가입할 때 적으셨던 생년월일을 입력해주세요." required>
                </div>







                <hr class="mb-4">
                <div class="mb-4"></div>
                <button class="btn btn-primary btn-lg btn-block" type="submit" id="btnSearchUserId">아이디 찾기</button>
            </form>
        </div>
    </div>

</div>

</body>

</html>