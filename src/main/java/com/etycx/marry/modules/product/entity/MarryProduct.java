/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.product.entity;

import com.etycx.marry.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;


/**
 * 内容Entity
 * @author 武海升
 * @version 2019-03-08
 */
public class MarryProduct extends DataEntity<MarryProduct> {
	
	private static final long serialVersionUID = 1L;
	private String dictIds;		// 归属值 id集合 以 , 相隔
	private String name;		// 名称
	private String brief;		// 名称
	private String specification;		// 名称
	private String story;		// 名称
	private String content;		// 名称
	private String coverPath;		// 封面路径
	private String picPath;		// 封面路径
	private Integer sort;		// 排序 默认 0
	private Integer type;
	private Integer topOn;
	private Integer showState;
	private Date createTime;		// 创建时间
	private Date updateTime;		// 修改时间
	private String createUserId;		// 创建者
	private String updateUserId;		// 更新者
	
	public MarryProduct() {
		super();
	}

	public Integer getShowState() {
		return showState;
	}

	public void setShowState(Integer showState) {
		this.showState = showState;
	}

	public MarryProduct(String id){
		super(id);
	}


	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	@Length(min=1, max=11, message="归属值 id集合 以 , 相隔长度必须介于 1 和 11 之间")
	public String getDictIds() {
		return dictIds;
	}

	public void setDictIds(String dictIds) {
		this.dictIds = dictIds;
	}
	
	@Length(min=1, max=200, message="名称长度必须介于 1 和 200 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=200, message="封面路径长度必须介于 1 和 200 之间")
	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}
	
	@NotNull(message="排序 默认 0不能为空")
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getTopOn() {
		return topOn;
	}

	public void setTopOn(Integer topOn) {
		this.topOn = topOn;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:StrategyDao")
	@NotNull(message="创建时间不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:StrategyDao")
	@NotNull(message="修改时间不能为空")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	@Length(min=1, max=64, message="创建者长度必须介于 1 和 64 之间")
	public String getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	
	@Length(min=1, max=64, message="更新者长度必须介于 1 和 64 之间")
	public String getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}
	
}