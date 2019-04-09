/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.operation.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.operation.entity.MarryOperation;

import java.util.List;
import java.util.Map;

/**
 * 用户操作DAO接口
 * @author 武海升
 * @version 2019-03-29
 */
@MyBatisDao
public interface MarryOperationDao extends CrudDao<MarryOperation> {

    List<MarryOperation> findProductList(Map<String,Object> searchMap);

    int countProduct(Map<String, Object> searchMap);

    Integer isFollow(MarryOperation marryOperation);
}