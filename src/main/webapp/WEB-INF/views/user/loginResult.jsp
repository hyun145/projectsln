<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="project.sln.dto.UserDTO" %>
<%@ page import="project.sln.util.CmmUtil" %>
<%
    String ssUserName = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME")); // 로그인된 회원 이름
    String ssUserId = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID")); // 로그인된 회원 아이디
%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>로그인 성공</title>
    <link rel="stylesheet" href="/css/table.css"/>
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

        // HTML로딩이 완료되고, 실행됨
        $(document).ready(function () {
            // 버튼 클릭했을때, 발생되는 이벤트 생성함(onclick 이벤트와 동일함)
            $("#btnSend").on("click", function () {
                location.href = "/html/index.html";
            })


            $("#btnuserInfo").on("click", function () {
                userInfo();
            })

            function userInfo() {
                if(user_id === null) {
                    alert("로그인 하시길 바랍니다.");
                    location.href = "/login";
                }else {

                    location.href = "/user/loginuser";
                }
            }

        })

    </script>
</head>
<body>
<div class="divTable minimalistBlack">
    <div class="divTableBody">
        <div class="divTableRow">
            <div class="divTableCell">로그인된 사용자이름
            </div>
            <div class="divTableCell"><%=ssUserName%> 님이 로그인하였습니다.</div>
        </div>
        <div class="divTableRow">
            <div class="divTableCell">로그인된 사용자아이디
            </div>
            <div class="divTableCell"><%=ssUserId%> 입니다.</div>
        </div>

    </div>
</div>
<div>
</div>
<br/><br/>
<button id="btnSend" type="button" href="/page/index">메인 화면 이동</button>
<button id="btnuserInfo" type="button" href="/user/loginuser">상세보기</button>


<script type="text/javascript">
    $(document).ready(function () {
        $("#btnSend").on("click", function () {
            location.href = "/page/index"; // 메인 화면으로 이동
        });

        $("#btnuserInfo").on("click", function () {
            userInfo();
        });

        function userInfo() {
            // 이 함수를 통해 상세보기로 이동하는 코드를 작성
            location.href = "/user/loginuser";
        }
    });
</script>


</body>
</html>