/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.coupon.entity;

import org.hibernate.validator.constraints.Length;

import com.etycx.marry.common.persistence.DataEntity;

import java.util.HashMap;
import java.util.Map;

/**
 * couponEntity
 * @author 武海升
 * @version 2019-04-01
 */
public class MarryCoupon extends DataEntity<MarryCoupon> {
	
	private static final long serialVersionUID = 1L;
	private String coverPath;		// 图片路径
	
	public MarryCoupon() {
		super();
	}

	public MarryCoupon(String id){
		super(id);
	}

	@Length(min=1, max=500, message="图片路径长度必须介于 1 和 500 之间")
	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}

	public static Map<String,Object> toSuccessMap(MarryCoupon marryOperation) {
		Map<String,Object> map = new HashMap<>(1);
		map.put("coverPath",marryOperation.getCoverPath());
		return map;
	}
	
}