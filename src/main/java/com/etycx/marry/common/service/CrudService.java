/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.common.service;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.DataEntity;
import com.etycx.marry.common.persistence.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Service基类
 * @author ThinkGem
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class CrudService<D extends CrudDao<T>, T extends DataEntity<T>> extends BaseService {
	
	/**
	 * 持久层对象
	 */
	@Autowired
	protected D dao;
	
	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	public T get(String id) {
		return dao.get(id);
	}
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity) {
		return dao.get(entity);
	}
	
	/**
	 * 查询列表数据
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) {
		return dao.findList(entity);
	}
	
	/**
	 * 查询分页数据
	 * @param page 分页对象
	 * @param entity
	 * @return
	 */
	public Page<T> findPage(Page<T> page, T entity) {
		entity.setPage(page);
		page.setList(dao.findList(entity));
		return page;
	}

	/**
	 * 保存数据（插入或更新）
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void save(T entity) {
		if (entity.getIsNewRecord()){
			entity.preInsert();
			dao.insert(entity);
		}else{
			entity.preUpdate();
			dao.update(entity);
		}
	}
	
	/**
	 * 删除数据
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void delete(T entity) {
		dao.delete(entity);
	}


	/**
	 * 分页计算
	 * @param sunCount
	 * @param pageNo
	 * @param pageSize
	 */
	public static Map<String,Object> pagingPageCount(Integer sunCount, Integer pageNo, Integer pageSize){
		Map<String, Object> map = new HashMap<>();
		if (pageSize == null || pageSize < 1) {
			pageSize = 16;
		}
		if (pageNo == null || pageNo < 2) {
			pageNo = 0;
		} else {
			pageNo = pageSize * (pageNo - 1);
		}
		Integer pages = (sunCount + pageSize - 1) / pageSize;
		map.put("pageNo", pageNo);
		map.put("pageSize", pageSize);
		map.put("pages", pages);
		return map;
	}

}
