package com.etycx.marry.modules.baidu.ueditor.common;

import java.util.Random;

/**
 * @author 武海升
 * @version 2.0
 * @description
 * @date 2017-09-28 14:29
 */
public class RandomUtils {
    /**
     * 获取指定位数的随机数
     * @param num
     * @return
     */
    public static String getRandom(int num){
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for(int i = 0;i < num; i++){
            sb.append(String.valueOf(random.nextInt(10)));
        }
        return sb.toString();
    }
}
