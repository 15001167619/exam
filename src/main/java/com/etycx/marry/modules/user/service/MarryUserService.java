/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.user.service;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.user.dao.IUserDao;
import com.etycx.marry.modules.user.entity.MarryUser;
import com.etycx.marry.social.util.Constans;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 用户信息Service
 * @author 琚春波
 * @version 2019-04-02
 */
@Service
@Transactional(readOnly = false)
public class MarryUserService extends CrudService<IUserDao, MarryUser> {

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

    public int insertSelective(MarryUser newUser) {
		return dao.insertSelective(newUser);
    }

	public MarryUser getUserByOpenId(String openId, Constans.OpenIdType openIdType) {
		return dao.getUserByOpenId(openId, openIdType);
	}
	@Transactional(readOnly = false)
	public int updatePhone(String userId, String phone) {
		return dao.updatePhone(userId, phone);
	}
	@Transactional(readOnly = false)
	public int updatePassword(String userId, String password) {
		return dao.updatePassword(userId, password);
	}
	@Transactional(readOnly = false)
	public int updateUser(String id, String headUrl, String name,Integer sex,  String birthday,  String weddingDate){
		return dao.updateUser(id,headUrl,name,sex,birthday,weddingDate);
	}
}