/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.record.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.record.entity.ExamRecord;

/**
 * 答题记录DAO接口
 * @author 武海升
 * @version 2019-04-10
 */
@MyBatisDao
public interface ExamRecordDao extends CrudDao<ExamRecord> {
	
}