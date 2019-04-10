package com.etycx.marry.exam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


@Controller
public class ExamController {

    @RequestMapping(value = "communistYouthLeague")
    public String loginIndexFirst() {
        return "modules/exam/indexFirst";
    }

    @RequestMapping(value = "youngPioneers")
    public String loginIndexSecond() {
        return "modules/exam/indexSecond";
    }

    @RequestMapping(value = "questions")
    public String loginFirst(String userName, String studentId,String company, String scene, Integer useType,Model model) {
        setUserInfo(userName,studentId,company,scene,model);
        String examName = getExamName();
        String groupName = "中学组";
        if(useType == 2){
            groupName = "小学组";
        }
        model.addAttribute("examName", "2019年房山区教育系统团队课比赛理论考试("+groupName+examName+"卷）");
        model.addAttribute("logout", "logoutFirst");
        return "modules/exam/questions";
    }

    @RequestMapping(value = "logoutFirst")
    public String logoutFirst() {
        return "redirect:communistYouthLeague";
    }

    @RequestMapping(value = "logoutSecond")
    public String logoutSecond() {
        return "redirect:youngPioneers";
    }

    @RequestMapping(value = "loginSecond")
    public String loginSecond(String userName, String studentId,String company, String scene, Model model) {
        setUserInfo(userName,studentId,company,scene,model);
        String examName = getExamName();
        model.addAttribute("examName", "2019年房山区教育系统团队课比赛理论考试(小学组"+examName+"卷）");
        model.addAttribute("logout", "logoutSecond");
        return "modules/exam/questions";
    }


    //开始随机获取试卷
    private void setUserInfo(String userName, String studentId,String company, String scene,Model model){
        model.addAttribute("userName", userName);
        model.addAttribute("studentId", studentId);
        model.addAttribute("company", company);
        model.addAttribute("scene", scene);
    }

    //开始随机获取试卷
    private String getExamName(){
        List<String> list = new ArrayList<>(5);
        list.add("A");
        list.add("B");
        list.add("C");
        list.add("D");
        list.add("E");
        Collections.shuffle(list);
        Collections.shuffle(list);
        Collections.shuffle(list);
        return list.get(0);
    }

}
