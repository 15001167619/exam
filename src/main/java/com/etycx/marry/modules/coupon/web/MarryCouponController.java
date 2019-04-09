/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.etycx.marry">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.coupon.web;

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
import com.etycx.marry.modules.coupon.entity.MarryCoupon;
import com.etycx.marry.modules.coupon.service.MarryCouponService;

/**
 * couponController
 * @author 武海升
 * @version 2019-04-01
 */
@Controller
@RequestMapping(value = "${adminPath}/coupon/marryCoupon")
public class MarryCouponController extends BaseController {

	@Autowired
	private MarryCouponService marryCouponService;
	
	@ModelAttribute
	public MarryCoupon get(@RequestParam(required=false) String id) {
		MarryCoupon entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = marryCouponService.get(id);
		}
		if (entity == null){
			entity = new MarryCoupon();
		}
		return entity;
	}
	
	@RequiresPermissions("coupon:marryCoupon:view")
	@RequestMapping(value = {"list", ""})
	public String list(MarryCoupon marryCoupon, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MarryCoupon> page = marryCouponService.findPage(new Page<MarryCoupon>(request, response), marryCoupon); 
		model.addAttribute("page", page);
		return "modules/coupon/marryCouponList";
	}

	@RequiresPermissions("coupon:marryCoupon:view")
	@RequestMapping(value = "form")
	public String form(MarryCoupon marryCoupon, Model model) {
		model.addAttribute("marryCoupon", marryCoupon);
		return "modules/coupon/marryCouponForm";
	}

	@RequiresPermissions("coupon:marryCoupon:edit")
	@RequestMapping(value = "save")
	public String save(MarryCoupon marryCoupon, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, marryCoupon)){
			return form(marryCoupon, model);
		}
		marryCouponService.save(marryCoupon);
		addMessage(redirectAttributes, "保存coupon成功");
		return "redirect:"+Global.getAdminPath()+"/coupon/marryCoupon/?repage";
	}
	
	@RequiresPermissions("coupon:marryCoupon:edit")
	@RequestMapping(value = "delete")
	public String delete(MarryCoupon marryCoupon, RedirectAttributes redirectAttributes) {
		marryCouponService.delete(marryCoupon);
		addMessage(redirectAttributes, "删除coupon成功");
		return "redirect:"+Global.getAdminPath()+"/coupon/marryCoupon/?repage";
	}

	/**
	 * @author 武海升
	 * @desc 上传banner图
	 * @param file 文件
	 */
	@RequestMapping(value = "couponUpload")
	@ResponseBody
	public String coverPicUpload(MultipartFile file) {
		JSONObject jsonObject = FileUtils.setFilenamePath(file, ConfigConstants.COUPON_PATH);
		//上传图片
		FileUtils.uploadFile(file,jsonObject.getString("filenamePath"));
		return jsonObject.getString("returnFilenamePath");
	}

}