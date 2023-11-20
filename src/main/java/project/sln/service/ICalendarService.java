package project.sln.service;

import project.sln.dto.CalendarDTO;
import project.sln.dto.GdsDTO;

import java.util.List;

public interface ICalendarService {

    List<CalendarDTO> getCalendarList(String userId) throws Exception;
    void insertCalendarInfo(CalendarDTO pDTO) throws Exception;
    void getCalendarInfo(CalendarDTO pDTO) throws Exception;
    void updateCalendarInfo(CalendarDTO pDTO) throws Exception;
    void deleteCalendarInfo(CalendarDTO pDTO) throws Exception;

}
