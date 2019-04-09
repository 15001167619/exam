/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.SuccessCase.service;

import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.SuccessCase.dao.SuccessCaseDao;
import com.etycx.marry.modules.SuccessCase.entity.SuccessCase;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class MarrySuccessService extends CrudService<SuccessCaseDao,SuccessCase> {

	public List<SuccessCase> getSuccessCase(){
		return dao.selectSuccess();
	}
}