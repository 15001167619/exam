/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.etycx.marry">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.company.controller;

import com.etycx.marry.common.config.Global;
import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.common.web.BaseController;
import com.etycx.marry.modules.company.entity.MarryCompany;
import com.etycx.marry.modules.company.service.CompanyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 公司业务Controller
 * @author 琚春波
 * @version 2019-04-02
 */
@Controller
@RequestMapping(value = "${adminPath}/compony/marryCompany")
public class MarryCompanyController extends BaseController {

	@Autowired
	private CompanyService marryCompanyService;
	
	@ModelAttribute
	public MarryCompany get(@RequestParam(required=false) String id) {
		MarryCompany entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = marryCompanyService.get(id);
		}
		if (entity == null){
			entity = new MarryCompany();
		}
		return entity;
	}
	
	@RequiresPermissions("compony:marryCompany:view")
	@RequestMapping(value = {"list", ""})
	public String list(MarryCompany marryCompany, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MarryCompany> page = marryCompanyService.findPage(new Page<MarryCompany>(request, response), marryCompany);
		model.addAttribute("page", page);
		return "modules/compony/marryCompanyList";
	}

	@RequiresPermissions("compony:marryCompany:view")
	@RequestMapping(value = "form")
	public String form(MarryCompany marryCompany, Model model) {
		model.addAttribute("marryCompany", marryCompany);
		return "modules/compony/marryCompanyForm";
	}

	@RequiresPermissions("compony:marryCompany:edit")
	@RequestMapping(value = "save")
	public String save(MarryCompany marryCompany, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, marryCompany)){
			return form(marryCompany, model);
		}
		marryCompanyService.save(marryCompany);
		addMessage(redirectAttributes, "保存公司信息成功");
		return "redirect:"+Global.getAdminPath()+"/compony/marryCompany/?repage";
	}
	
	@RequiresPermissions("compony:marryCompany:edit")
	@RequestMapping(value = "delete")
	public String delete(MarryCompany marryCompany, RedirectAttributes redirectAttributes) {
		marryCompanyService.delete(marryCompany);
		addMessage(redirectAttributes, "删除公司信息成功");
		return "redirect:"+Global.getAdminPath()+"/compony/marryCompany/?repage";
	}

}