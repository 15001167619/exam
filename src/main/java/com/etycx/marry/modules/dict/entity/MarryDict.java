/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.dict.entity;

import com.etycx.marry.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;


/**
 * 内容Entity
 * @author 武海升
 * @version 2019-03-07
 */
public class MarryDict extends DataEntity<MarryDict> {
	
	private static final long serialVersionUID = 1L;
	private String value;		// 数据值
	private String label;		// 标签名
	private String category;		// 类型
	private Integer type;		// 0 婚礼策划 1 婚纱摄影 2 艺术写真 3 婚纱礼服 4 结婚钻戒 5 结婚用品  6 蜜月旅行 7 酒店预订
	private String description;		// 描述
	private String sort;		// 排序（升序）
	private Integer parentId;		// 父级编号
	
	public MarryDict() {
		super();
	}

	public MarryDict(String id){

	}
	public MarryDict(Integer type,Integer parentId){
		this.type = type;
		this.parentId = parentId;
	}

	@Length(min=1, max=100, message="数据值长度必须介于 1 和 100 之间")
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	@Length(min=1, max=100, message="标签名长度必须介于 1 和 100 之间")
	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}
	
	@Length(min=1, max=100, message="类型长度必须介于 1 和 100 之间")
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	@Length(min=1, max=3, message="0 婚礼策划 1 婚纱摄影 2 艺术写真 3 婚纱礼服 4 结婚钻戒 5 结婚用品  6 蜜月旅行 7 酒店预订长度必须介于 1 和 3 之间")
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	@Length(min=1, max=100, message="描述长度必须介于 1 和 100 之间")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	

	
}