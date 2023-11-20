package project.sln.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CalendarDTO {
    private String calendarSeq;
    private String userId; // 일정 식별자
    private String title; // 일정 제목
    private String start; // 시작 일자
    private String end; // 종료 일자
    private String description; // 일정 설명

    // 생성자, getter 및 setter 메서드
}