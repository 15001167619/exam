package com.etycx.marry.modules.Recruitment.web;


import com.etycx.marry.modules.Recruitment.entity.Recruitment;
import com.etycx.marry.modules.Recruitment.service.MarryRecruitmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "${frontPath}/jxweb")
public class RecruitmentController {

    @Autowired
    private MarryRecruitmentService marryRecruitmentService;

    @RequestMapping(value="Joinussocial")
    public String toJoinussocial(int page,int state,Model model){
        int pageSize=10;
        List<Recruitment> recruitmentList=marryRecruitmentService.selectRecruitment(state,page,pageSize);
        List<Integer> integers=marryRecruitmentService.countByType(state);
        model.addAttribute("page",page);
        model.addAttribute("integers",integers);
        model.addAttribute("num",integers.size()-1);
        model.addAttribute("recruitmentList",recruitmentList);
        if(state==1){
            return "modules/jxweb/Joinussocial";
        }else {
            return "modules/jxweb/campus";
        }

    }


    @RequestMapping(value="corporatewelfare")
    public String toCorporatewelfare(Model model){
        return "modules/jxweb/corporatewelfare";
    }
}
