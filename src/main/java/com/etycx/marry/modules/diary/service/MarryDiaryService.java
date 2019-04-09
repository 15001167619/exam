/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.diary.service;

import java.util.*;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.modules.sys.utils.UserUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etycx.marry.modules.diary.entity.MarryDiary;
import com.etycx.marry.modules.diary.dao.MarryDiaryDao;

/**
 * 内容Service
 * @author 武海升
 * @version 2019-03-06
 */
@Service
@Transactional(readOnly = true)
public class MarryDiaryService extends CrudService<MarryDiaryDao, MarryDiary> {

	public MarryDiary get(String id) {
		return super.get(id);
	}
	
	public List<MarryDiary> findList(MarryDiary marryDiary) {
		return super.findList(marryDiary);
	}
	
	public Page<MarryDiary> findPage(Page<MarryDiary> page, MarryDiary marryDiary) {
		return super.findPage(page, marryDiary);
	}
	
	@Transactional(readOnly = false)
	public void save(MarryDiary marryDiary) {
		if(StringUtils.isBlank(marryDiary.getId())){
			marryDiary.setCreateTime(new Date());
			marryDiary.setUpdateTime(new Date());
		}else {
			marryDiary.setUpdateTime(new Date());
			marryDiary.setUpdateUserId(UserUtils.getUser().getId());
		}
		super.save(marryDiary);
	}
	
	@Transactional(readOnly = false)
	public void delete(MarryDiary marryDiary) {
		super.delete(marryDiary);
	}

	public int countDiary(Map<String, Object> searchMap) {
		return dao.countDiary(searchMap);
	}

	public List<MarryDiary> selectDiaryList(Map<String, Object> searchMap) {
		return dao.selectDiaryList(searchMap);
	}

    public Map<String, Object> getDiaryList(Integer type,Integer pageNo,Integer pageSize) {
		Map<String, Object> resultMap = new HashMap<>(2);
		Map<String, Object> searchMap = new HashMap<>(1);
		searchMap.put("type",type);
		int sumCount = dao.countDiary(searchMap);
		Map<String, Object> pageDiaryMap = pagingPageCount(sumCount, pageNo, pageSize);
		resultMap.put("pageDiary", pageDiaryMap);
		searchMap.put("pageSize", pageSize);
		searchMap.put("pageNo",pageDiaryMap.get("pageNo"));
		List<MarryDiary> diaryList = dao.selectDiaryList(searchMap);
		List<Map<String,Object>> diaryListMap = new ArrayList<>();
		for (MarryDiary marryDiary : diaryList) {
			Map<String,Object> marryDiaryMap = new HashMap<>(3);
			marryDiaryMap.put("id",marryDiary.getId());
			marryDiaryMap.put("name",marryDiary.getName());
			marryDiaryMap.put("brief",StringUtils.isBlank(marryDiary.getBrief())?"":marryDiary.getBrief());
			if(type==0){
				String picPath = marryDiary.getCoverPath();
				List<Map<String,Object>> diaryPicListMap = new ArrayList<>();
				if(StringUtils.isNotBlank(picPath)){
					String[] split = picPath.split(";");
					for (String s : split) {
						Map<String,Object> marryPicMap = new HashMap<>(1);
						marryPicMap.put("bannerPicPath",s);
						diaryPicListMap.add(marryPicMap);
					}
				}
				marryDiaryMap.put("diaryPicList",diaryPicListMap);
			}else {
				marryDiaryMap.put("bannerPicPath","");
				String picPath = marryDiary.getCoverPath();
				if(StringUtils.isNotBlank(picPath)){
					String[] split = picPath.split(";");
					if(split.length>=1){
						marryDiaryMap.put("bannerPicPath",split[0]);
					}

				}
			}
			diaryListMap.add(marryDiaryMap);
		}
		resultMap.put("diaryList", diaryListMap);

		return resultMap;


    }




	public List<MarryDiary> getTopDiaryList(Map<String, Object> map) {
		return dao.getTopDiaryList(map);
	}

	public List<MarryDiary> getNextDiaryList(Map<String, Object> map) {
		return dao.getNextDiaryList(map);
	}
}