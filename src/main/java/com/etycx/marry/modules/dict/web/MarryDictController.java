/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.dict.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etycx.marry.common.config.Global;
import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.utils.IdGen;
import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.common.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.etycx.marry.modules.dict.entity.MarryDict;
import com.etycx.marry.modules.dict.service.MarryDictService;

/**
 * 内容Controller
 * @author 武海升
 * @version 2019-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/dict/marryDict")
public class MarryDictController extends BaseController {

	@Autowired
	private MarryDictService marryDictService;
	
	@ModelAttribute
	public MarryDict get(@RequestParam(required=false) String id) {
		MarryDict entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = marryDictService.get(id);
		}
		if (entity == null){
			entity = new MarryDict();
		}
		return entity;
	}
	
	@RequiresPermissions("dict:marryDict:view")
	@RequestMapping(value = {"list", ""})
	public String list(MarryDict marryDict, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MarryDict> page = marryDictService.findPage(new Page<MarryDict>(request, response), marryDict);
		model.addAttribute("page", page);
		return "modules/dict/marryDictList";
	}

	@RequiresPermissions("dict:marryDict:view")
	@RequestMapping(value = "form")
	public String form(MarryDict marryDict, Model model) {
		model.addAttribute("marryDict", marryDict);
		return "modules/dict/marryDictForm";
	}

	@RequiresPermissions("dict:marryDict:view")
	@RequestMapping(value = "labelForm")
	public String labelForm(MarryDict marryDict, Model model) {
		model.addAttribute("marryDict", marryDict);
		return "modules/dict/marryLabelDictForm";
	}

	@RequiresPermissions("dict:marryDict:edit")
	@RequestMapping(value = "save")
	public String save(MarryDict marryDict, Model model, RedirectAttributes redirectAttributes) {
		if(StringUtils.isBlank(marryDict.getId())){
			marryDict.setValue(IdGen.uuid());
			if(StringUtils.isBlank(marryDict.getCategory())){
				marryDict.setCategory(IdGen.uuid());
			}
		}
		marryDictService.save(marryDict);
		addMessage(redirectAttributes, "保存字典数据成功");
		return "redirect:"+ Global.getAdminPath()+"/dict/marryDict/list?type="+marryDict.getType();
	}
	
	@RequiresPermissions("dict:marryDict:edit")
	@RequestMapping(value = "delete")
	public String delete(MarryDict marryDict, RedirectAttributes redirectAttributes) {
		marryDictService.delete(marryDict);
		addMessage(redirectAttributes, "删除字典数据成功");
		return "redirect:"+ Global.getAdminPath()+"/dict/marryDict/list?type="+marryDict.getType();
	}

}