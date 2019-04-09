package com.etycx.marry.modules.expect.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.expect.entity.Expect;


@MyBatisDao
public interface ExpectDao extends CrudDao<Expect> {
    public int insertExpect(Expect expect);
}
