package project.sln.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "/searchHospital")
@Controller
public class SearchHospitalController {

    @GetMapping(value = "test")
    public String test() {
        log.info(this.getClass().getName() + ".test Start");

        log.info(this.getClass().getName() + ".test End");

        return "/searchHospital/test";

    }

}
