package project.sln.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "page")
@Controller
public class IndexController {

    @GetMapping("index")
    public String mainPage(ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".mainPage Start!");

        return "/page/index";
    }

}
