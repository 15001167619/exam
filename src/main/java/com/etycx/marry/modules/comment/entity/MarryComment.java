/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.comment.entity;

import com.etycx.marry.common.utils.DateUtils;
import com.etycx.marry.common.utils.StringUtils;
import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.etycx.marry.common.persistence.DataEntity;

/**
 * commentEntity
 * @author 武海升
 * @version 2019-04-01
 */
public class MarryComment extends DataEntity<MarryComment> {
	
	private static final long serialVersionUID = 1L;
	private Integer pId;		// 0 默认楼主 其他值 回复id
	private Integer businessType;		// 业务类型 0 婚纱商品
	private Integer businessId;		// 业务Id
	private String content;		// content
	private Integer visible;		// 是否可见 0 可见 1不可见
	private Integer userId;		// 用户 id
	private Integer hasPicture;		// 是否有图 0 无图 1 有图
	private String picUrls;		// 图片存储地址 多张图片以 ; 相隔
	private Date createTime;		// 创建时间
	private Integer deleted;		// 0 正常 1 删除


	private String productName;
	private String coverPath;
	private String userName;
	private String headUrl;
	private Integer isFollow;

	public Integer getIsFollow() {
		return isFollow;
	}

	public void setIsFollow(Integer isFollow) {
		this.isFollow = isFollow;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getHeadUrl() {
		return headUrl;
	}

	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	public MarryComment(Integer userId,Integer businessId,Integer pId,String content,Integer hasPicture,String picUrls) {
		this.userId = userId;
		this.businessId = businessId;
		this.pId = pId;
		this.hasPicture = hasPicture;
		this.content = content;
		this.picUrls = picUrls;
	}

	public MarryComment() {
		super();
	}

	public MarryComment(String id){
		super(id);
	}


	
	@Length(min=0, max=1024, message="content长度必须介于 0 和 1024 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	

	
	@NotNull(message="用户 id不能为空")
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	

	
	@Length(min=0, max=1000, message="图片存储地址 多张图片以 ; 相隔长度必须介于 0 和 1000 之间")
	public String getPicUrls() {
		return picUrls;
	}

	public void setPicUrls(String picUrls) {
		this.picUrls = picUrls;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:StrategyDao")
	@NotNull(message="创建时间不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public Integer getBusinessType() {
		return businessType;
	}

	public void setBusinessType(Integer businessType) {
		this.businessType = businessType;
	}

	public Integer getBusinessId() {
		return businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	public Integer getVisible() {
		return visible;
	}

	public void setVisible(Integer visible) {
		this.visible = visible;
	}

	public Integer getHasPicture() {
		return hasPicture;
	}

	public void setHasPicture(Integer hasPicture) {
		this.hasPicture = hasPicture;
	}

	public Integer getDeleted() {
		return deleted;
	}

	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}

	public static Map<String,Object> toSuccessMap(MarryComment marryComment) {
		Map<String,Object> map = new HashMap<>(5);
		map.put("userId",marryComment.getUserId());
		map.put("userName",marryComment.getUserName());
		map.put("headUrl",marryComment.getHeadUrl());
		map.put("content",marryComment.getContent());
		map.put("createTime", DateUtils.formatDate(marryComment.getCreateTime(),"yyyy-MM-dd HH:mm:ss"));
		return map;
	}

	public static Map<String,Object> toParentMap(MarryComment marryComment) {
		Map<String,Object> map = new HashMap<>(5);
		map.put("id",marryComment.getId());
		map.put("businessId",marryComment.getBusinessId());
		map.put("hasPicture",marryComment.getHasPicture());
		if(marryComment.getHasPicture()!=0 && StringUtils.isNotBlank(marryComment.getPicUrls())){
			map.put("picUrls",marryComment.getPicUrls().split(";"));
		}
		map.put("userName",marryComment.getUserName());
		map.put("headUrl",marryComment.getHeadUrl());
		map.put("content",marryComment.getContent());
		map.put("createTime", DateUtils.formatDate(marryComment.getCreateTime(),"yyyy-MM-dd HH:mm:ss"));
		return map;
	}
	
}