package com.etycx.marry.exam;

import com.etycx.marry.modules.question.entity.ExamQuestion;
import com.etycx.marry.modules.question.service.ExamQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;
import java.util.stream.Collectors;


@Controller
public class ExamController {

    @Autowired
    private ExamQuestionService examQuestionService;

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
        model.addAttribute("examQuestions", getExamQuestions(examName, useType));
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


    //设置答题人员信息
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

    //开始随机获取试题
    private Map<String, Object> getExamQuestions(String examName,Integer useType){
        Map<String,Object> map = new HashMap<>(2);
        Map<String,Object> searchMap = new HashMap<>(2);
        map.put("paperType",examName);
        map.put("useType",useType);
        List<Integer> ids = examQuestionService.getQuestionIds(searchMap);
        Collections.shuffle(ids);
        Collections.shuffle(ids);
        Collections.shuffle(ids);
        List<ExamQuestion> examQuestionList = examQuestionService.findExamQuestionByIds(ids);
        List<Map<String, Object>> resultMap = examQuestionList
                .stream()
                .map(ExamQuestion::toMap)
                .collect(Collectors.toList());
        map.put("questionIds",ids.stream()
                .map(questionId -> questionId + "")
                .collect(Collectors.joining(",")));
        map.put("questionList",resultMap);
        return map;
    }

}
