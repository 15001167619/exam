/**
 * Copyright &copy; 2012-2013 <a href="httparamMap://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.sys.service;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.common.utils.DateUtils;
import com.etycx.marry.modules.sys.dao.LogDao;
import com.etycx.marry.modules.sys.entity.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 日志Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class LogService extends CrudService<LogDao, Log> {

	public Page<Log> findPage(Page<Log> page, Log log) {
		
		// 设置默认时间范围，默认当前月
		if (log.getBeginDate() == null){
			log.setBeginDate(DateUtils.setDays(DateUtils.parseDate(DateUtils.getDate()), 1));
		}
		if (log.getEndDate() == null){
			log.setEndDate(DateUtils.addMonths(log.getBeginDate(), 1));
		}
		
		return super.findPage(page, log);
		
	}
	
}
