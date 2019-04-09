package com.etycx.marry.common.config;

/**
 * @author 武海升
 * @date 2018/7/4 9:50
 * description:公用常量类
 */
public class ConfigConstants {

    /**
     * 图片Api接口访问基础路径 http://192.168.1.203/shopStatic
     */
    public static String SHOP_PICTURE_BASE_PATH = ReloadableConfig.getProperty("SHOP_PICTURE_BASE_PATH", "http://192.168.1.203/shopStatic");
    /**
     * 图片存储Base路径
     */
    public static String UPLOAD_PICTURE_FILE_PATH = ReloadableConfig.getProperty("UPLOAD_PICTURE_FILE_PATH", "/usr/local/upload/shop_images");
    /**
     * 日记、活动图片路径
     */
    public static String DIARY_COVER = ReloadableConfig.getProperty("DIARY_COVER", "/diary/cover");
    /**
     * 婚纱产品图片封面图
     */
    public static String MARRY_PRODUCT_COVER = ReloadableConfig.getProperty("MARRY_PRODUCT_COVER", "/marryProduct/cover");
    /**
     * 婚纱产品图片封面图
     */
    public static String MARRY_PRODUCT_LIST_COVER = ReloadableConfig.getProperty("MARRY_PRODUCT_LIST_COVER", "/marryProductList/cover");
    /**
     * 首页轮播图
     */
    public static String BANNER_COVER = ReloadableConfig.getProperty("BANNER_COVER", "/banner/cover");
    /**
     * 百度图片
     */
    public static String PIC_PATH = ReloadableConfig.getProperty("PIC_PATH", "/banner/cover");
    /**
     * 优惠券图片
     */
    public static String COUPON_PATH = ReloadableConfig.getProperty("COUPON_PATH", "/banner/cover");


}
