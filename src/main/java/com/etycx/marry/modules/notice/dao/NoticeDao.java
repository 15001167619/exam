package com.etycx.marry.modules.notice.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.Recruitment.entity.Recruitment;
import com.etycx.marry.modules.notice.entity.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@MyBatisDao
public interface NoticeDao extends CrudDao<Notice> {

public List<Notice> selectNotice(@Param("page") int page, @Param("pageSize") int pageSize);

public Integer selectNoticeCount();

public Notice  selectNoticeById(int id);

}
