/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.strategy.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.strategy.entity.MarryStrategy;

import java.util.List;
import java.util.Map;

/**
 * 推荐攻略DAO接口
 * @author 武海升
 * @version 2019-04-04
 */
@MyBatisDao
public interface MarryStrategyDao extends CrudDao<MarryStrategy> {

    int countStrategy(Map<String, Object> searchMap);

    List<MarryStrategy> selectStrategyList(Map<String, Object> searchMap);

    List<MarryStrategy> getTopStrategyList(Map<String, Object> map);

    List<MarryStrategy> getNextStrategyList(Map<String, Object> map);

    List<MarryStrategy> getOtherStrategyList(Map<String, Object> map);

    List<MarryStrategy> getIndexList();
}