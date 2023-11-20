package project.sln.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import project.sln.dto.CalendarDTO;
import project.sln.dto.MsgDTO;
import project.sln.service.ICalendarService;
import project.sln.service.impl.CalendarService;
import project.sln.util.CmmUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.DTD;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "/info")
@Controller
public class CalenderController {

    private final ICalendarService CalendarService;

    //    @GetMapping("calender")
//    public String calendar(HttpSession session, ModelMap model) throws Exception {
//
//        log.info(this.getClass().getName() + ".calender Start!");
//
//        String SS_USER_ID = (String) session.getAttribute("SS_USER_ID");
//        log.info("SS_USER_ID : " + SS_USER_ID);
//        CalendarDTO pDTO = new CalendarDTO();
//        pDTO.setUserId(SS_USER_ID);
//
//        List<CalendarDTO> rList = Optional.ofNullable(CalendarService.getCalendarList()).orElseGet(ArrayList::new);
//
//        model.addAttribute("rList", rList);
//
//
//        log.info(this.getClass().getName() + ".loginInfo End!");
//
//        return "/info/calender";
//    }
    @GetMapping("calender")
    public String calendar(HttpSession session, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".calendar Start!");

        String SS_USER_ID = (String) session.getAttribute("SS_USER_ID");
        log.info("SS_USER_ID : " + SS_USER_ID);

        // DB에서 캘린더 데이터를 가져오는 서비스 메서드를 호출합니다.
        List<CalendarDTO> rList = CalendarService.getCalendarList(SS_USER_ID);

        model.addAttribute("rList", rList);

        log.info(this.getClass().getName() + ".calendar End!");

        return "/info/calender";
    }


    @ResponseBody
    @PostMapping(value = "CalendarInsert")
    public MsgDTO CalendarInsert(HttpServletRequest request, HttpSession session) {

        log.info(this.getClass().getName() + ".noticeInsert Start!");
        String msg = ""; // 메시지 내용

        MsgDTO dto = null; // 결과 메시지 구조

        try {
            String userId = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID"));
            String title = CmmUtil.nvl(request.getParameter("title"));
            String start = CmmUtil.nvl(request.getParameter("start")); // 제목
            String end = CmmUtil.nvl(request.getParameter("end")); // 공지글 여부
            String description = CmmUtil.nvl(request.getParameter("description")); // 내용

            /*
             * ####################################################################################
             * 반드시, 값을 받았으면, 꼭 로그를 찍어서 값이 제대로 들어오는지 파악해야함 반드시 작성할 것
             * ####################################################################################
             */
            log.info("session user_id : " + userId);
            log.info("title : " + title);
            log.info("start : " + start);
            log.info("end : " + end);
            log.info("description : " + description);

            // 데이터 저장하기 위해 DTO에 저장하기
            CalendarDTO pDTO = new CalendarDTO();
            pDTO.setUserId(userId);
            pDTO.setTitle(title);
            pDTO.setStart(start);
            pDTO.setEnd(end);
            pDTO.setDescription(description);

            CalendarService.insertCalendarInfo(pDTO);

            msg = "일정이 등록되었습니다.";
        } catch (Exception e) {

            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            // 결과 메시지 전달하기
            dto = new MsgDTO();
            dto.setMsg(msg);

            log.info(this.getClass().getName() + ".CalendarInsert End!");
        }

        return dto;
    }

    @ResponseBody
    @PostMapping(value = "CalendarUpdate")
    public MsgDTO CalendarUpdate(HttpSession session, HttpServletRequest request) {

        log.info(this.getClass().getName() + ".CalendarUpdate Start!");

        String msg = ""; // 메시지 내용
        MsgDTO dto = null; // 결과 메시지 구조

        try {
            String calendarSeq = CmmUtil.nvl(request.getParameter("calendarSeq"));
            String userId = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID")); // 아이디
            String start = CmmUtil.nvl(request.getParameter("start")); // 글번호(PK)
            String title = CmmUtil.nvl(request.getParameter("title")); // 제목
            String end = CmmUtil.nvl(request.getParameter("end")); // 공지글 여부
            String description = CmmUtil.nvl(request.getParameter("description")); // 내용

            log.info("calendarSeq : " + calendarSeq);
            log.info("userId : " + userId);
            log.info("title : " + title);
            log.info("start : " + start);
            log.info("end : " + end);
            log.info("description : " + description);

            CalendarDTO pDTO = new CalendarDTO();
            pDTO.setCalendarSeq(calendarSeq);
            pDTO.setUserId(userId);
            pDTO.setTitle(title);
            pDTO.setStart(start);
            pDTO.setEnd(end);
            pDTO.setDescription(description);

            // 게시글 수정하기 DB
            CalendarService.updateCalendarInfo(pDTO);

            msg = "수정되었습니다.";
        } catch (Exception e) {
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {

            // 결과 메시지 전달하기
            dto = new MsgDTO();
            dto.setMsg(msg);

            log.info(this.getClass().getName() + ".CalendarUpdate End!");
        }
        return dto;
    }

    /**
     * 게시판 글 삭제
     */
    @ResponseBody
    @PostMapping(value = "CalendarDelete")
    public MsgDTO CalendarDelete(HttpServletRequest request) {

        log.info(this.getClass().getName() + ".CalendarDelete Start!");

        String msg = ""; // 메시지 내용
        MsgDTO dto = null; // 결과 메시지 구조

        try {
            String calendarSeq = CmmUtil.nvl(request.getParameter("calendarSeq")); // 글번호(PK)

            /*
             * ####################################################################################
             * 반드시, 값을 받았으면, 꼭 로그를 찍어서 값이 제대로 들어오는지 파악해야함 반드시 작성할 것
             * ####################################################################################
             */
            log.info("calendarSeq : " + calendarSeq);

            /*
             * 값 전달은 반드시 DTO 객체를 이용해서 처리함 전달 받은 값을 DTO 객체에 넣는다.
             */
            CalendarDTO pDTO = new CalendarDTO();
            pDTO.setCalendarSeq((calendarSeq));

            // 게시글 삭제하기 DB
            CalendarService.deleteCalendarInfo(pDTO);

            msg = "삭제되었습니다.";

        } catch (Exception e) {
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            // 결과 메시지 전달하기
            dto = new MsgDTO();
            dto.setMsg(msg);

            log.info(this.getClass().getName() + ".CalendarDelete End!");

        }

        return dto;
    }


}