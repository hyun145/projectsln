<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인 및 회원가입</title>
    <style>
        .button {
            display: inline-block;
            height: 330px;
            width: 330px;
            font-size: 34px;
            font-weight: bold;
            border-radius: 13px;
            cursor: pointer;   transform: scale(1);
            transition: transform 0.7s; color: purple;
        }

        .button a {
            text-decoration: none; /* 밑줄 제거 스타일 */
        }





        .button:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body style="background: linear-gradient(to bottom, #87CEEB, #E6E6FA, #B0E0E6)" class="fade-in">
<div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
    <div style="text-align: center;">
        <button id="loginButton" class="button" style="margin-right: 35px" onclick="window.location.href='http://localhost:11000/user/login';">
            로그인 하기
        </button>
        <button id="signupButton" class="button" style="margin-left: 35px" onclick="window.location.href='http://localhost:11000/user/userReg';">
            회원가입 하기
        </button>
    </div>
</div>
</body>
</html>