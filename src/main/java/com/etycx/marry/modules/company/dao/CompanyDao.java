package com.etycx.marry.modules.company.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.company.entity.MarryCompany;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;


@MyBatisDao
public interface CompanyDao extends CrudDao<MarryCompany> {

    public List<MarryCompany> selectCompany(@Param("state")int state);

    public List<MarryCompany> selectCompanyList();

    public int insert(@Param("userId")Long userId, @Param("hobby")String hobby, @Param("age")int age, @Param("price_scope")String price_scope, @Param("wedding_time")Date wedding_time);


}
