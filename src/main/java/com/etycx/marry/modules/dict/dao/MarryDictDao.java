/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.dict.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.dict.entity.MarryDict;

/**
 * 内容DAO接口
 * @author 武海升
 * @version 2019-03-07
 */
@MyBatisDao
public interface MarryDictDao extends CrudDao<MarryDict> {

    MarryDict getMarryDict(Integer parentId);
}