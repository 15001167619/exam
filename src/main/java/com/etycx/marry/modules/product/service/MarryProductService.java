/**
 * Copyright &copy; 2012-2016 <a href="https://github.com.znkf.shop">JeeSite</a> All rights reserved.
 */
package com.etycx.marry.modules.product.service;

import java.util.*;
import java.util.stream.Collectors;

import com.etycx.marry.common.persistence.Page;
import com.etycx.marry.common.service.CrudService;
import com.etycx.marry.common.utils.Combinations;
import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.modules.operation.dao.MarryOperationDao;
import com.etycx.marry.modules.operation.entity.MarryOperation;
import com.etycx.marry.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etycx.marry.modules.product.entity.MarryProduct;
import com.etycx.marry.modules.product.dao.MarryProductDao;

/**
 * 内容Service
 * @author 武海升
 * @version 2019-03-08
 */
@Service
@Transactional(readOnly = true)
public class MarryProductService extends CrudService<MarryProductDao, MarryProduct> {

	@Autowired
	private MarryOperationDao operationDao;

	public MarryProduct get(String id) {
		return super.get(id);
	}
	
	public List<MarryProduct> findList(MarryProduct marryProduct) {
		return super.findList(marryProduct);
	}
	
	public Page<MarryProduct> findPage(Page<MarryProduct> page, MarryProduct marryProduct) {
		return super.findPage(page, marryProduct);
	}
	
	@Transactional(readOnly = false)
	public void save(MarryProduct marryProduct) {
		if(StringUtils.isBlank(marryProduct.getId())){
			marryProduct.setCreateTime(new Date());
			marryProduct.setUpdateTime(new Date());
			marryProduct.setCreateUserId(UserUtils.getUser().getId());
			marryProduct.setUpdateUserId(UserUtils.getUser().getId());
		}else {
			marryProduct.setUpdateTime(new Date());
			marryProduct.setUpdateUserId(UserUtils.getUser().getId());
		}
		super.save(marryProduct);
	}
	
	@Transactional(readOnly = false)
	public void delete(MarryProduct marryProduct) {
		super.delete(marryProduct);
	}

    public int countProduct(Map<String, Object> searchMap) {
		return dao.countProduct(searchMap);
    }

	public List<MarryProduct> selectProductList(Map<String, Object> searchMap) {
		return dao.selectProductList(searchMap);
	}

	public List<MarryProduct> selectProductListByState(int page,int pageSize) {
		page=page*pageSize;
		return dao.selectProductByShowState(1,page,pageSize);
	}

