/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.sys.dao;

import com.etycx.marry.modules.sys.entity.Log;
import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;

/**
 * 日志DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log> {

}
