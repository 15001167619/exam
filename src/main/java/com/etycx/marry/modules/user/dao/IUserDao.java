package com.etycx.marry.modules.user.dao;

import com.etycx.marry.common.persistence.CrudDao;
import com.etycx.marry.common.persistence.annotation.MyBatisDao;
import com.etycx.marry.modules.user.entity.MarryUser;
import com.etycx.marry.social.util.Constans;
import org.apache.ibatis.annotations.Param;

import java.util.Date;


@MyBatisDao
public interface IUserDao extends CrudDao<MarryUser> {

    /**
     * 通过手机号密码登录
     * @param phone
     * @return
     */
    MarryUser getIUserByPhone(@Param("phone")String phone);

    /**
     * 根据openI判断用户是否登陆过
     * @param openId
     * @return
     */
    int count(@Param("openId") String openId,@Param("type")String type);

    /**
     * 通过openid和type获取用
     * @param openId
     * @param type
     * @return
     */
    MarryUser getIUserByOpenId(@Param("openId") String openId, @Param("type")String type);

    /**
     * 根据用户手机号获取用户
     * @param phone
     * @return
     */
    MarryUser getIUser(@Param("phone")String phone);

    int insertSelective(MarryUser newUser);

    MarryUser getUserByOpenId(String openId, Constans.OpenIdType openIdType);
    int updatePhone(@Param("id")String id, @Param("phoneNum")String phoneNum);

    int updateUser(@Param("id")String id,@Param("headUrl") String headUrl,@Param("name") String name,@Param("sex") Integer sex,@Param("birthday") String birthday,@Param("weddingDate") String weddingDate);

    int updatePassword(@Param("id")String id, @Param("password")String password);
}
