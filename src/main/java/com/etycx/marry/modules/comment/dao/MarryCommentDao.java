/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.comment.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.comment.entity.MarryComment;

import java.util.List;
import java.util.Map;

/**
 * commentDAO接口
 * @author 武海升
 * @version 2019-04-01
 */
@MyBatisDao
public interface MarryCommentDao extends CrudDao<MarryComment> {

    int countEvaluation(Map<String, Object> searchMap);

    List<MarryComment> findEvaluationList(Map<String, Object> searchMap);

    List<MarryComment> findGroupEvaluationList(Map<String, Object> searchMap);

    int countComment(Map<String, Object> searchMap);

    List<MarryComment> selectCommentList(Map<String, Object> searchMap);

    List<MarryComment> selectChildCommentList(Map<String, Object> searchChildMap);

    int selectChildCommentCount(Map<String, Object> searchChildMap);

    int countAllComments(String businessId);

    void addComment(MarryComment marryComment);
}