/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.operation.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.operation.entity.MarryOperation;
import com.etycx.marry.modules.operation.dao.MarryOperationDao;

/**
 * 用户操作Service
 * @author 武海升
 * @version 2019-03-29
 */
@Service
@Transactional(readOnly = true)
public class MarryOperationService extends CrudService<MarryOperationDao, MarryOperation> {

	public MarryOperation get(String id) {
		return super.get(id);
	}
	
	public List<MarryOperation> findList(MarryOperation marryOperation) {
		return super.findList(marryOperation);
	}
	
	public Page<MarryOperation> findPage(Page<MarryOperation> page, MarryOperation marryOperation) {
		return super.findPage(page, marryOperation);
	}
	
	@Transactional(readOnly = false)
	public void save(MarryOperation marryOperation) {
		List<MarryOperation> list = dao.findList(marryOperation);
		if(list.size()==0){
			marryOperation.setCreateTime(new Date());
			dao.insert(marryOperation);
		}else {
			if(marryOperation.getBusinessType()==0){//取消关注
				dao.delete(list.get(0));
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(MarryOperation marryOperation) {
		super.delete(marryOperation);
	}

    public List<MarryOperation> findProductList(Map<String,Object> searchMap) {
		return dao.findProductList(searchMap);
    }

	public int countProduct(Map<String, Object> searchMap) {
		return dao.countProduct(searchMap);
	}

	public Map<String, Object> getOperationList(Integer userId ,Integer businessType, Integer type, Integer pageNo, Integer pageSize) {
		Map<String, Object> resultMap = new HashMap<>(2);
		Map<String, Object> searchMap = new HashMap<>(1);
		searchMap.put("userId",userId);
		searchMap.put("businessType",businessType);
		searchMap.put("type",type);
		int sumCount = dao.countProduct(searchMap);
		Map<String, Object> pageProductMap = pagingPageCount(sumCount, pageNo, pageSize);
		resultMap.put("pageProduct", pageProductMap);
		searchMap.put("pageSize", pageSize);
		searchMap.put("pageNo",pageProductMap.get("pageNo"));
		List<MarryOperation> productList = dao.findProductList(searchMap);
		for (MarryOperation marryOperation : productList) {
			Integer isFollow = dao.isFollow(new MarryOperation(userId,0,marryOperation.getBusinessId()));
			marryOperation.setIsFollow(isFollow);
		}
		List<Map<String, Object>> productListMap = dao.findProductList(searchMap)
				.stream()
				.map(MarryOperation::toSuccessMap)
				.collect(Collectors.toList());
		resultMap.put("productList", productListMap);
		return resultMap;
	}

    public Integer isFollow(MarryOperation marryOperation) {
		return dao.isFollow(marryOperation);
    }
}