/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.diary.entity;

import com.etycx.marry.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.beans.IntrospectionException;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;


/**
 * 内容Entity
 * @author 武海升
 * @version 2019-03-06
 */
public class MarryDiary extends DataEntity<MarryDiary> {
	
	private static final long serialVersionUID = 1L;
	private Integer type;		// 0 日记 1 活动
	private String name;		// 名称
	private String brief;		// 名称
	private String coverPath;		// 封面路径
	private String content;		// 内容
	private Integer sort;		// 排序 默认 0
	private Date createTime;		// 创建时间
	private Date updateTime;		// 修改时间
	private String createUserId;		// 创建者
	private String updateUserId;		// 更新者
	
	public MarryDiary() {
		super();
	}

	public MarryDiary(Integer type) {
		this.type = type;
	}

	public MarryDiary(String id){
		super(id);
	}


	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}
	
	@Length(min=1, max=200, message="名称长度必须介于 1 和 200 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=200, message="封面路径长度必须介于 0 和 200 之间")
	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
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