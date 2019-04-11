/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.etycx.marry">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.record.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etycx.marry.modules.question.entity.ExamQuestion;
import com.etycx.marry.modules.question.service.ExamQuestionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.etycx.marry.common.config.Global;
import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.web.BaseController;
import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.modules.record.entity.ExamRecord;
import com.etycx.marry.modules.record.service.ExamRecordService;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 答题记录Controller
 * @author 武海升
 * @version 2019-04-10
 */
@Controller
@RequestMapping(value = "${adminPath}/record/examRecord")
public class ExamRecordController extends BaseController {

	@Autowired
	private ExamRecordService examRecordService;
	@Autowired
	private ExamQuestionService questionService;
	
	@ModelAttribute
	public ExamRecord get(@RequestParam(required=false) String id) {
		ExamRecord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examRecordService.get(id);
		}
		if (entity == null){
			entity = new ExamRecord();
		}
		return entity;
	}
	
	@RequiresPermissions("record:examRecord:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExamRecord examRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExamRecord> page = examRecordService.findPage(new Page<ExamRecord>(request, response), examRecord); 
		model.addAttribute("page", page);
		return "modules/record/examRecordList";
	}

	@RequiresPermissions("record:examRecord:view")
	@RequestMapping(value = "form")
	public String form(ExamRecord examRecord, Model model) {
		model.addAttribute("examRecord", examRecord);
		return "modules/record/examRecordForm";
	}

	@RequiresPermissions("record:examRecord:view")
	@RequestMapping(value = "examRecordForm")
	public String examRecordForm(ExamRecord examRecord, Model model) {
		String[] questionIdList = examRecord.getQuestionIds().split(",");
		List<ExamQuestion> questionList =  questionService.findQuestionByIds(questionIdList);
		List<ExamQuestion> questions = new ArrayList<>(questionIdList.length);

		for (String questionId : questionIdList) {
			for (ExamQuestion question : questionList) {
				if(questionId.equals(question.getId())){
					questions.add(question);
					break;
				}
			}
		}


		model.addAttribute("questions", questions.stream()
				.map(ExamQuestion::toMap)
				.collect(Collectors.toList()));
		model.addAttribute("examRecord", examRecord);
		return "modules/record/examRecordForm";
	}

	@RequiresPermissions("record:examRecord:edit")
	@RequestMapping(value = "save")
	public String save(ExamRecord examRecord, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examRecord)){
			return form(examRecord, model);
		}
		examRecordService.save(examRecord);
		addMessage(redirectAttributes, "保存答题记录成功");
		return "redirect:"+Global.getAdminPath()+"/record/examRecord/?repage";
	}
	
	@RequiresPermissions("record:examRecord:edit")
	@RequestMapping(value = "delete")
	public String delete(ExamRecord examRecord, RedirectAttributes redirectAttributes) {
		examRecordService.delete(examRecord);
		addMessage(redirectAttributes, "删除答题记录成功");
		return "redirect:"+Global.getAdminPath()+"/record/examRecord/?repage";
	}

}