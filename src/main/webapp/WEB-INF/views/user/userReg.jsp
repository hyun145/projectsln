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

            let f = document.getElementById("f");

            $("#btnUserId").on("click", function () {
                CheckUserId(f);

            })
            $("#btnAddr").on("click", function () {
                kakaoPost(f);
            })
            $("#btnNickName").on("click", function () {
                checkNickName(f);

            })
            $("#btnSend").on("click", function (event) {
                event.preventDefault()
                method = "post";

                doSubmit(f);
            })

        })


        function CheckUserId(f) {

            if (f.userId.value === "") {
                alert("아이디를 입력해주세요.");
                f.userId.focus();
                return;
            }

            var regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/;

            if (!regex.test(f.userId.value)) {
                alert("아이디는 영문자와 숫자를 혼합하여 작성해야 합니다.");
                f.userId.focus();
                return;
            }

            $.ajax({
                    url: "/user/getUserIdExists",
                    type: "post", // 전송방식은 Post
                    dataType: "JSON", // 전송 결과는 JSON으로 받기
                    data: $("#f").serialize(), // form 태그 내 input 등 객체를 자동으로 전송할 형태로 변경하기
                    success: function (json) { // 호출이 성공했다면..

                        if (json.existsYn === "Y") {
                            alert("이미 가입된 아이디가 존재합니다.");
                            f.userId.focus();

                        } else {
                            alert("가입 가능한 아이디입니다.");
                            userIdCheck = "N";

                        }
                    }
                }
            )
        }



        <%--function CheckPassWord(f) {--%>

        <%--    &lt;%&ndash; 비밀번호 체크 &ndash;%&gt;--%>
        <%--    if (passwordCheck == "" || password == "") {--%>
        <%--        alert("비밀번호를 입력 해주세요");--%>
        <%--        $("#passwordCheck").focus();--%>
        <%--        return;--%>

        <%--    } else if (passwordCheck != password) {--%>
        <%--        alert("비밀번호가 일치 하지 않습니다.");--%>
        <%--        $("#password").focus();--%>
        <%--        return;--%>
        <%--    } else {--%>

        <%--    }--%>
        <%--}--%>


        function CheckPassword(password, passwordCheck) {

            if (password === "" || passwordCheck === "") {
                alert("비밀번호를 입력하세요.");
                $("#passwordCheck").focus();
                return;
            }

            var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/;

            if (!regex.test(password)) {
                alert("비밀번호는 영문자, 숫자, 특수문자를 혼합하여 작성해야 합니다. 다시 작성해주세요.");
                $("#password").focus();
                return;
            }


            if (passwordCheck !== password) {
                alert("비밀번호가 일치하지 않습니다.");
                $("#password").focus();
                return;
            }
        }


        function checkNickName(f) {
            if (nickName === "") {
                alert("닉네임을 입력해주세요.");
                f.nickName.focus();
                return;
            }
            $.ajax({
                    url: "/user/getNickNameCheck",
                    type: "post", // 전송방식은 Post
                    dataType: "JSON", // 전송 결과는 JSON으로 받기
                    data: $("#f").serialize(), // form 태그 내 input 등 객체를 자동으로 전송할 형태로 변경하기
                    success: function (json) { // 호출이 성공했다면..

                        if (json.existsYn === "Y") {
                            alert("이미 가입된 닉네임이 존재합니다.");
                            f.nickName.focus();

                        } else { // 중복되는 값 없음 !
                            alert("가입 가능한 닉네임입니다..");
                        }
                    }
                }
            )
        }

        function doSubmit(f) {


            if (f.userId.value === "") {
                alert("아이디를 입력하세요.");
                f.userId.focus();
                return;
            }


            if (userIdCheck !== "N") {
                alert("아이디 중복 체크 및 중복되지 않은 아이디로 가입 바랍니다.");
                f.userId.focus();
                return;
            }


            if (f.password.value === "") {
                alert("비밀번호를 입력하세요.");
                f.password.focus();
                return;
            }

            if (f.password2.value === "") {
                alert("비밀번호 확인을 입력하세요.")
                f.password2.focus();
                return;
            }


            if (f.password.value !== f.password2.value) {
                alert("비밀번호가 일치하지 않습니다.");
                f.password.focus();
                return;
            }


            if (f.name.value === "") {
                alert("이름을 입력하세요.");
                f.name.focus();
                return;
            }


            if (f.nickName.value === "") {
                alert("닉네임을 입력하세요.");
                f.nickName.focus();
                return;
            }


            if (f.birthDay.value === "") {
                alert("생년월일을 입력해주세요.");
                f.birthDay.focus();
                return;
            }

            if (f.addr1.value === "") {
                alert("주소를 작성해주세요.");
                f.addr1.focus();
                return;
            }


            if (f.addr2.value === "") {
                alert("상세주소를 작성해주세요.");
                f.addr2.focus();
                return;
            }


            if (!f.agreement.checked) {
                alert("회원가입 약관에 동의해주세요.");
                f.agreement.focus();
                return;
            }


            // $.ajax({
            //     url: "/user/insertUserInfo",
            //     type: "post",
            //     dataType: "JSON",
            //     data: $("#f").serialize(),
            //     success: function (json) {
            //
            //         alert(json.msg);
            //
            //         location.href = "/user/login";
            //
            //
            //
            //         if (json.result === 1) {
            //
            //
            //         }
            //     }
            // })



            $.ajax({
                url: "/user/insertUserInfo",
                method: "post",
                dataType: "JSON",
                data: $("#f").serialize(),
                success: function (json) {

                   if (json.result === 1) {
                    alert(json.msg);

                        location.href = "/user/login";


                    }


                }
            })
        }

        function kakaoPost(f) {
            new daum.Postcode({
                oncomplete: function (data) {

// Kakao에서 제공하는 data는 JSON구조로 주소 조회 결과값을 전달함
// 주요 결과값
// 주소 : data.address
// 우편번호 : data.zonecode
                    let address = data.address; // 주소
                    let zonecode = data.zonecode; // 우편번호
                    f.addr1.value = "(" + zonecode + ")" + address
                }
            }).open();
        }


        window.addEventListener('load', () => {
            const forms = document.getElementsByClassName('validation-form');

            Array.prototype.filter.call(forms, (form) => {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
        }, false);



    </script>






</head>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 화면</title>

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
            <h4 class="mb-3" text-align>회원가입</h4>
            <%--            <form id ="f" class="validation-form" novalidate>--%>
            <form id ="f" autocomplete="off" method="post">

                <div class="mb-3" style="font-size: 130%">아이디
                    <input type="text" class="form-control" name="userId" id="userId" style="width: 70%"  required>
                    <button class="btn btn-outline-secondary" id="btnUserId" type="button">아이디 중복체크</button>
                </div>


                <div class="mb-3" style="font-size: 130%">비밀번호
                    <input type="password" class="form-control" name="password" id="password" placeholder="" required>
                </div>
                <div class="mb-3" style="font-size: 130%">비밀번호 확인
                    <input type="password" class="form-control" name="password2" placeholder="" required>
                </div>


                <div class="row">
                    <div class="col-md-6 mb-3" style="font-size: 130%">이름
                        <input type="text" class="form-control" name="name" value="" required>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md mb-3" style="font-size: 130%">닉네임
                        <input type="text" class="form-control" name="nickName" id="nickName"  value="" required>
                        <button class="btn btn-outline-secondary" id="btnNickName" type="button">닉네임 중복체크</button>
                    </div>
                </div>


                <div class="mb-3"  style="font-size: 130%">생년월일<span class="text-muted"></span>
                    <input type="text" class="form-control"  name="birthDay" placeholder="생년월일을 입력해 주세요.">
                </div>


                <div class="mb-3" style="font-size: 130%">주소
                    <input type="text" class="form-control" id="addr1" name="addr1" required>
                    <button class= "btn btn-outline-secondary"  id="btnAddr" type="button">우편번호</button>
                </div>


                <div class="mb-3" style="font-size: 130%">상세주소<span class="text-muted">&nbsp;</span>
                    <input type="text" class="form-control" name="addr2" id="addr2">
                </div>


                <hr class="mb-4">
                <div class="custom-control custom-checkbox" style="font-size: 130%">
                    <input type="checkbox" clas="custom-control-input" id="agreement"  name="agreement" required>
                    개인정보 수집 및 이용에 동의합니다.</div>
                <div class="mb-4"></div>
                <button class="btn btn-primary btn-lg btn-block" type="submit" id="btnSend">가입 완료</button>
            </form>
        </div>
    </div>

</div>

</body>

</html>

