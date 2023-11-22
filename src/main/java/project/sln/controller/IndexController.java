package project.sln.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "page")
@Controller
public class IndexController {

    @GetMapping("index")
    public String mainPage(ModelMap model, HttpSession session) throws Exception {







        log.info(this.getClass().getName() + ".mainPage Start!");

        return "/page/index";
    }

    @GetMapping(value = "logout")
    public String logout(HttpServletRequest request, HttpSession session) throws Exception {
        log.info(this.getClass().getName() + "./user/logout Start!");

        session.getAttribute("SS_USER_ID");



        session.invalidate();

        return "/page/index";

    }

}
