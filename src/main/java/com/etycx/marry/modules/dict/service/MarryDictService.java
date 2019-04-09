/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.dict.service;

import java.util.List;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etycx.marry.modules.dict.entity.MarryDict;
import com.etycx.marry.modules.dict.dao.MarryDictDao;

/**
 * 内容Service
 * @author 武海升
 * @version 2019-03-07
 */
@Service
@Transactional(readOnly = true)
public class MarryDictService extends CrudService<MarryDictDao, MarryDict> {

	public MarryDict get(String id) {
		return super.get(id);
	}
	
	public List<MarryDict> findList(MarryDict marryDict) {
		return super.findList(marryDict);
	}
	
	public Page<MarryDict> findPage(Page<MarryDict> page, MarryDict marryDict) {
		return super.findPage(page, marryDict);
	}
	
	@Transactional(readOnly = false)
	public void save(MarryDict marryDict) {
		super.save(marryDict);
	}
	
	@Transactional(readOnly = false)
	public void delete(MarryDict marryDict) {
		super.delete(marryDict);
	}
	
}