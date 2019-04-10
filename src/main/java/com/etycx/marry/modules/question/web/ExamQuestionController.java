/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.etycx.marry">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.question.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.etycx.marry.modules.question.entity.ExamQuestion;
import com.etycx.marry.modules.question.service.ExamQuestionService;

/**
 * 试题管理Controller
 * @author 武海升
 * @version 2019-04-10
 */
@Controller
@RequestMapping(value = "${adminPath}/question/examQuestion")
public class ExamQuestionController extends BaseController {

	@Autowired
	private ExamQuestionService examQuestionService;
	
	@ModelAttribute
	public ExamQuestion get(@RequestParam(required=false) String id) {
		ExamQuestion entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examQuestionService.get(id);
		}
		if (entity == null){
			entity = new ExamQuestion();
		}
		return entity;
	}
	
	@RequiresPermissions("question:examQuestion:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExamQuestion examQuestion, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExamQuestion> page = examQuestionService.findPage(new Page<ExamQuestion>(request, response), examQuestion); 
		model.addAttribute("page", page);
		return "modules/question/examQuestionList";
	}

	@RequiresPermissions("question:examQuestion:view")
	@RequestMapping(value = "form")
	public String form(ExamQuestion examQuestion, Model model) {
		model.addAttribute("examQuestion", examQuestion);
		return "modules/question/examQuestionForm";
	}

	@RequiresPermissions("question:examQuestion:edit")
	@RequestMapping(value = "save")
	public String save(ExamQuestion examQuestion, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examQuestion)){
			return form(examQuestion, model);
		}
		examQuestionService.save(examQuestion);
		addMessage(redirectAttributes, "保存试题成功");
		return "redirect:"+Global.getAdminPath()+"/question/examQuestion/?repage";
	}
	
	@RequiresPermissions("question:examQuestion:edit")
	@RequestMapping(value = "delete")
	public String delete(ExamQuestion examQuestion, RedirectAttributes redirectAttributes) {
		examQuestionService.delete(examQuestion);
		addMessage(redirectAttributes, "删除试题成功");
		return "redirect:"+Global.getAdminPath()+"/question/examQuestion/?repage";
	}

}