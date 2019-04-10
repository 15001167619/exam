/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.reply.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.reply.entity.ExamReply;
import com.etycx.marry.modules.reply.dao.ExamReplyDao;

/**
 * 我的回答Service
 * @author 武海升
 * @version 2019-04-10
 */
@Service
@Transactional(readOnly = true)
public class ExamReplyService extends CrudService<ExamReplyDao, ExamReply> {

	public ExamReply get(String id) {
		return super.get(id);
	}
	
	public List<ExamReply> findList(ExamReply examReply) {
		return super.findList(examReply);
	}
	
	public Page<ExamReply> findPage(Page<ExamReply> page, ExamReply examReply) {
		return super.findPage(page, examReply);
	}
	
	@Transactional(readOnly = false)
	public void save(ExamReply examReply) {
		super.save(examReply);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExamReply examReply) {
		super.delete(examReply);
	}
	
}