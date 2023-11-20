package project.sln.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import project.sln.dto.MsgDTO;
import project.sln.dto.UserDTO;
import project.sln.service.IUserService;
import project.sln.util.CmmUtil;
import project.sln.util.EncryptUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Optional;

@Slf4j
@RequestMapping(value = "/user")
@RequiredArgsConstructor
@Controller
class UserController {

    private final IUserService userService;


    @GetMapping(value = "userReg")
    public String userReg() {
        log.info(this.getClass().getName() + ".userReg Start!");

        return "user/userReg";
    }



    @ResponseBody
    @PostMapping(value = "getUserIdExists")
    public UserDTO getUserIdExists(HttpServletRequest request) throws Exception {
        log.info(this.getClass().getName() + ".getUserExists Start!");

        String userId = CmmUtil.nvl(request.getParameter("userId"));

        log.info("userId : " + userId);
        UserDTO pDTO = new UserDTO();
        pDTO.setUserId(userId);

        UserDTO rDTO = Optional.ofNullable(userService.getUserIdExists(pDTO)).orElseGet(UserDTO::new);

        log.info(this.getClass().getName() + ".getUserExists End!");
        return rDTO;
    }




    @ResponseBody
    @PostMapping(value = "getNickNameCheck")
    public UserDTO getNickNameCheck(HttpServletRequest request) throws Exception {
        log.info(this.getClass().getName() + ".getNickNameCheck Start!");

        String nickName = CmmUtil.nvl(request.getParameter("nickName"));

        log.info("nickName" + nickName);
        UserDTO pDTO = new UserDTO();
        pDTO.setNickName(nickName);

        UserDTO rDTO = Optional.ofNullable(userService.getNickNameCheck(pDTO)).orElseGet(UserDTO::new);

        log.info(this.getClass().getName() + ".getNickNameCheck End!");

        return rDTO;
    }



    @ResponseBody
    @PostMapping(value = "insertUserInfo")
    public MsgDTO insertUserInfo(HttpServletRequest request) throws Exception {
        log.info(this.getClass().getName() + ".insertUserInfo Start!");

        int res = 0;
        String msg = "";
        MsgDTO dto = null;

        UserDTO pDTO = null;


        try {
            String userName = CmmUtil.nvl(request.getParameter("name"));
            String nickName = CmmUtil.nvl(request.getParameter("nickName"));
            String userId = CmmUtil.nvl(request.getParameter("userId"));
            String password = CmmUtil.nvl(request.getParameter("password"));
            String birthDay = CmmUtil.nvl(request.getParameter("birthDay"));
            String addr1 = CmmUtil.nvl(request.getParameter("addr1"));
            String addr2 = CmmUtil.nvl(request.getParameter("addr2"));


//            String agreement = CmmUtil.nvl(request.getParameter("agreement"));


            log.info("userId : " + userId);
            log.info("password" + password);
            log.info("userName" + userName);
            log.info("birthDAy" + birthDay);
            log.info("addr1" + addr1);
            log.info("addr1" + addr2);
            log.info("nickName" + nickName);

//            if (!"Y".equals(agreement)) {
//                msg = "개인정보 수집 및 이용에 동의해야 회원가입이 가능합니다.";
//                res = 0;  // 동의하지 않으면 회원가입이 이루어지지 않도록 res 값을 0으로 설정
//            } else {


            pDTO = new UserDTO();

            pDTO.setUserId(userId);
            pDTO.setUserName(userName);
            pDTO.setPassword(EncryptUtil.encHashSHA256(password)); // 비번
            pDTO.setBirthDay(birthDay); // 주민등록번호
            pDTO.setAddr1(addr1);
            pDTO.setAddr2(addr2);
            pDTO.setNickName(nickName);


            res = userService.insertUserInfo(pDTO);

            log.info("회원가입 결과(res) : " + res);

            if (res == 1) {
                msg = "회원가입되었습니다.";

            } else if (res == 2) {
                msg = "이미 가입된 아이디입니다.";

            } else {
                msg = "오류로 인해 회원가입 실패하셨습니다 !";

            }



        } catch(Exception e){
            msg = "실패하였습니다. " + e;
            log.info(e.toString());
            e.printStackTrace();
        } finally{
            dto = new MsgDTO();
            dto.setResult(res);
            dto.setMsg(msg);
            log.info(this.getClass().getName() + ".insertUserInfo End! ");
        }

        return dto;

    }




    @GetMapping(value = "login")
    public String login () {
        log.info(this.getClass().getName() + ".user/login Start!");

        log.info(this.getClass().getName() + ".user/login End!");
        return "user/login";
    }


    @ResponseBody
    @PostMapping(value = "loginProc")
    public MsgDTO loginProc (HttpServletRequest request, HttpSession session){
        log.info(this.getClass().getName() + ".loginProc Start!");

        int res = 0;        // 처리 결과를 저장할 변수 (성공 : 1, 아이디, 실패 : 0, 시스템에러 : 2)
        String msg = "";    // 로그인 결과에 대한 메시지를 저장할 변수 !
        MsgDTO dto = null;  // 결과 메시지 구조

        UserDTO pDTO = null; // 웹에서 받은 정보를 저장할 변수


        try {
            String userId = CmmUtil.nvl(request.getParameter("userId"));
            String password = CmmUtil.nvl(request.getParameter("password"));

            log.info("userId :" + userId);
            log.info("password : " + password);

            pDTO = new UserDTO();

            pDTO.setUserId(userId);
            pDTO.setPassword(EncryptUtil.encHashSHA256(password));

            // 비밀번호 일치 확인을 위한 Service 호출 !
            UserDTO rDTO = userService.getLogin(pDTO);


            // 로그인에 성공했다면 회원 정보를 session에 저장!
            if (CmmUtil.nvl(rDTO.getUserId()).length() > 0) {
                res = 1;

                session.setAttribute("SS_USER_ID", userId);
                session.setAttribute("SS_USER_NAME", CmmUtil.nvl(rDTO.getUserName()));

            } else {
                msg = "아이디와 비밀번호가 올바르지 않습니다.";
            }
        } catch (Exception e) {
            msg = "시스템 문제로 로그인이 실패했습니다.";
            res = 2;
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            dto = new MsgDTO();
            dto.setResult(res);
            dto.setMsg(msg);

            log.info(this.getClass().getName() + ".loginProc end!");
        }


        return dto;

    }

