package com.etycx.marry.modules.SuccessCase.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.SuccessCase.entity.SuccessCase;


import java.util.List;


@MyBatisDao
public interface SuccessCaseDao extends CrudDao<SuccessCase> {

    public List<SuccessCase> selectSuccess();

}
