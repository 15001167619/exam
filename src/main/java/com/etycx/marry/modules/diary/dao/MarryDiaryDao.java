/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.diary.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.diary.entity.MarryDiary;

import java.util.List;
import java.util.Map;

/**
 * 内容DAO接口
 * @author 武海升
 * @version 2019-03-06
 */
@MyBatisDao
public interface MarryDiaryDao extends CrudDao<MarryDiary> {

    int countDiary(Map<String, Object> searchMap);

    List<MarryDiary> selectDiaryList(Map<String, Object> searchMap);

    List<MarryDiary> getTopDiaryList(Map<String, Object> map);

    List<MarryDiary> getNextDiaryList(Map<String, Object> map);
}