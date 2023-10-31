<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
    <style>
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1000;
        }
        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
        }
    </style>
    <script>

        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth'
            });
            calendar.render();
        });

    </script>
</head>
<body>

<!-- 모달 창 -->
<div id="eventModal" class="modal">
    <div class="modal-content">
        <h2>일정 추가</h2>
        <form id="eventForm">
            <label for="eventName">일정명:</label>
            <input type="title" id="eventName" name="eventName"><br>
            <label for="eventDate">일정 시작 날짜:</label>
            <input type="date" id="eventDate" name="eventDate"><br>
            <label for="eventEndDate">일정 종료 날짜:</label>
            <input type="date" id="eventEndDate" name="eventEndDate"><br>
            <label for="eventDescription">일정 설명:</label>
            <textarea id="eventDescription" name="eventDescription"></textarea><br>
            <button type="submit">저장</button>
            <button id="closeModal" type="button">닫기</button>
        </form>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
            // 캘린더 설정 및 옵션

            headerToolbar: {
                start: 'dayGridMonth,timeGridWeek,timeGridDay',
                center: 'title',
                end: 'today prev,next addEventButton' // "일정 추가" 버튼 추가
            },
            customButtons: {
                addEventButton: {
                    text: '일정 추가',
                    click: function() {
                        var modal = document.getElementById('eventModal');
                        modal.style.display = 'block';
                    }
                }
            },
            dateClick: function(info) {
                var modal = document.getElementById('eventModal');
                modal.style.display = 'block';
                // 클릭한 날짜를 입력 필드에 설정
                document.getElementById('eventDate').value = info.dateStr;
            }
        });

        calendar.render(); // 캘린더 렌더링

        var modal = document.getElementById('eventModal');
        var closeModalButton = document.getElementById('closeModal');

        // "닫기" 버튼 클릭 이벤트 처리
        closeModalButton.addEventListener('click', function() {
            modal.style.display = 'none';
            document.getElementById('eventForm').reset();
        });

        // 모달 창 외부를 클릭했을 때 모달 닫기
        window.addEventListener('click', function(event) {
            if (event.target == modal) {
                modal.style.display = 'none';
                document.getElementById('eventForm').reset();
            }
        });

        // 폼 제출 시 캘린더에 일정 추가
        document.getElementById('eventForm').addEventListener('submit', function(event) {
            event.preventDefault();
            var eventName = document.getElementById('eventName').value;
            var eventDate = document.getElementById('eventDate').value;
            var eventEndDate = document.getElementById('eventEndDate').value;

            // 이벤트를 캘린더에 추가하는 코드 (FullCalendar API 사용)
            calendar.addEvent({
                title: eventName,
                start: eventDate,
                end: eventEndDate
            });

            // 모달 다이얼로그 닫기
            modal.style.display = 'none';

            // 폼 초기화
            document.getElementById('eventForm').reset();
        });
    });
</script>
<div id='calendar'></div>
</body>
</html>