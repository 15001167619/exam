/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.coupon.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.coupon.entity.MarryCoupon;

/**
 * couponDAO接口
 * @author 武海升
 * @version 2019-04-01
 */
@MyBatisDao
public interface MarryCouponDao extends CrudDao<MarryCoupon> {
	
}