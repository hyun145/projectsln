package project.sln.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.sln.dto.CalendarDTO;
import project.sln.dto.GdsDTO;
import project.sln.persistance.mapper.ICalendarMapper;
import project.sln.persistance.mapper.IGdsMapper;
import project.sln.service.ICalendarService;

import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Service
public class CalendarService implements ICalendarService {
    private final ICalendarMapper CalendarMapper;
    @Override
    public List<CalendarDTO> getCalendarList(String userId) throws Exception {
        log.info(this.getClass().getName() + "getCalendarList start!");

        return CalendarMapper.getCalendarList(userId);
    }

    @Transactional
    @Override
    public void insertCalendarInfo(CalendarDTO pDTO) throws Exception {
        log.info(this.getClass().getName() + "InsertCalendarInfo start!");

        CalendarMapper.insertCalendarInfo(pDTO);

    }

    @Transactional
    @Override
    public void getCalendarInfo(CalendarDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + "getCalendarInfo start!");

        CalendarMapper.getCalendarInfo(pDTO);
    }

    @Transactional
    @Override
    public void updateCalendarInfo(CalendarDTO pDTO) throws Exception {
        log.info(this.getClass().getName() + "updateCalendarInfo start!");

        CalendarMapper.updateCalendarInfo(pDTO);

    }

    @Transactional
    @Override
    public void deleteCalendarInfo(CalendarDTO pDTO) throws Exception {
        log.info(this.getClass().getName() + "deleteCalendarInfo start!");
        CalendarMapper.deleteCalendarInfo(pDTO);
        log.info(this.getClass().getName() + ".deleteCalendarInfo end!");
    }
}