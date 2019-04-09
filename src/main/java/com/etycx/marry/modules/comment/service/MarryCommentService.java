/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.comment.service;

import java.util.*;
import java.util.stream.Collectors;

import com.etycx.marry.modules.operation.dao.MarryOperationDao;
import com.etycx.marry.modules.operation.entity.MarryOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.comment.entity.MarryComment;
import com.etycx.marry.modules.comment.dao.MarryCommentDao;

/**
 * commentService
 * @author 武海升
 * @version 2019-04-01
 */
@Service
@Transactional(readOnly = false)
public class MarryCommentService extends CrudService<MarryCommentDao, MarryComment> {

	@Autowired
	private MarryOperationDao marryOperationDao;

	public MarryComment get(String id) {
		return super.get(id);
	}
	
	public List<MarryComment> findList(MarryComment marryComment) {
		return super.findList(marryComment);
	}
	
	public Page<MarryComment> findPage(Page<MarryComment> page, MarryComment marryComment) {
		return super.findPage(page, marryComment);
	}
	
	@Transactional(readOnly = false)
	public void save(MarryComment marryComment) {
		super.save(marryComment);
	}
	
	@Transactional(readOnly = false)
	public void delete(MarryComment marryComment) {
		super.delete(marryComment);
	}

    public int countEvaluation(Map<String, Object> searchMap) {
		return dao.countEvaluation(searchMap);
    }


	public List<MarryComment> findEvaluationList(Map<String, Object> searchMap) {
		return dao.findEvaluationList(searchMap);
	}

	public List<MarryComment> findGroupEvaluationList(Map<String, Object> searchMap) {
		return dao.findGroupEvaluationList(searchMap);
	}

	public Map<String, Object> getUserEvaluationList(Integer userId, Integer pageNo, Integer pageSize) {
		Map<String, Object> resultMap = new HashMap<>(2);
		Map<String, Object> searchMap = new HashMap<>(1);
		searchMap.put("userId",userId);
		int sumCount = dao.countEvaluation(searchMap);
		Map<String, Object> pageProductMap = pagingPageCount(sumCount, pageNo, pageSize);
		resultMap.put("pageEvaluation", pageProductMap);
		searchMap.put("pageSize", pageSize);
		searchMap.put("pageNo",pageProductMap.get("pageNo"));
		List<MarryComment> groupEvaluationList = dao.findGroupEvaluationList(searchMap);
		List<Map<String,Object>> listMap = new ArrayList<>();
		for (MarryComment marryComment : groupEvaluationList) {
			Integer isFollow = marryOperationDao.isFollow(new MarryOperation(userId,0,marryComment.getBusinessId()));
			marryComment.setIsFollow(isFollow);
			Map<String,Object> map = new HashMap<>(2);
			map.put("productInfo",getProductInfo(marryComment.getBusinessId(),groupEvaluationList));
			Map<String, Object> searchCommentMap = new HashMap<>(1);
			searchCommentMap.put("userId",userId);
			searchCommentMap.put("businessId",marryComment.getBusinessId());
			map.put("evaluationList",dao.findEvaluationList(searchCommentMap).stream()
					.map(MarryComment::toSuccessMap)
					.collect(Collectors.toList()));
			listMap.add(map);
		}
		resultMap.put("userEvaluationList",listMap);
		return resultMap;
	}

	public Map<String,Object> getProductInfo(Integer businessId,List<MarryComment> evaluationList){
		Map<String,Object> map = new HashMap<>(3);
		for (MarryComment marryComment : evaluationList) {
			if(marryComment.getBusinessId().intValue() == businessId){
				map.put("businessId",businessId);
				map.put("productName",marryComment.getProductName());
				map.put("coverPath",marryComment.getCoverPath());
				map.put("isFollow",marryComment.getIsFollow());
				map.put("followName",marryComment.getIsFollow()==0?"关注":"已关注");
				break;
			}
		}
		return map;
	}

	public int countComment(Map<String, Object> searchMap) {
		return dao.countComment(searchMap);
	}

	public List<MarryComment> selectCommentList(Map<String, Object> searchMap) {
		return dao.selectCommentList(searchMap);
	}

	public List<MarryComment> childCommentList(Map<String, Object> searchChildMap) {
		return dao.selectChildCommentList(searchChildMap);
	}

	public int countAllComments(String id) {
		return dao.countAllComments(id);
	}

	public int childCommentCount(Map<String, Object> searchChildMap) {
		return dao.selectChildCommentCount(searchChildMap);
	}

	public Map<String, Object> childCommentList(Integer businessId, Integer pId, Integer pageNo, Integer pageSize) {
		Map<String, Object> resultMap = new HashMap<>(1);
		Map<String, Object> searchChildMap = new HashMap<>(4);
		searchChildMap.put("businessId",businessId);
		searchChildMap.put("pId",pId);
		int sumCount = dao.selectChildCommentCount(searchChildMap);
		Map<String, Object> pageCommentMap = pagingPageCount(sumCount, pageNo, pageSize);
		searchChildMap.put("pageSize", pageSize);
		searchChildMap.put("pageChildNo",pageCommentMap.get("pageNo"));
		List<Map<String, Object>> collect = dao.selectChildCommentList(searchChildMap).stream().map(MarryComment::toParentMap).collect(Collectors.toList());
		resultMap.put("childComment",collect);
		return resultMap;
	}


	public boolean addComment(Integer userId, Integer businessId, Integer pId,String content,Integer hasPicture,String picUrls) {
		try {
			dao.addComment(new MarryComment(userId,businessId,pId,content,hasPicture,picUrls));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}