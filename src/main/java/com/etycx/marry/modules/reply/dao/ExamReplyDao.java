/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.reply.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.reply.entity.ExamReply;

import java.util.List;

/**
 * 我的回答DAO接口
 * @author 武海升
 * @version 2019-04-10
 */
@MyBatisDao
public interface ExamReplyDao extends CrudDao<ExamReply> {

    int insertExamReply(List<ExamReply> list);
}