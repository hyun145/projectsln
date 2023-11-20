package project.sln.persistance.mapper;

import project.sln.dto.CalendarDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ICalendarMapper {
    List<CalendarDTO> getCalendarList(String userId) throws Exception;
    CalendarDTO getCalendarInfo(CalendarDTO pDTO) throws Exception;
    void insertCalendarInfo(CalendarDTO pDTO) throws Exception;
    void updateCalendarInfo(CalendarDTO pDTO) throws Exception;
    void deleteCalendarInfo(CalendarDTO pDTO) throws Exception;
}