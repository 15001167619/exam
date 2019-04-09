/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.banner.service;

import java.util.Date;
import java.util.List;

import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.modules.sys.utils.UserUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.banner.entity.MarryBanner;
import com.etycx.marry.modules.banner.dao.MarryBannerDao;

/**
 * 轮播图Service
 * @author 武海升
 * @version 2019-03-11
 */
@Service
@Transactional(readOnly = true)
public class MarryBannerService extends CrudService<MarryBannerDao, MarryBanner> {

	public MarryBanner get(String id) {
		return super.get(id);
	}
	
	public List<MarryBanner> findList(MarryBanner marryBanner) {
		return super.findList(marryBanner);
	}
	
	public Page<MarryBanner> findPage(Page<MarryBanner> page, MarryBanner marryBanner) {
		return super.findPage(page, marryBanner);
	}
	
	@Transactional(readOnly = false)
	public void save(MarryBanner marryBanner) {
		if(StringUtils.isBlank(marryBanner.getId())){
			marryBanner.setCreateTime(new Date());
			marryBanner.setUpdateTime(new Date());
			marryBanner.setCreateUserId(UserUtils.getUser().getId());
			marryBanner.setUpdateUserId(UserUtils.getUser().getId());
		}else {
			marryBanner.setUpdateTime(new Date());
			marryBanner.setUpdateUserId(UserUtils.getUser().getId());
		}
		super.save(marryBanner);
	}
	
	@Transactional(readOnly = false)
	public void delete(MarryBanner marryBanner) {
		super.delete(marryBanner);
	}
	
}