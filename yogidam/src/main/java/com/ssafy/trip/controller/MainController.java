package com.ssafy.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController implements ControllerHelper {

    @GetMapping({ "/", "/index" })
    public String index() {
        return "index";
    }

}
