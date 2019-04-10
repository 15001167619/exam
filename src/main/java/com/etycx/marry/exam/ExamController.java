package com.etycx.marry.exam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "${adminPath}")
public class ExamController {

    @RequestMapping(value = "loginIndexFirst")
    public String loginIndexFirst() {
        return "modules/exam/indexFirst";
    }

    @RequestMapping(value = "loginFirst")
    public String loginFirst(String userName, String studentId, Model model) {
        model.addAttribute("userName", userName);
        model.addAttribute("studentId", studentId);
        return "modules/exam/questions";
    }



    @RequestMapping(value = "loginSecond")
    public String loginSecond(String userName, String studentId, Model model) {
        model.addAttribute("userName", userName);
        model.addAttribute("studentId", studentId);
        return "modules/exam/questions";
    }

}
