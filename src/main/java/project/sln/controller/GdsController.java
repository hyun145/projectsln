package project.sln.controller;

import project.sln.dto.GdsDTO;
import project.sln.dto.MsgDTO;
import project.sln.service.IGdsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import project.sln.service.impl.GdsService;
import project.sln.util.CmmUtil;
import project.sln.util.EncryptUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;
import java.util.ArrayList;


@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "/gds")
@Controller
public class GdsController {
    private final IGdsService GdsService;

    @GetMapping("/gdsTest")
    public String selfTest(HttpSession session, ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".selfTest Start!");

        log.info(this.getClass().getName() + "selfTest End!");

        return "/gds/gdsTest";

    }





    @GetMapping("/gdsResult")
    public String gdsResult(HttpSession session, ModelMap model) {
        try {
            log.info(this.getClass().getName() + ".gdsResult Start!");

            // 세션에서 로그인한 사용자 아이디 가져오기
            String userId = (String) session.getAttribute("SS_USER_ID");

            // 사용자 아이디로 gdsService에서 데이터를 가져와서 모델에 추가
            List<GdsDTO> gdsList = GdsService.getGdsList();

            // 조회된 리스트 결과값을 모델에 추가
            model.addAttribute("gdsList", gdsList);

            // 로그 찍기
            log.info(this.getClass().getName() + ".gdsResult End!");

            // 함수 처리가 끝나고 보여줄 JSP 파일명
            // webapp/WEB-INF/views/gds/gdsResult.jsp
            return "gds/gdsResult";
        } catch (Exception e) {
            log.error(this.getClass().getName() + ".gdsResult Exception: " + e.getMessage());

            // 예외를 적절히 처리하거나, 에러 페이지로 리다이렉트 또는 포워드
            return "error";
        }
    }



    @ResponseBody
    @PostMapping(value = "insertGdsInfo")
    public MsgDTO insertGdsInfo(HttpServletRequest request, HttpSession session) throws Exception {

        log.info(this.getClass().getName() + ".insertGdsInfo 시작!");

        String msg = ""; // 메시지 내용

        MsgDTO dto = null; // 결과 메시지 구조

        try {

            String userId = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID"));
            String userName = (String) session.getAttribute("SS_USER_NAME");
            String score = CmmUtil.nvl(request.getParameter("score"));


            log.info("session user_id : " + userId);
            log.info("userName : " + userName);
            log.info("score : " + score);


            GdsDTO pDTO = new GdsDTO();
            pDTO.setUserId(userId);
            pDTO.setUserName(userName);
            pDTO.setScore(score);

            /*
             * 게시글 등록하기위한 비즈니스 로직을 호출
             */
            GdsService.insertGdsInfo(pDTO);

            // 저장이 완료되면 사용자에게 보여줄 메시지
            msg = "등록되었습니다.";

        } catch (Exception e) {

            // 저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            // 결과 메시지 전달하기
            dto = new MsgDTO();
            dto.setMsg(msg);

            log.info(this.getClass().getName() + ".GdsInsert End!");
        }

        return dto;
    }







    @ResponseBody
    @PostMapping(value = "updateGdsInfo")
    public MsgDTO updateGdsInfo(HttpServletRequest request, HttpSession session) throws Exception {
        log.info(this.getClass().getName() + ".updateGdsInfo 시작!");

        String msg = ""; // 메시지 내용
        MsgDTO dto = null; // 결과 메시지 구조

        try {
            String userId = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID"));
            String userName = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
            String score = CmmUtil.nvl(request.getParameter("score"));

            log.info("session user_id : " + userId);
            log.info("userName : " + userName);
            log.info("score : " + score);

            GdsDTO pDTO = new GdsDTO();
            pDTO.setUserId(userId);
            pDTO.setUserName(userName);
            pDTO.setScore(score);

            GdsService.updateGdsInfo(pDTO);

            msg = "업데이트되었습니다.";
        } catch (Exception e) {
            msg = "업데이트 실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();
        } finally {
            dto = new MsgDTO();
            dto.setMsg(msg);
            log.info(this.getClass().getName() + ".updateGdsInfo End!");
        }

        return dto;
    }

}

