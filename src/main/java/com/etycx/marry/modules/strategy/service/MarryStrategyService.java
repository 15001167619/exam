/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.strategy.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.etycx.marry.modules.baidu.ueditor.common.StringUtils;
import com.etycx.marry.modules.diary.entity.MarryDiary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.strategy.entity.MarryStrategy;
import com.etycx.marry.modules.strategy.dao.MarryStrategyDao;

/**
 * 推荐攻略Service
 * @author 武海升
 * @version 2019-04-04
 */
@Service
@Transactional(readOnly = true)
public class MarryStrategyService extends CrudService<MarryStrategyDao, MarryStrategy> {

	public MarryStrategy get(String id) {
		return super.get(id);
	}
	
	public List<MarryStrategy> findList(MarryStrategy marryStrategy) {
		return super.findList(marryStrategy);
	}
	
	public Page<MarryStrategy> findPage(Page<MarryStrategy> page, MarryStrategy marryStrategy) {
		return super.findPage(page, marryStrategy);
	}
	
	@Transactional(readOnly = false)
	public void save(MarryStrategy marryStrategy) {
		if(StringUtils.isEmpty(marryStrategy.getId())){
			marryStrategy.setCreateTime(new Date());
			marryStrategy.setUpdateTime(new Date());
		}
		super.save(marryStrategy);
	}
	
	@Transactional(readOnly = false)
	public void delete(MarryStrategy marryStrategy) {
		super.delete(marryStrategy);
	}

    public int countStrategy(Map<String, Object> searchMap) {
		return dao.countStrategy(searchMap);
    }

	public List<MarryStrategy> selectStrategyList(Map<String, Object> searchMap) {
		return dao.selectStrategyList(searchMap);
	}

	public Map<String, Object> getStrategyList(Integer type, Integer pageNo, Integer pageSize) {
		Map<String, Object> resultMap = new HashMap<>(2);
		Map<String, Object> searchMap = new HashMap<>(1);
		searchMap.put("type",type);
		int sumCount = dao.countStrategy(searchMap);
		Map<String, Object> pageStrategyMap = pagingPageCount(sumCount, pageNo, pageSize);
		resultMap.put("pageStrategy", pageStrategyMap);
		searchMap.put("pageSize", pageSize);
		searchMap.put("pageNo",pageStrategyMap.get("pageNo"));
		resultMap.put("strategyList", dao.selectStrategyList(searchMap)
				.stream()
				.map(MarryStrategy :: toSuccessMap)
				.collect(Collectors.toList()));
		return resultMap;
	}

    public List<MarryStrategy> getTopStrategyList(Map<String, Object> map) {
		return dao.getTopStrategyList(map);
    }

	public List<MarryStrategy> getNextStrategyList(Map<String, Object> map) {
		return dao.getNextStrategyList(map);
	}

	public List<MarryStrategy> getOtherStrategyList(Map<String, Object> map) {
		return dao.getOtherStrategyList(map);
	}

	public List<MarryStrategy> getIndexList() {
		return dao.getIndexList();
	}
}