/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.record.entity;

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
	private String questionIds;		// 试题Id集合
	private Date createTime;		// 提交时间
	
	public ExamRecord() {
		super();
	}

	public ExamRecord(String id){
		super(id);
	}

    public ExamRecord(String studentId, String questionIds) {
		this.studentId = studentId;
		this.questionIds = questionIds;
		this.createTime = new Date();
    }

    @Length(min=1, max=500, message="学号长度必须介于 1 和 500 之间")
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