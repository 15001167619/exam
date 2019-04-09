/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.expect.service;

import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.expect.dao.ExpectDao;
import com.etycx.marry.modules.expect.entity.Expect;
import org.springframework.stereotype.Service;

@Service
public class ExpectService extends CrudService<ExpectDao,Expect> {

	public int addExpect(Expect expect){
		return dao.insert(expect);
	}

}