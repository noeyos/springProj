package kr.or.ddit.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/groovy")
@Slf4j
@Controller
public class GroovyController {

    @RequestMapping("/groovy")
    public String login() {
        log.info("로그인 페이지 열림");

        return "groovy/login";
    }

}
