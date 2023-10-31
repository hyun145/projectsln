package project.sln.controller;

import project.sln.dto.GdsDTO;
import project.sln.service.IGdsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;



@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "/gds")
@Controller
public class GdsController {
    private final IGdsService gdsService;

    @GetMapping("/gdsTest")
    public String selfTest(ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".selfTest Start!");

        List<GdsDTO> rList = gdsService.gdsTest();
        model.addAttribute("rList", rList);

        log.info(this.getClass().getName() + "selfTest End!");

        return "/gds/gdsTest";
    }
}

