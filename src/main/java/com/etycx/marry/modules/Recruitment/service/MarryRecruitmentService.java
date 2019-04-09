/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.Recruitment.service;

import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.modules.Recruitment.dao.RecruitmentDao;
import com.etycx.marry.modules.Recruitment.entity.Recruitment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class MarryRecruitmentService extends CrudService<RecruitmentDao,Recruitment> {

	/**
	 * 根据类型获取列表
	 */
	public List<Recruitment> selectRecruitment(int status,int page,int pageSize){
		page=pageSize*page;
		return dao.selectRecruitment(status,page,pageSize);
	}



	/**
	 * 获取数据总条数
	 */
	public List<Integer> countByType(int status){
		int count=dao.selectRecruitmentCount(status);
		int num;
		int lastNum=count%16;
		if(lastNum==0){
			num=count/16;
		}else {
			num=count/16+1;
		}
		List<Integer> integers=new ArrayList<Integer>();
		for (int i=0;i<num;i++){
			integers.add(i+1);
		}
		return integers;
	}

}