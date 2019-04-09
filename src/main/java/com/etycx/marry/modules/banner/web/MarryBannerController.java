/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.etycx.marry">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.banner.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.etycx.marry.common.config.ConfigConstants;
import com.etycx.marry.common.utils.FileUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.etycx.marry.modules.banner.entity.MarryBanner;
import com.etycx.marry.modules.banner.service.MarryBannerService;

/**
 * 轮播图Controller
 * @author 武海升
 * @version 2019-03-11
 */
@Controller
@RequestMapping(value = "${adminPath}/banner/marryBanner")
public class MarryBannerController extends BaseController {

	@Autowired
	private MarryBannerService marryBannerService;
	
	@ModelAttribute
	public MarryBanner get(@RequestParam(required=false) String id) {
		MarryBanner entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = marryBannerService.get(id);
		}
		if (entity == null){
			entity = new MarryBanner();
		}
		return entity;
	}
	
	@RequiresPermissions("banner:marryBanner:view")
	@RequestMapping(value = {"list", ""})
	public String list(MarryBanner marryBanner, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MarryBanner> page = marryBannerService.findPage(new Page<MarryBanner>(request, response), marryBanner); 
		model.addAttribute("page", page);
		return "modules/banner/marryBannerList";
	}

	@RequiresPermissions("banner:marryBanner:view")
	@RequestMapping(value = "form")
	public String form(MarryBanner marryBanner, Model model) {
		model.addAttribute("marryBanner", marryBanner);
		return "modules/banner/marryBannerForm";
	}

	@RequiresPermissions("banner:marryBanner:edit")
	@RequestMapping(value = "save")
	public String save(MarryBanner marryBanner, Model model, RedirectAttributes redirectAttributes) {
		marryBannerService.save(marryBanner);
		addMessage(redirectAttributes, "保存轮播图成功");
		return "redirect:"+Global.getAdminPath()+"/banner/marryBanner/?repage";
	}
	
	@RequiresPermissions("banner:marryBanner:edit")
	@RequestMapping(value = "delete")
	public String delete(MarryBanner marryBanner, RedirectAttributes redirectAttributes) {
		marryBannerService.delete(marryBanner);
		addMessage(redirectAttributes, "删除轮播图成功");
		return "redirect:"+Global.getAdminPath()+"/banner/marryBanner/?repage";
	}

	/**
	 * @author 武海升
	 * @desc 上传banner图
	 * @param file 文件
	 */
	@RequestMapping(value = "bannerUpload")
	@ResponseBody
	public String coverPicUpload(MultipartFile file) {
		JSONObject jsonObject = FileUtils.setFilenamePath(file, ConfigConstants.BANNER_COVER);
		//上传图片
		FileUtils.uploadFile(file,jsonObject.getString("filenamePath"));
		return jsonObject.getString("returnFilenamePath");
	}

}