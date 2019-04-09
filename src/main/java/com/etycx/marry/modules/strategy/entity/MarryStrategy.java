/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.strategy.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.etycx.marry.common.persistence.DataEntity;

/**
 * 推荐攻略Entity
 * @author 武海升
 * @version 2019-04-04
 */
public class MarryStrategy extends DataEntity<MarryStrategy> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 标题
	private String createName;		// 来源
	private String content;		// 推荐详情
	private String coverPath;		// 图片路径
	private Integer type;		// 推荐类型
	private Integer sort;		// 排序
	private Date createTime;		// 创建时间
	private Date updateTime;		// 修改时间
	
	public MarryStrategy() {
		super();
	}

	public MarryStrategy(String id){
		super(id);
	}

	@Length(min=0, max=200, message="标题长度必须介于 0 和 200 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=200, message="来源长度必须介于 0 和 200 之间")
	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=255, message="图片路径长度必须介于 0 和 255 之间")
	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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


	public static Map<String,Object> toSuccessMap(MarryStrategy marryStrategy) {
		Map<String,Object> map = new HashMap<>(3);
		map.put("id",marryStrategy.getId());
		map.put("name",marryStrategy.getName());
		map.put("coverPath",marryStrategy.getCoverPath());
		return map;
	}
	
}