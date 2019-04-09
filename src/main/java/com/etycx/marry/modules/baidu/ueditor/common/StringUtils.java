package com.etycx.marry.modules.baidu.ueditor.common;

/**
 * @author 武海升
 * @version 2.0
 * @description
 * @date 2017-09-28 14:28
 */
public class StringUtils {
    /**
     * 判断字符串是否为空
     * @param str
     * @return
     */
    public static boolean isEmpty(String str){
        return (str == null || "".equals(str.trim()));
    }

    /**
     * 获取名称后缀
     * @param name
     * @return
     */
    public static String getExt(String name){
        if(name == null || "".equals(name) || !name.contains("."))
            return "";
        return name.substring(name.lastIndexOf(".")+1);
    }
}
