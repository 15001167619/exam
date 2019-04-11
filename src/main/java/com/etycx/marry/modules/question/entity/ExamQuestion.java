/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.question.entity;

import com.alibaba.fastjson.JSONObject;
import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.etycx.marry.common.persistence.DataEntity;

/**
 * 试题管理Entity
 * @author 武海升
 * @version 2019-04-10
 */
public class ExamQuestion extends DataEntity<ExamQuestion> {
	
	private static final long serialVersionUID = 1L;
	private String paperType;		// 试卷类型 ABCDE
	private Integer useType;		// 使用群体 1 2
	private Integer type;		// 试题类型 0 选择题 1 判断题
	private Integer correct;		// 试题类型 0 选择题 1 判断题
	private Integer score;		// 试题类型 0 选择题 1 判断题
	private String question;		// 试题内容
	private String answerContent;		// {
	private String userAnswer;		// {
	private Date createTime;		// 创建时间

	public Integer getCorrect() {
		return correct;
	}

	public void setCorrect(Integer correct) {
		this.correct = correct;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getUserAnswer() {
		return userAnswer;
	}

	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}

	public ExamQuestion() {
		super();
	}

	public ExamQuestion(String id){
		super(id);
	}

	@Length(min=1, max=50, message="试卷类型 ABCDE长度必须介于 1 和 50 之间")
	public String getPaperType() {
		return paperType;
	}

	public void setPaperType(String paperType) {
		this.paperType = paperType;
	}
	
	@NotNull(message="使用群体 1 2不能为空")
	public Integer getUseType() {
		return useType;
	}

	public void setUseType(Integer useType) {
		this.useType = useType;
	}
	
	@NotNull(message="试题类型 0 选择题 1 判断题不能为空")
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	@Length(min=1, max=2000, message="试题内容长度必须介于 1 和 2000 之间")
	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}
	
	@Length(min=0, max=2000, message="{长度必须介于 0 和 2000 之间")
	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:StrategyDao")
	@NotNull(message="创建时间不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public static Map<String,Object> toMap(ExamQuestion examQuestion){
		Map<String, Object> map = new HashMap<>(9);
		map.put("questionId",examQuestion.getId());
		map.put("type",examQuestion.getType());
		map.put("question",examQuestion.getQuestion());
		JSONObject options = JSONObject.parseObject(examQuestion.getAnswerContent());
		Map<String, Object> answerContentMap = new HashMap<>(7);
		if(examQuestion.getType() == 0 || examQuestion.getType() == 2){
			map.put("questionType","选择题");
			answerContentMap.put("A",options.getString("A"));
			answerContentMap.put("B",options.getString("B"));
			answerContentMap.put("C",options.getString("C"));
			answerContentMap.put("D",options.getString("D"));
		}else {
			map.put("questionType","判断题");
		}
		map.put("correctAnswer", options.getString("answer"));
		map.put("answerContent", answerContentMap);
		map.put("score", examQuestion.getScore());
		map.put("correct", examQuestion.getCorrect());
		map.put("userAnswer", examQuestion.getUserAnswer());
		return map;
	}
	
}