package com.dbteam6.resourcesharing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String Index() {
        return "index";
    }

    @GetMapping("/main_page")
    public String mainPage() {
        return "main_page";
    }
    
    @GetMapping("/signup")
    public String signup(){
        return "signup";
    }

    @GetMapping("/mypage")
    public String mypage() {
        return "mypage";
    }
}
