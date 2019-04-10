package com.etycx.marry.exam;

import com.etycx.marry.common.config.Global;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "${adminPath}")
public class ExamController {

    @RequestMapping(value = "loginFirst")
    public String loginFirst(String userName, String studentId, Model model) {
        model.addAttribute("userName", userName);
        model.addAttribute("studentId", studentId);
        model.addAttribute("logout", "logoutFirst");
        return "modules/exam/questions";
    }

    @RequestMapping(value = "logoutFirst")
    public String logoutFirst() {
        return "redirect:"+ Global.getAdminPath()+"/loginIndexFirst";
    }

    @RequestMapping(value = "logoutSecond")
    public String logoutSecond() {
        return "redirect:"+ Global.getAdminPath()+"/loginIndexSecond";
    }

    @RequestMapping(value = "loginSecond")
    public String loginSecond(String userName, String studentId, Model model) {
        model.addAttribute("userName", userName);
        model.addAttribute("studentId", studentId);
        model.addAttribute("logout", "logoutSecond");
        return "modules/exam/questions";
    }

}
