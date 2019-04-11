package com.etycx.marry.exam;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.modules.question.entity.ExamQuestion;
import com.etycx.marry.modules.question.service.ExamQuestionService;
import com.etycx.marry.modules.record.entity.ExamRecord;
import com.etycx.marry.modules.record.service.ExamRecordService;
import com.etycx.marry.modules.reply.entity.ExamReply;
import com.etycx.marry.modules.reply.service.ExamReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;
import java.util.stream.Collectors;


@Controller
public class ExamController {

    @Autowired
    private ExamQuestionService examQuestionService;
    @Autowired
    private ExamReplyService examReplyService;
    @Autowired
    private ExamRecordService examRecordService;

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
        if(StringUtils.isBlank(userName) || StringUtils.isBlank(studentId) || StringUtils.isBlank(company) || StringUtils.isBlank(scene)){
            return "redirect:a";
        }
        setUserInfo(userName,studentId,company,scene,model);
        String examName = getExamName();
        String groupName = "中学组";
        String logout = "logoutFirst";
        if(useType == 2){
            groupName = "小学组";
            logout = "logoutSecond";
        }
        model.addAttribute("examQuestions", getExamQuestions(examName, useType));
        model.addAttribute("exam", "2019年房山区教育系统团队课比赛理论考试("+groupName+examName+"卷）");
        model.addAttribute("examName", examName);
        model.addAttribute("logout", logout);
        model.addAttribute("useType", useType);
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
        searchMap.put("paperType",examName);
        searchMap.put("useType",useType);
        List<Integer> ids = examQuestionService.getQuestionIds(searchMap);
        Collections.shuffle(ids);
        Collections.shuffle(ids);
        Collections.shuffle(ids);
        if(ids.size()>0){
            List<ExamQuestion> examQuestionList = examQuestionService.findExamQuestionByIds(ids);
            List<Map<String, Object>> resultMap = examQuestionList
                    .stream()
                    .map(ExamQuestion::toMap)
                    .collect(Collectors.toList());
            map.put("questionIds",ids.stream()
                    .map(questionId -> questionId + "")
                    .collect(Collectors.joining(",")));
            map.put("questionList",resultMap);
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "addExamReply", method = RequestMethod.POST)
    public Object addExamReply(String userExamReplyArray,String studentId,String paperId,String questionIds,Integer useType,String userName,String company,String scene){
        try {
            JSONArray examReplyArray = JSONObject.parseArray(userExamReplyArray);
            List<ExamReply> examReplyList = getExamReplyList(examReplyArray);
            long scoreSum = examReplyList.stream().collect(Collectors.summingInt(ExamReply::getScore));
            long correctSum = examReplyList.stream().collect(Collectors.summingInt(ExamReply::getCorrect));
            long errorSum = examReplyList.size()-correctSum;
            examReplyService.saveReplyList(examReplyList);
            examRecordService.save(new ExamRecord(studentId,paperId,useType,userName,company,scene,questionIds,scoreSum,correctSum,errorSum));
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    private List<ExamReply> getExamReplyList(JSONArray jsonArray){
        List<ExamReply> list = new ArrayList<>(40);
        for (Object object : jsonArray) {
            JSONObject jsonObject = (JSONObject)object;
            list.add(new ExamReply(jsonObject));
        }
        return list;
    }

}
