/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.etycx.marry">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.user.controller;

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
import com.etycx.marry.modules.user.entity.MarryUser;
import com.etycx.marry.modules.user.service.MarryUserService;

/**
 * 用户信息Controller
 * @author 琚春波
 * @version 2019-04-02
 */
@Controller
@RequestMapping(value = "${adminPath}/user/marryUser")
public class MarryUserController extends BaseController {

	@Autowired
	private MarryUserService marryUserService;
	
	@ModelAttribute
	public MarryUser get(@RequestParam(required=false) String id) {
		MarryUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = marryUserService.get(id);
		}
		if (entity == null){
			entity = new MarryUser();
		}
		return entity;
	}
	
	@RequiresPermissions("user:marryUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(MarryUser marryUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MarryUser> page = marryUserService.findPage(new Page<MarryUser>(request, response), marryUser); 
		model.addAttribute("page", page);
		return "modules/user/marryUserList";
	}

	@RequiresPermissions("user:marryUser:view")
	@RequestMapping(value = "form")
	public String form(MarryUser marryUser, Model model) {
		model.addAttribute("marryUser", marryUser);
		return "modules/user/marryUserForm";
	}

	@RequiresPermissions("user:marryUser:edit")
	@RequestMapping(value = "save")
	public String save(MarryUser marryUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, marryUser)){
			return form(marryUser, model);
		}
		marryUserService.save(marryUser);
		addMessage(redirectAttributes, "保存会员成功");
		return "redirect:"+Global.getAdminPath()+"/user/marryUser/?repage";
	}
	
	@RequiresPermissions("user:marryUser:edit")
	@RequestMapping(value = "delete")
	public String delete(MarryUser marryUser, RedirectAttributes redirectAttributes) {
		marryUserService.delete(marryUser);
		addMessage(redirectAttributes, "删除会员成功");
		return "redirect:"+Global.getAdminPath()+"/user/marryUser/?repage";
	}

}