<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List"%>
<%@ page import="project.sln.dto.GdsDTO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%
    List<GdsDTO> rList = (List<GdsDTO>) request.getAttribute("rList");
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>노인 우울증 자가 검사</title>
    <style type="text/css">h2{text-align: center; font-size: 34px; padding-bottom: 50px}
    button{width: 65%; height: 130px; margin: 0 auto;
        border: 1px solid #ccc;
        box-shadow: 2px 2px 5px #888;
        transition: transform 0.8s; cursor: pointer; color: white}
    button:hover {transform: scale(1.05);}
    body{ border: 90px; padding: 80px; background: linear-gradient(to bottom,navajowhite,lightsalmon)} table{margin: 0 auto;}
    table.tb {width: 100%; height: 40px; background-color: white; border-spacing: 0 16px; }
    table.tb h2 {font-family: 함초롬돋움; font-size: 34px; vertical-align: middle;}
    table {
        margin-top: 20px;
    }
    .fade-in {
        opacity: 0;
        animation: fadeIn 1.8s ease-in-out forwards; /* 애니메이션 완료 후 상태 유지 */
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    /* 아이콘을 처음에 숨김 */
    .icon {
        display: none;
    }

    /* 애니메이션이 완료된 후 아이콘 표시 */
    .fade-in.complete .icon {
        display: inline-block;
    }

    </style>




    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 85px; margin: 0 auto; max-width: 65%;">
        <div class="container px-5 d-flex justify-content-center">
            <a class="navbar-brand" style="font-size: 37px; color: black; font-weight: bold">우울증 자가 검사</a>
        </div>
    </nav>





    <script>

        function calculateScore() {
            var radioButtons = document.querySelectorAll('input[type="radio"]:checked');
            if (radioButtons.length === 0) {
                alert("선택할 항목을 고르세요.");
                return;
            }
            var score = 0;
            radioButtons.forEach(function (radio) {
                score += parseInt(radio.value);
            });


            if (score >= 0 && score <= 5) {
                window.location.href = "/info/average";
            } else if (score >= 6 && score <= 10) {
                window.location.href = "/info/caution";

            } else if (score >= 11 && score <= 15) {
                window.location.href = "/info/warning";
            }
            alert(score + "점이 나왔습니다. \ 확인 버튼을 눌러주세요.");
        }

    </script>
</head>
<body class="fade-in">


<table width="65%" style="margin: 0 auto; background-color: white;
font-family: 함초롬돋움; font-size: 120%; border-spacing: 0 16px" >
    <tr>
        <td style="padding-left: 2%">65세 이상의 어르신을 대상으로 하는 우울증 검사입니다. 다음 중 자신의 상태를 가장 잘 설명하는 문항을 하나 선택해주세요.</td>
    </tr>

    <tr>
        <td style="padding-left: 2%; padding-top: 9px">너무 오래 생각하지는 마시고 솔직하게 응답해주세요.</td>
    </tr>
</table>



<table width="65%" style="margin: 0 auto; border-radius: 1%; border-spacing: 0 16px;">
    <tr style="height: 67px">
        <th style="background-color: skyblue; font-family: 함초롬돋움">번호</th>
        <th style="background-color: skyblue; font-family: 함초롬돋움">문항</th>
        <th style="text-align: center; background-color: skyblue; width: 7%; font-family: 함초롬돋움">예</th>
        <th style="text-align: center; background-color: skyblue; width: 7%; font-family: 함초롬돋움">아니오</th>

    </tr>
    <tr>
        <td style="width: 6%; height: 360%; font-size: 220%; text-align: center; background-color: skyblue">1</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%; border-spacing: 0 16px;">현재의 생활에 대체적으로 만족하십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="a" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="a" value="0" style="width: 41%; height: 41%;"></td>
    </tr>
    <tr>
        <td style="height: 360%; font-size: 220%; text-align: center; background-color: skyblue">2</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">요즈음 들어 활동량이나 의욕이 많이 떨어지셨습니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="b" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="b" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">3</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">자신이 헛되이 살고 있다고 느끼십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="c" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="c" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">4</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">생활이 지루하게 느껴질 때가 많습니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="d" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="d" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">5</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">평소에 기분은 상쾌한 편이십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="e" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="e" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">6</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">자신에게 불길한 일이 닥칠 것 같아 불안하십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="f" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="f" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">7</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">대체로 마음이 즐거운 편이십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="g" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="g" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">8</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">절망적이라는 느낌이 자주 드십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="h" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="h" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">9</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">바깥에 나가기가 싫고 집에만 있고 싶습니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="i" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="i" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">10</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">비슷한 나이의 다른 노인들 보다 기억력이 더 나쁘다고 느끼십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="j" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="j" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">11</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">현재 살아있다는 것이 즐겁게 생각되십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="k" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="k" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">12</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">지금의 내 자신이 아무 쓸모없는 사람이라고 느끼십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="l" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="l" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">13</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">기력이 좋으신 편이십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="n" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="n" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">14</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">지금 자신의 처지가 아무런 희망도 없다고 느끼십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="o" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="o" value="0" style="width: 41%; height: 41%;"></td>

    </tr>
    <tr>
        <td style="text-align: center; height: 360%; font-size: 220%; background-color: skyblue">15</td>
        <td style="font-size: 160%; font-family: 함초롬돋움; background-color: white; padding-left: 3%">자신이 다른 사람들의 처지보다 더 못하다고 느끼십니까?</td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="p" value="1" style="width: 41%; height: 41%;"></td>
        <td style="text-align: center; width: 20px; height: 20px; background-color: white"><input type="radio" name="p" value="0" style="width: 41%; height: 41%;"></td>

    </tr>


    <table border="1">
        <tr >

            <button onclick="calculateScore()" style="background-color: deepskyblue; font-size: 220%; font-family: 함초롬돋움;
              border-radius: 10px; height: 110px; display: block; margin: 0 auto; margin-top: 20px; font-weight: bold"> 점수 계산하기 </button>

        </tr>
    </table>
</table>
</body>
</html>