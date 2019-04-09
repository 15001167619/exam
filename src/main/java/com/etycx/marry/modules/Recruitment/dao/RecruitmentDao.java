package com.etycx.marry.modules.Recruitment.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.Recruitment.entity.Recruitment;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@MyBatisDao
public interface RecruitmentDao extends CrudDao<Recruitment> {

public List<Recruitment> selectRecruitment(@Param("status") int status,@Param("page")int page,@Param("pageSize")int pageSize);

public Integer selectRecruitmentCount(@Param("status") int status);

}
