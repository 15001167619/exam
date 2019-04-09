/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.banner.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.banner.entity.MarryBanner;

/**
 * 轮播图DAO接口
 * @author 武海升
 * @version 2019-03-11
 */
@MyBatisDao
public interface MarryBannerDao extends CrudDao<MarryBanner> {
	
}