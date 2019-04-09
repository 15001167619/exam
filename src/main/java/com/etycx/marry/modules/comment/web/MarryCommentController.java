/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.etycx.marry">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.comment.web;

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
import com.etycx.marry.modules.comment.entity.MarryComment;
import com.etycx.marry.modules.comment.service.MarryCommentService;

/**
 * commentController
 * @author 武海升
 * @version 2019-04-01
 */
@Controller
@RequestMapping(value = "${adminPath}/comment/marryComment")
public class MarryCommentController extends BaseController {

	@Autowired
	private MarryCommentService marryCommentService;
	
	@ModelAttribute
	public MarryComment get(@RequestParam(required=false) String id) {
		MarryComment entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = marryCommentService.get(id);
		}
		if (entity == null){
			entity = new MarryComment();
		}
		return entity;
	}
	
	@RequiresPermissions("comment:marryComment:view")
	@RequestMapping(value = {"list", ""})
	public String list(MarryComment marryComment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MarryComment> page = marryCommentService.findPage(new Page<MarryComment>(request, response), marryComment); 
		model.addAttribute("page", page);
		return "modules/comment/marryCommentList";
	}

	@RequiresPermissions("comment:marryComment:view")
	@RequestMapping(value = "form")
	public String form(MarryComment marryComment, Model model) {
		model.addAttribute("marryComment", marryComment);
		return "modules/comment/marryCommentForm";
	}

	@RequiresPermissions("comment:marryComment:edit")
	@RequestMapping(value = "save")
	public String save(MarryComment marryComment, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, marryComment)){
			return form(marryComment, model);
		}
		marryCommentService.save(marryComment);
		addMessage(redirectAttributes, "保存comment成功");
		return "redirect:"+Global.getAdminPath()+"/comment/marryComment/?repage";
	}
	
	@RequiresPermissions("comment:marryComment:edit")
	@RequestMapping(value = "delete")
	public String delete(MarryComment marryComment, RedirectAttributes redirectAttributes) {
		marryCommentService.delete(marryComment);
		addMessage(redirectAttributes, "删除comment成功");
		return "redirect:"+Global.getAdminPath()+"/comment/marryComment/?repage";
	}

}