/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.etycx.marry">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.reply.web;

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
import com.etycx.marry.modules.reply.entity.ExamReply;
import com.etycx.marry.modules.reply.service.ExamReplyService;

/**
 * 我的回答Controller
 * @author 武海升
 * @version 2019-04-10
 */
@Controller
@RequestMapping(value = "${adminPath}/reply/examReply")
public class ExamReplyController extends BaseController {

	@Autowired
	private ExamReplyService examReplyService;
	
	@ModelAttribute
	public ExamReply get(@RequestParam(required=false) String id) {
		ExamReply entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examReplyService.get(id);
		}
		if (entity == null){
			entity = new ExamReply();
		}
		return entity;
	}
	
	@RequiresPermissions("reply:examReply:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExamReply examReply, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExamReply> page = examReplyService.findExamPage(new Page<ExamReply>(request, response), examReply);
		model.addAttribute("page", page);
		return "modules/reply/examReplyList";
	}

	@RequiresPermissions("reply:examReply:view")
	@RequestMapping(value = "form")
	public String form(ExamReply examReply, Model model) {
		model.addAttribute("examReply", examReply);
		return "modules/reply/examReplyForm";
	}

	@RequiresPermissions("reply:examReply:edit")
	@RequestMapping(value = "save")
	public String save(ExamReply examReply, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examReply)){
			return form(examReply, model);
		}
		examReplyService.save(examReply);
		addMessage(redirectAttributes, "保存我的回答成功");
		return "redirect:"+Global.getAdminPath()+"/reply/examReply/?repage";
	}
	
	@RequiresPermissions("reply:examReply:edit")
	@RequestMapping(value = "delete")
	public String delete(ExamReply examReply, RedirectAttributes redirectAttributes) {
		examReplyService.delete(examReply);
		addMessage(redirectAttributes, "删除我的回答成功");
		return "redirect:"+Global.getAdminPath()+"/reply/examReply/?repage";
	}

}