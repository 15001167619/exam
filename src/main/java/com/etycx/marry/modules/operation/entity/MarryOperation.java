/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.operation.entity;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.etycx.marry.common.persistence.DataEntity;

/**
 * 用户操作Entity
 * @author 武海升
 * @version 2019-03-29
 */
public class MarryOperation extends DataEntity<MarryOperation> {
	
	private static final long serialVersionUID = 1L;
	private Integer businessType;		// 业务类型 0 关注 1 浏览
	private Integer businessId;		// 业务Id
	private Integer type;
	private Integer isFollow; //是否关注 0 未关注 1 已关注
	private String name;		// 名称
	private String brief;		// 名称
	private String coverPath;			// 名称
	private Integer userId;		// 用户 id
	private Date createTime;		// 创建时间

	public Integer getIsFollow() {
		return isFollow;
	}

	public void setIsFollow(Integer isFollow) {
		this.isFollow = isFollow;
	}

	public static Map<String,Object> toSuccessMap(MarryOperation marryOperation) {
		Map<String,Object> map = new HashMap<>(7);
		map.put("businessId",marryOperation.getBusinessId());
		map.put("isFollow",marryOperation.getIsFollow());
		map.put("followName",marryOperation.getIsFollow()==0?"关注":"已关注");
		map.put("businessType",marryOperation.getBusinessType());
		map.put("name",marryOperation.getName());
		map.put("brief",marryOperation.getBrief());
		map.put("coverPath",marryOperation.getCoverPath());
		return map;
	}


	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}

	public MarryOperation(Integer userId,Integer businessType,Integer businessId) {
		this.userId = userId;
		this.businessType = businessType;
		this.businessId = businessId;
	}
	public MarryOperation() {
		super();
	}

	public MarryOperation(String id){
		super(id);
	}

	@NotNull(message="业务类型 0 关注 1 浏览不能为空")
	public Integer getBusinessType() {
		return businessType;
	}

	public void setBusinessType(Integer businessType) {
		this.businessType = businessType;
	}
	
	@NotNull(message="业务Id不能为空")
	public Integer getBusinessId() {
		return businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:StrategyDao")
	@NotNull(message="创建时间不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}