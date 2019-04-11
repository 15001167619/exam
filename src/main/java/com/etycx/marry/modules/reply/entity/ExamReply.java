/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.reply.entity;

import com.alibaba.fastjson.JSONObject;
import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.etycx.marry.common.persistence.DataEntity;

/**
 * 我的回答Entity
 * @author 武海升
 * @version 2019-04-10
 */
public class ExamReply extends DataEntity<ExamReply> {
	
	private static final long serialVersionUID = 1L;
	private Integer questionId;		// 试题Id
	private String studentId;		// 学号
	private String userAnswer;		// 我的答案
	private Integer score;		// 分数
	private Integer correct;		// 0错误1为正确
	private Date createTime;		// 提交时间




	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}


	public ExamReply() {
		super();
	}

	public ExamReply(String id){
		super(id);
	}

	public ExamReply(JSONObject jsonObject) {
		if(jsonObject!=null){
			this.questionId = jsonObject.getInteger("questionId");
			this.studentId = jsonObject.getString("studentId");
			this.correct = jsonObject.getInteger("correct");
			this.userAnswer = jsonObject.getString("userAnswer");
			this.score = this.correct == 1? 2 :0;
		}
	}

	@Length(min=1, max=500, message="学号长度必须介于 1 和 500 之间")
	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	@Length(min=0, max=500, message="我的答案长度必须介于 0 和 500 之间")
	public String getUserAnswer() {
		return userAnswer;
	}

	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}
	
	@NotNull(message="分数不能为空")
	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}
	
	@NotNull(message="0错误1为正确不能为空")
	public Integer getCorrect() {
		return correct;
	}

	public void setCorrect(Integer correct) {
		this.correct = correct;
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