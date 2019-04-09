/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.company.service;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.company.dao.CompanyDao;
import com.etycx.marry.modules.company.entity.MarryCompany;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class CompanyService extends CrudService<CompanyDao,MarryCompany> {


	public List<MarryCompany> getCompanys(int state){
		return dao.selectCompany(state);
	}

	public List<MarryCompany> getAllCompanys(){
		return dao.selectCompanyList();
	}

	public int insertExpect(Long userId,String hobby,int age,String price_scope,Date WeddingTime){
		return dao.insert(userId,hobby,age,price_scope,WeddingTime);
	}
	public MarryCompany get(String id) {
		return super.get(id);
	}

	public List<MarryCompany> findList(MarryCompany marryCompany) {
		return super.findList(marryCompany);
	}

	public Page<MarryCompany> findPage(Page<MarryCompany> page, MarryCompany marryCompany) {
		return super.findPage(page, marryCompany);
	}

	@Transactional(readOnly = false)
	public void save(MarryCompany marryCompany) {
		super.save(marryCompany);
	}

	@Transactional(readOnly = false)
	public void delete(MarryCompany marryCompany) {
		super.delete(marryCompany);
	}
}