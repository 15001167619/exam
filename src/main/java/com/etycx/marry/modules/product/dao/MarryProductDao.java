/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.product.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.product.entity.MarryProduct;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 内容DAO接口
 * @author 武海升
 * @version 2019-03-08
 */
@MyBatisDao
public interface MarryProductDao extends CrudDao<MarryProduct> {

    int countProduct(Map<String, Object> searchMap);

    List<MarryProduct> selectProductList(Map<String, Object> searchMap);

    List<MarryProduct> selectProductByShowState(@Param("showState") int showState,@Param("page")int page,@Param("pageSize")int pageSize);

    Integer selectProductByShowStateCount(@Param("showState") int showState);

    List<MarryProduct> getOtherProductList(Map<String, Object> mapProduct);
}