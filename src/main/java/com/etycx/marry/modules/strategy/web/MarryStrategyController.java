/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.etycx.marry">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.strategy.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etycx.marry.common.config.ConfigConstants;
import com.etycx.marry.modules.baidu.ueditor.common.RandomUtils;
import com.etycx.marry.modules.dict.entity.MarryDict;
import com.etycx.marry.modules.dict.service.MarryDictService;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.etycx.marry.common.config.Global;
import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.web.BaseController;
import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.modules.strategy.entity.MarryStrategy;
import com.etycx.marry.modules.strategy.service.MarryStrategyService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 推荐攻略Controller
 * @author 武海升
 * @version 2019-04-04
 */
@Controller
@RequestMapping(value = "${adminPath}/strategy/marryStrategy")
public class MarryStrategyController extends BaseController {

	@Autowired
	private MarryStrategyService marryStrategyService;

	@Autowired
	private MarryDictService marryDictService;
	
	@ModelAttribute
	public MarryStrategy get(@RequestParam(required=false) String id) {
		MarryStrategy entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = marryStrategyService.get(id);
		}
		if (entity == null){
			entity = new MarryStrategy();
		}
		return entity;
	}
	
	@RequiresPermissions("strategy:marryStrategy:view")
	@RequestMapping(value = {"list", ""})
	public String list(MarryStrategy marryStrategy, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MarryStrategy> page = marryStrategyService.findPage(new Page<MarryStrategy>(request, response), marryStrategy); 
		model.addAttribute("page", page);
		return "modules/strategy/marryStrategyList";
	}

	@RequiresPermissions("strategy:marryStrategy:view")
	@RequestMapping(value = "form")
	public String form(MarryStrategy marryStrategy, Model model) {

		List<MarryDict> marryDictList = marryDictService.findList(new MarryDict(8,0));
		List<Map<String,Object>> mapList = new ArrayList<>();
		for (MarryDict dict : marryDictList) {
			Map<String,Object> dictMap = new HashMap<>(2);
			dictMap.put("id",dict.getId());
			dictMap.put("name",dict.getLabel());
			mapList.add(dictMap);
		}
		if(StringUtils.isBlank(marryStrategy.getId())){
			marryStrategy.setSort(0);
		}
		model.addAttribute("marryStrategy", marryStrategy);
		model.addAttribute("mapList", mapList);
		return "modules/strategy/marryStrategyForm";
	}

	@RequiresPermissions("strategy:marryStrategy:edit")
	@RequestMapping(value = "save")
	public String save(MarryStrategy marryStrategy, Model model, RedirectAttributes redirectAttributes) {
        marryStrategy.setContent(StringEscapeUtils.unescapeHtml4( marryStrategy.getContent()));
		marryStrategyService.save(marryStrategy);
		addMessage(redirectAttributes, "保存推荐攻略成功");
		return "redirect:"+Global.getAdminPath()+"/strategy/marryStrategy/?repage";
	}
	
	@RequiresPermissions("strategy:marryStrategy:edit")
	@RequestMapping(value = "delete")
	public String delete(MarryStrategy marryStrategy, RedirectAttributes redirectAttributes) {
		marryStrategyService.delete(marryStrategy);
		addMessage(redirectAttributes, "删除推荐攻略成功");
		return "redirect:"+Global.getAdminPath()+"/strategy/marryStrategy/?repage";
	}

	@ResponseBody
	@RequestMapping(value="/upload/images")
	public Map<String, Object> images (MultipartFile upfile){
		return uploadImages(upfile);
	}

}