    @GetMapping(value = "loginResult")
    public String loginResult () throws Exception {

        log.info(this.getClass().getName() + ".user/loginResult Start!");


        log.info(this.getClass().getName() + ".user/loginResult End!");
        return "/user/loginResult";
    }



    @ResponseBody
    @PostMapping(value = "searchUserIdProc")
    public MsgDTO searchUserIdProc(HttpServletRequest request, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".user/searchUserIdProc Start!");


        int res = 0;

        String msg = "";

        UserDTO pDTO = new UserDTO();

        MsgDTO dto = null;
        try {

            String userName = CmmUtil.nvl(request.getParameter("userName"));
            String birthDay = CmmUtil.nvl(request.getParameter("birthDay"));



            log.info("userName : " + userName);
            log.info("birthDay : " + birthDay);

            pDTO.setUserName(userName);
            pDTO.setBirthDay(birthDay);

            UserDTO rDTO = Optional.ofNullable(userService.searchUserIdOrPasswordProc(pDTO)).orElseGet(UserDTO::new);
            // userService 호출해서 연결되있는 매퍼해서 DB에서 있는지 조회

            model.addAttribute("rDTO", rDTO);

            msg = "회원님의 아이디는" + CmmUtil.nvl(rDTO.getUserId()) + "입니다.";


        } catch (Exception e) {
            msg = "시스템 문제로 로그인이 실패했습니다.";
        } finally {
            dto = new MsgDTO();
            dto.setResult(res);
            dto.setMsg(msg);
            log.info(this.getClass().getName() + ".searchUserIdProc End!");

        }


        return dto;










    }

    // 아이디 찾기
    @GetMapping(value = "searchUserId")
    public String searchUserId() {
        log.info(this.getClass().getName() + ".searchUserId Start!");
        log.info(this.getClass().getName() + ".searchUserId End!");

        return "/user/searchUserId";
    }




    // 비밀번호 찾기
    @GetMapping(value = "searchPassword")
    public String searchPassword(HttpSession session) {
        log.info(this.getClass().getName() +".searchPassword Start!");
        session.setAttribute("NEW_PASSWORD", "");       // 세션 삭제
        session.removeAttribute("NEW_PASSWORD");

        log.info(this.getClass().getName() +".searchPassword End!");

        return "user/searchPassword";


    }

    @PostMapping(value = "searchPasswordProc")
    public String searchPasswordProc(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {

        log.info(this.getClass().getName() + ".user/searchPasswordProc Start!");

        String userId = CmmUtil.nvl(request.getParameter("userId"));

        String userName = CmmUtil.nvl(request.getParameter("userName"));

        String birthDay = CmmUtil.nvl(request.getParameter("birthDay"));

        log.info("userId : " + userId);
        log.info("userName : " + userName);
        log.info("birthDay : " + birthDay);

        UserDTO pDTO = new UserDTO();
        pDTO.setUserId(userId);
        pDTO.setUserName(userName);
        pDTO.setBirthDay(birthDay);

        UserDTO rDTO = Optional.ofNullable(userService.searchUserIdOrPasswordProc(pDTO)).orElseGet(UserDTO::new);



        model.addAttribute("rDTO", rDTO);


        // userId 넣은 이유는 비밀번호 재설정하는 newPasswordProc 함수에서 사용하기 위함.
        session.setAttribute("NEW_PASSWORD", userId);
        log.info(this.getClass().getName() + ".user/searchPasswordProc End!");

        return "user/newPassword";

    }




    // 비밀번호 찾기 로직 수행 , 아이디, 이름, 이메일이 일치하면 재발급 화면으로 이동 !
    @PostMapping(value = "newPasswordProc")
    public String newPasswordProc(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
        log.info(this.getClass().getName() + ".user/newPasswordProc Start!");

        String msg = ""; // 웹에 보여줄 메시지

        String newPassword = CmmUtil.nvl((String) session.getAttribute("NEW_PASSWORD"));         //정상적인 접근인지 체크




        if (newPassword.length() > 0) {     // 받은 newPassword가 0보다 클 떄 ,



            String password = CmmUtil.nvl(request.getParameter("password"));        // 신규 비밀번호 ( 웹으로 받은 변수는 DTO에 저장하기 위해 임시로 String 변수에 저장함.

            log.info(" 입력한 새로운 password : " + password);

            UserDTO pDTO = new UserDTO();

            pDTO.setUserId(newPassword);
            pDTO.setPassword(EncryptUtil.encHashSHA256(password));

            userService.newPasswordProc(pDTO);

            // 보안을 위해 session 비워주기.
            session.setAttribute("NEW_PASSWORD", "");
            session.removeAttribute("NEW_PASSWORD");

            msg = "비밀번호가 재설정되었습니다.";
        } else {
            msg = "비정상 접근입니다."; // 바로 넘어갈 떄
        }

        model.addAttribute("msg", msg);


        log.info(this.getClass().getName() + ".user/newPasswordProc End!");

        return "user/newPassword";

    }






}