	public List<Integer> selectProductByShowStateCount(){
		int count=dao.selectProductByShowStateCount(1);
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

	public Map<String, Object> getProductList(Integer type, Integer pageNo, Integer pageSize,String dictIds, Integer topOn,Integer totalCategory,Integer userId) {
		Map<String, Object> resultMap = new HashMap<>(2);
		Map<String, Object> searchMap = new HashMap<>(1);
		searchMap.put("type",type);
		searchMap.put("topOn",topOn);
		if(StringUtils.isNotBlank(dictIds)){
			String[] split1 = dictIds.split(",");
			List<Integer> nums = new ArrayList<>();
			List<String> dictIdList = new ArrayList<>();
			for (String s : split1) {
				if(StringUtils.isNotBlank(s)){
					nums.add(Integer.parseInt(s));
				}
			}
			Collections.sort(nums);
			Combinations combinations = new Combinations(nums, totalCategory);
			for (Object list : combinations) {
				ArrayList arrayList = (ArrayList)list;
				String idStr= (String) arrayList.stream()
						.map(id -> id + "")
						.collect(Collectors.joining(","));
				dictIdList.add(idStr);
			}
			searchMap.put("dictIds",dictIdList);
		}
		int sumCount = dao.countProduct(searchMap);
		Map<String, Object> pageProductMap = pagingPageCount(sumCount, pageNo, pageSize);
		searchMap.put("pageSize", pageSize);
		searchMap.put("pageNo",pageProductMap.get("pageNo"));
		List<MarryProduct> marryProducts = dao.selectProductList(searchMap);
		List<Map<String,Object>> productsListMap = new ArrayList<>();
		for (MarryProduct marryProduct : marryProducts) {
			Map<String,Object> marryProductMap = new HashMap<>(3);
			marryProductMap.put("isFollow",0);
			marryProductMap.put("followName","关注");
			if(userId!=null){
				Integer isFollow = operationDao.isFollow(new MarryOperation(userId,0,Integer.parseInt(marryProduct.getId())));
				marryProductMap.put("isFollow",isFollow);
				if(isFollow==0){
					marryProductMap.put("followName","关注");
				}else {
					marryProductMap.put("followName","已关注");
				}
			}
			marryProductMap.put("id",marryProduct.getId());
			marryProductMap.put("name",marryProduct.getName());
			marryProductMap.put("coverPath",marryProduct.getCoverPath());
			marryProductMap.put("topOn",marryProduct.getTopOn());
			if(marryProduct.getTopOn()==1){
				String picPath = marryProduct.getPicPath();
				List<Map<String,Object>> productPicListMap = new ArrayList<>();
				if(StringUtils.isNotBlank(marryProduct.getPicPath())){
					String[] split = picPath.split(";");
					for (String s : split) {
						Map<String,Object> marryPicMap = new HashMap<>(1);
						marryPicMap.put("picPath",s);
						productPicListMap.add(marryPicMap);
					}
				}
				marryProductMap.put("productPicList",productPicListMap);
			}
			productsListMap.add(marryProductMap);
		}
		resultMap.put("productsList", productsListMap);
		return resultMap;
	}

    public Map<String, Object> getPageTurningList(Integer type, Integer pageNo, Integer pageSize) {
		Map<String, Object> resultMap = new HashMap<>(4);
		Map<String, Object> product_1 = new HashMap<>(4);
		product_1.put("id",0);
		Map<String, Object> product_2 = new HashMap<>(4);
		product_2.put("id",0);
		Map<String, Object> product_3 = new HashMap<>(4);
		product_3.put("id",0);
		Map<String, Object> product_4 = new HashMap<>(4);
		product_4.put("id",0);
		Map<String, Object> searchMap = new HashMap<>(3);
		searchMap.put("type", type);
		searchMap.put("pageSize", pageSize);
		searchMap.put("pageNo",pageNo);
		List<MarryProduct> marryProducts = dao.selectProductList(searchMap);
		for (int i = 0; i < marryProducts.size(); i++) {
			MarryProduct marryProduct = marryProducts.get(i);
			if(i == 0){
				product_1 = setProductMap(product_1,marryProduct);
			}else if(i == 1){
				product_2 = setProductMap(product_2,marryProduct);
			}else if(i == 2){
				product_3 = setProductMap(product_3,marryProduct);
			}else if(i == 3){
				product_4 = setProductMap(product_4,marryProduct);
			}else {
				break;
			}

		}
		resultMap.put("product_1",product_1);
		resultMap.put("product_2",product_2);
		resultMap.put("product_3",product_3);
		resultMap.put("product_4",product_4);
		return resultMap;
    }

	private Map<String, Object> setProductMap(Map<String, Object> map, MarryProduct marryProduct) {
		map.put("id",marryProduct.getId());
		map.put("name",marryProduct.getName());
		map.put("brief",marryProduct.getBrief());
		map.put("coverPath",marryProduct.getCoverPath());
		return map;
	}

    public Map<String, Object> getSearchList(Integer pageNo, Integer pageSize, String searchContent,Integer userId) {
		Map<String, Object> resultMap = new HashMap<>(2);
		Map<String, Object> searchMap = new HashMap<>(1);
		searchMap.put("searchContent",searchContent);
		int sumCount = dao.countProduct(searchMap);
		Map<String, Object> pageProductMap = pagingPageCount(sumCount, pageNo, pageSize);
		searchMap.put("pageSize", pageSize);
		searchMap.put("pageNo",pageProductMap.get("pageNo"));
		List<MarryProduct> marryProducts = dao.selectProductList(searchMap);
		List<Map<String,Object>> productsListMap = new ArrayList<>();
		for (MarryProduct marryProduct : marryProducts) {
			Map<String,Object> marryProductMap = new HashMap<>(3);
			marryProductMap.put("isFollow",0);
			marryProductMap.put("followName","关注");
			if(userId!=null){
				Integer isFollow = operationDao.isFollow(new MarryOperation(userId,0,Integer.parseInt(marryProduct.getId())));
				marryProductMap.put("isFollow",isFollow);
				if(isFollow==0){
					marryProductMap.put("followName","关注");
				}else {
					marryProductMap.put("followName","已关注");
				}
			}
			marryProductMap.put("id",marryProduct.getId());
			marryProductMap.put("name",marryProduct.getName());
			marryProductMap.put("coverPath",marryProduct.getCoverPath());
			marryProductMap.put("topOn",marryProduct.getTopOn());
			if(marryProduct.getTopOn()==1){
				String picPath = marryProduct.getPicPath();
				List<Map<String,Object>> productPicListMap = new ArrayList<>();
				if(StringUtils.isNotBlank(marryProduct.getPicPath())){
					String[] split = picPath.split(";");
					for (String s : split) {
						Map<String,Object> marryPicMap = new HashMap<>(1);
						marryPicMap.put("picPath",s);
						productPicListMap.add(marryPicMap);
					}
				}
				marryProductMap.put("productPicList",productPicListMap);
			}
			productsListMap.add(marryProductMap);
		}
		resultMap.put("productsList", productsListMap);
		return resultMap;
    }

    public Map<String, Object> getOtherProductList(Map<String, Object> mapProduct) {
		Map<String, Object> resultMap = new HashMap<>(1);
		List<MarryProduct> marryProducts = dao.getOtherProductList(mapProduct);
		List<Map<String,Object>> productsListMap = new ArrayList<>();
		for (MarryProduct marryProduct : marryProducts) {
			Map<String,Object> marryProductMap = new HashMap<>(3);
			marryProductMap.put("isFollow",0);
			marryProductMap.put("followName","关注");
			Integer userId = (Integer) mapProduct.get("userId");
			if(userId!=0){
				Integer isFollow = operationDao.isFollow(new MarryOperation(userId,0,Integer.parseInt(marryProduct.getId())));
				marryProductMap.put("isFollow",isFollow);
				if(isFollow==0){
					marryProductMap.put("followName","关注");
				}else {
					marryProductMap.put("followName","已关注");
				}
			}
			marryProductMap.put("id",marryProduct.getId());
			marryProductMap.put("name",marryProduct.getName());
			marryProductMap.put("coverPath",marryProduct.getCoverPath());
			marryProductMap.put("topOn",marryProduct.getTopOn());
			productsListMap.add(marryProductMap);
		}
		resultMap.put("productsList", productsListMap);
		return resultMap;
    }
}