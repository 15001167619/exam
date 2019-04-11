/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.record.entity;

import com.etycx.marry.common.utils.excel.annotation.ExcelField;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.etycx.marry.common.persistence.DataEntity;

/**
 * 答题记录Entity
 * @author 武海升
 * @version 2019-04-10
 */
public class ExamRecord extends DataEntity<ExamRecord> {
	
	private static final long serialVersionUID = 1L;
	private String studentId;		// 学号
	private String paperId;		// 学号
	private Integer useType;		// 学号
	private String userName;		// 学号
	private String company;		// 学号
	private String scene;		// 学号
	private long scoreSum;		// 学号
	private long errorSum;		// 学号
	private long correctSum;		// 学号
	private String questionIds;		// 试题Id集合
	private Date createTime;		// 提交时间
	
	public ExamRecord() {
		super();
	}

	public ExamRecord(String id){
		super(id);
	}

	public String getPaperId() {
		return paperId;
	}

	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}

	public ExamRecord(String studentId, String paperId , Integer useType, String userName, String company, String scene, String questionIds, long scoreSum, long correctSum, long errorSum) {

		this.studentId = studentId;
		this.paperId = paperId;
		this.useType = useType;
		this.userName = userName;
		this.company = company;
		this.scene = scene;
		this.scoreSum = scoreSum;
		this.correctSum = correctSum;
		this.errorSum = errorSum;
		this.questionIds = questionIds;
		this.createTime = new Date();
	}
	@ExcelField(title="所在组", align=2, sort=33, dictType="useTpye")
	public Integer getUseType() {
		return useType;
	}

	public void setUseType(Integer useType) {
		this.useType = useType;
	}
	@ExcelField(title="姓名", align=2, sort=20)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	@ExcelField(title="单位", align=2, sort=25)
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	@ExcelField(title="场次", align=2, sort=30)
	public String getScene() {
		return scene;
	}

	public void setScene(String scene) {
		this.scene = scene;
	}
	@ExcelField(title="总分", align=2, sort=35)
	public long getScoreSum() {
		return scoreSum;
	}

	public void setScoreSum(long scoreSum) {
		this.scoreSum = scoreSum;
	}
	@ExcelField(title="答错题数", align=2, sort=40)
	public long getErrorSum() {
		return errorSum;
	}

	public void setErrorSum(long errorSum) {
		this.errorSum = errorSum;
	}
	@ExcelField(title="答对题数", align=2, sort=45)
	public long getCorrectSum() {
		return correctSum;
	}

	public void setCorrectSum(long correctSum) {
		this.correctSum = correctSum;
	}

	@Length(min=1, max=500, message="学号长度必须介于 1 和 500 之间")
	@ExcelField(title="考号", align=2, sort=15)
	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	
	@Length(min=1, max=500, message="试题Id集合长度必须介于 1 和 500 之间")
	public String getQuestionIds() {
		return questionIds;
	}

	public void setQuestionIds(String questionIds) {
		this.questionIds = questionIds;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:StrategyDao")
	@NotNull(message="提交时间不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}