/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.record.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.record.entity.ExamRecord;
import com.etycx.marry.modules.record.dao.ExamRecordDao;

/**
 * 答题记录Service
 * @author 武海升
 * @version 2019-04-10
 */
@Service
@Transactional(readOnly = true)
public class ExamRecordService extends CrudService<ExamRecordDao, ExamRecord> {

	public ExamRecord get(String id) {
		return super.get(id);
	}
	
	public List<ExamRecord> findList(ExamRecord examRecord) {
		return super.findList(examRecord);
	}
	
	public Page<ExamRecord> findPage(Page<ExamRecord> page, ExamRecord examRecord) {
		return super.findPage(page, examRecord);
	}
	
	@Transactional(readOnly = false)
	public void save(ExamRecord examRecord) {
		super.save(examRecord);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExamRecord examRecord) {
		super.delete(examRecord);
	}
	
}