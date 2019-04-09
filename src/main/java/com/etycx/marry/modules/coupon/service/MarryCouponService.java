/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.coupon.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.coupon.entity.MarryCoupon;
import com.etycx.marry.modules.coupon.dao.MarryCouponDao;

/**
 * couponService
 * @author 武海升
 * @version 2019-04-01
 */
@Service
@Transactional(readOnly = true)
public class MarryCouponService extends CrudService<MarryCouponDao, MarryCoupon> {

	public MarryCoupon get(String id) {
		return super.get(id);
	}
	
	public List<MarryCoupon> findList(MarryCoupon marryCoupon) {
		return super.findList(marryCoupon);
	}
	
	public Page<MarryCoupon> findPage(Page<MarryCoupon> page, MarryCoupon marryCoupon) {
		return super.findPage(page, marryCoupon);
	}
	
	@Transactional(readOnly = false)
	public void save(MarryCoupon marryCoupon) {
		super.save(marryCoupon);
	}
	
	@Transactional(readOnly = false)
	public void delete(MarryCoupon marryCoupon) {
		super.delete(marryCoupon);
	}
	
}