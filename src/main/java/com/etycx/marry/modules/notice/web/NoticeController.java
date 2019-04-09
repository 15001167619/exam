package com.etycx.marry.modules.notice.web;


import com.etycx.marry.modules.Recruitment.entity.Recruitment;
import com.etycx.marry.modules.Recruitment.service.MarryRecruitmentService;
import com.etycx.marry.modules.notice.entity.Notice;
import com.etycx.marry.modules.notice.service.MarryNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "${frontPath}/jxweb")
public class NoticeController {

    @Autowired
    private MarryNoticeService marryNoticeService;

    @RequestMapping(value="notice")
    public String toJoinussocial(int page,Model model){
        int pageSize=10;
        List<Notice> notices=marryNoticeService.selectNotice(page,pageSize);
        List<Integer> integers=marryNoticeService.countByType(1);
        model.addAttribute("page",page);
        model.addAttribute("integers",integers);
        model.addAttribute("num",integers.size()-1);
        model.addAttribute("notices",notices);
        return "modules/jxweb/noticelist";

    }

    @RequestMapping(value="noticeById")
    public String noticeById(int id,Model model){
        Notice notice=marryNoticeService.selectNoticeById(id);
        model.addAttribute("notice",notice);
        return "modules/jxweb/noticecontent";

    }

}
