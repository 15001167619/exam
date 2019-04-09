/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.user.service;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.common.utils.MD5;
import com.etycx.marry.modules.sys.service.SystemService;
import com.etycx.marry.modules.user.dao.IUserDao;
import com.etycx.marry.modules.user.entity.MarryUser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class IUserService extends CrudService<IUserDao,MarryUser> {

	public MarryUser getIUserByPhone(String phone){
		return dao.getIUserByPhone(phone);
	}

	public int count(String openId,String type){
		return dao.count(openId,type);
	}

	public MarryUser getUserByOpenIdAndType(String openId, String type){
		return dao.getIUserByOpenId(openId,type);
	}

	public MarryUser getIuser(String phone){
		return dao.getIUser(phone);
	}

	public MarryUser get(String id) {
		return super.get(id);
	}

	public List<MarryUser> findList(MarryUser marryUser) {
		return super.findList(marryUser);
	}

	public Page<MarryUser> findPage(Page<MarryUser> page, MarryUser marryUser) {
		return super.findPage(page, marryUser);
	}

	@Transactional(readOnly = false)
	public void save(MarryUser marryUser) {
		super.save(marryUser);
	}

	@Transactional(readOnly = false)
	public void delete(MarryUser marryUser) {
		super.delete(marryUser);
	}

}