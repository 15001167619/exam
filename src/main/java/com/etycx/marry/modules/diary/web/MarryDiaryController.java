/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.diary.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.etycx.marry.common.config.ConfigConstants;
import com.etycx.marry.common.config.Global;
import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.utils.FileUtils;
import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.common.web.BaseController;
import org.apache.commons.lang3.StringEscapeUtils;
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

import com.etycx.marry.modules.diary.entity.MarryDiary;
import com.etycx.marry.modules.diary.service.MarryDiaryService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 内容Controller
 * @author 武海升
 * @version 2019-03-06
 */
@Controller
@RequestMapping(value = "${adminPath}/diary/marryDiary")
public class MarryDiaryController extends BaseController {

	@Autowired
	private MarryDiaryService marryDiaryService;
	
	@ModelAttribute
	public MarryDiary get(@RequestParam(required=false) String id) {
		MarryDiary entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = marryDiaryService.get(id);
		}
		if (entity == null){
			entity = new MarryDiary();
		}
		return entity;
	}
	
	@RequiresPermissions("diary:marryDiary:view")
	@RequestMapping(value = {"list", ""})
	public String list(MarryDiary marryDiary, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MarryDiary> page = marryDiaryService.findPage(new Page<>(request, response), marryDiary);
		model.addAttribute("page", page);
		return "modules/diary/marryDiaryList";
	}

	@RequiresPermissions("diary:marryDiary:view")
	@RequestMapping(value = "form")
	public String form(MarryDiary marryDiary, Model model) {
		if(StringUtils.isNotBlank(marryDiary.getId())){
			//获取图片
			String picPath = marryDiary.getCoverPath();
			if(StringUtils.isNotBlank(picPath)){
				List<String> pictureAlbumList = new ArrayList<>();
				String[] split = picPath.split(";");
				for (String s : split) {
					pictureAlbumList.add(s);
				}
				model.addAttribute("projectAlbum", pictureAlbumList);
			}
		}
		model.addAttribute("marryDiary", marryDiary);
		return "modules/diary/marryDiaryForm";
	}

	@RequiresPermissions("diary:marryDiary:edit")
	@RequestMapping(value = "save")
	public String save(MarryDiary marryDiary, Model model, RedirectAttributes redirectAttributes) {
		marryDiary.setContent(StringEscapeUtils.unescapeHtml4( marryDiary.getContent()));
		marryDiaryService.save(marryDiary);
		addMessage(redirectAttributes, "保存内容成功");
		return "redirect:"+ Global.getAdminPath()+"/diary/marryDiary/list?type="+marryDiary.getType();
	}
	
	@RequiresPermissions("diary:marryDiary:edit")
	@RequestMapping(value = "delete")
	public String delete(MarryDiary marryDiary, RedirectAttributes redirectAttributes) {
		marryDiaryService.delete(marryDiary);
		addMessage(redirectAttributes, "删除内容成功");
		return "redirect:"+ Global.getAdminPath()+"/diary/marryDiary/list?type="+marryDiary.getType();
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
		JSONObject jsonObject = FileUtils.setFilenamePath(file, ConfigConstants.DIARY_COVER);
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