/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.question.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.question.entity.ExamQuestion;

/**
 * 试题管理DAO接口
 * @author 武海升
 * @version 2019-04-10
 */
@MyBatisDao
public interface ExamQuestionDao extends CrudDao<ExamQuestion> {
	
}