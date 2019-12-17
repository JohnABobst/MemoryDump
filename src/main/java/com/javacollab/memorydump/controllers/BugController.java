package com.javacollab.memorydump.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bug")
public class BugController {

    private UserService userService;




    public BugController(UserService userService){
        this.userService = userService;
    }

    
    @RequestMapping("/{bug_id}")
    public String showBug(
        Model model){



            return "display.jsp";
    }


}
