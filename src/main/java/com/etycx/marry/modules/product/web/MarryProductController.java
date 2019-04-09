/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.product.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.etycx.marry.common.config.ConfigConstants;
import com.etycx.marry.common.config.Global;
import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.utils.FileUtils;
import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.common.web.BaseController;
import com.etycx.marry.modules.SuccessCase.entity.SuccessCase;
import com.etycx.marry.modules.SuccessCase.service.MarrySuccessService;
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

import com.etycx.marry.modules.product.entity.MarryProduct;
import com.etycx.marry.modules.product.service.MarryProductService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 内容Controller
 * @author 武海升
 * @version 2019-03-08
 */
@Controller
@RequestMapping(value = "${adminPath}/product/marryProduct")
public class MarryProductController extends BaseController {

	@Autowired
	private MarryProductService marryProductService;

	@Autowired
	private MarryDictService marryDictService;


	
	@ModelAttribute
	public MarryProduct get(@RequestParam(required=false) String id) {
		MarryProduct entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = marryProductService.get(id);
		}
		if (entity == null){
			entity = new MarryProduct();
		}
		return entity;
	}
	
	@RequiresPermissions("product:marryProduct:view")
	@RequestMapping(value = {"list", ""})
	public String list(MarryProduct marryProduct, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MarryProduct> page = marryProductService.findPage(new Page<MarryProduct>(request, response), marryProduct);
		model.addAttribute("page", page);
		return "modules/product/marryProductList";
	}

	@RequiresPermissions("product:marryProduct:view")
	@RequestMapping(value = "form")
	public String form(MarryProduct marryProduct, Model model) {
		StringBuilder marryDictIds = new StringBuilder();
		List<Map<String,Object>> resultList = new ArrayList<>();
		List<MarryDict> marryDictList = marryDictService.findList(new MarryDict(marryProduct.getType(),0));
		for (MarryDict marryDict : marryDictList) {
			Map<String,Object> map = new HashMap<>(2);
			map.put("valueName",marryDict.getLabel());
			map.put("marryDictId","marryDictId_"+marryDict.getId());
			marryDictIds.append("marryDictId_"+marryDict.getId()).append(";");
			List<MarryDict> valueList = marryDictService.findList(new MarryDict(marryProduct.getType(),Integer.parseInt(marryDict.getId())));
			List<Map<String,Object>> mapList = new ArrayList<>();
			for (MarryDict dict : valueList) {
				String selected = "";
				if(StringUtils.isNotBlank(marryProduct.getDictIds())){
					String[] split = marryProduct.getDictIds().split(",");
					for (String str : split) {
						if(str.equals(dict.getId())){
							selected = "selected = \"selected\"";
							break;
						}
					}
				}
				Map<String,Object> dictMap = new HashMap<>(2);
				dictMap.put("strName","<option value=\""+dict.getId()+"\"  "+selected+">"+dict.getLabel()+"</option>");
				mapList.add(dictMap);
			}
			map.put("valueList",mapList);
			resultList.add(map);
		}
		model.addAttribute("marryDictList", resultList);
		String ids = marryDictIds.toString();
		if(StringUtils.isNotBlank(ids)){
			ids = ids.substring(0,ids.length()-1);
		}
		if(StringUtils.isBlank(marryProduct.getId())){
			marryProduct.setTopOn(0);
			marryProduct.setShowState(0);
		}else {
			//获取图片
			String picPath = marryProduct.getPicPath();
			if(StringUtils.isNotBlank(picPath)){
				List<String> pictureAlbumList = new ArrayList<>();
				String[] split = picPath.split(";");
				for (String s : split) {
					pictureAlbumList.add(s);
				}
				model.addAttribute("projectAlbum", pictureAlbumList);
			}
		}
		model.addAttribute("marryProduct", marryProduct);
		model.addAttribute("dictIds", ids);
		return "modules/product/marryProductForm";
	}

	@RequiresPermissions("product:marryProduct:edit")
	@RequestMapping(value = "save")
	public String save(MarryProduct marryProduct, Model model, RedirectAttributes redirectAttributes) {
		marryProduct.setContent(StringEscapeUtils.unescapeHtml4( marryProduct.getContent()));
		marryProduct.setStory(StringEscapeUtils.unescapeHtml4( marryProduct.getStory()));
		marryProduct.setSpecification(StringEscapeUtils.unescapeHtml4( marryProduct.getSpecification()));
		marryProductService.save(marryProduct);
		addMessage(redirectAttributes, "保存内容成功");
		return "redirect:"+ Global.getAdminPath()+"/product/marryProduct/list?type="+marryProduct.getType();
	}
	
	@RequiresPermissions("product:marryProduct:edit")
	@RequestMapping(value = "delete")
	public String delete(MarryProduct marryProduct, RedirectAttributes redirectAttributes) {
		marryProductService.delete(marryProduct);
		addMessage(redirectAttributes, "删除内容成功");
		return "redirect:"+ Global.getAdminPath()+"/product/marryProduct/list?type="+marryProduct.getType();
	}

	/**
	 * @author 武海升
	 * @desc 上传封面图
	 * @param file 文件
	 */
	@RequestMapping(value = "coverPicUpload")
	@ResponseBody
	public String coverPicUpload(MultipartFile file) {
		JSONObject jsonObject = FileUtils.setFilenamePath(file, ConfigConstants.MARRY_PRODUCT_COVER);
		//上传图片
		FileUtils.uploadFile(file,jsonObject.getString("filenamePath"));
		return jsonObject.getString("returnFilenamePath");
	}

	/**
	 * @author 武海升
	 * @desc 上传商品图片
	 * @param files 文件集
	 */
	@RequestMapping(value = "commodityUrlPicUpload")
	@ResponseBody
	public String commodityUrlPicUpload(@RequestParam(value = "imgFile", required = false) MultipartFile[] files) {
		MultipartFile file = null;
		if (files != null && files.length > 0) {
			for (int i = 0; i < files.length; i++) {
				file = files[i];
			}
		}
		JSONObject jsonObject = FileUtils.setFilenamePath(file, ConfigConstants.MARRY_PRODUCT_LIST_COVER);
		//上传图片
		FileUtils.uploadFile(file,jsonObject.getString("filenamePath"));
		return jsonObject.getString("returnFilenamePath");
	}

	@ResponseBody
	@RequestMapping(value="/upload/images")
	public Map<String, Object> images (MultipartFile upfile){
		return uploadImages(upfile);
	}

}