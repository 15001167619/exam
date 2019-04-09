/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.etycx.marry">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.operation.web;

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
import com.etycx.marry.modules.operation.entity.MarryOperation;
import com.etycx.marry.modules.operation.service.MarryOperationService;

/**
 * 用户操作Controller
 * @author 武海升
 * @version 2019-03-29
 */
@Controller
@RequestMapping(value = "${adminPath}/operation/marryOperation")
public class MarryOperationController extends BaseController {

	@Autowired
	private MarryOperationService marryOperationService;
	
	@ModelAttribute
	public MarryOperation get(@RequestParam(required=false) String id) {
		MarryOperation entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = marryOperationService.get(id);
		}
		if (entity == null){
			entity = new MarryOperation();
		}
		return entity;
	}
	
	@RequiresPermissions("operation:marryOperation:view")
	@RequestMapping(value = {"list", ""})
	public String list(MarryOperation marryOperation, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MarryOperation> page = marryOperationService.findPage(new Page<MarryOperation>(request, response), marryOperation); 
		model.addAttribute("page", page);
		return "modules/operation/marryOperationList";
	}

	@RequiresPermissions("operation:marryOperation:view")
	@RequestMapping(value = "form")
	public String form(MarryOperation marryOperation, Model model) {
		model.addAttribute("marryOperation", marryOperation);
		return "modules/operation/marryOperationForm";
	}

	@RequiresPermissions("operation:marryOperation:edit")
	@RequestMapping(value = "save")
	public String save(MarryOperation marryOperation, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, marryOperation)){
			return form(marryOperation, model);
		}
		marryOperationService.save(marryOperation);
		addMessage(redirectAttributes, "保存用户操作成功");
		return "redirect:"+Global.getAdminPath()+"/operation/marryOperation/?repage";
	}
	
	@RequiresPermissions("operation:marryOperation:edit")
	@RequestMapping(value = "delete")
	public String delete(MarryOperation marryOperation, RedirectAttributes redirectAttributes) {
		marryOperationService.delete(marryOperation);
		addMessage(redirectAttributes, "删除用户操作成功");
		return "redirect:"+Global.getAdminPath()+"/operation/marryOperation/?repage";
	}

}