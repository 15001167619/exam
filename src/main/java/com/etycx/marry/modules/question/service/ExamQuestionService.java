/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.question.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.question.entity.ExamQuestion;
import com.etycx.marry.modules.question.dao.ExamQuestionDao;

/**
 * 试题管理Service
 * @author 武海升
 * @version 2019-04-10
 */
@Service
@Transactional(readOnly = true)
public class ExamQuestionService extends CrudService<ExamQuestionDao, ExamQuestion> {

	public ExamQuestion get(String id) {
		return super.get(id);
	}
	
	public List<ExamQuestion> findList(ExamQuestion examQuestion) {
		return super.findList(examQuestion);
	}
	
	public Page<ExamQuestion> findPage(Page<ExamQuestion> page, ExamQuestion examQuestion) {
		return super.findPage(page, examQuestion);
	}
	
	@Transactional(readOnly = false)
	public void save(ExamQuestion examQuestion) {
		super.save(examQuestion);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExamQuestion examQuestion) {
		super.delete(examQuestion);
	}

	public List<Integer> getQuestionIds(Map<String,Object> map) {
		return dao.getQuestionIds(map);
	}

	public List<ExamQuestion> findExamQuestionByIds(List<Integer> ids) {
		return dao.findExamQuestionByIds(ids);
	}
}