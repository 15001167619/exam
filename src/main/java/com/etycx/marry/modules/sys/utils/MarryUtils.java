package com.etycx.marry.modules.sys.utils;

import com.etycx.marry.common.utils.SpringContextHolder;
import com.etycx.marry.modules.diary.dao.MarryDiaryDao;

public class MarryUtils {

    private static MarryDiaryDao dictDao = SpringContextHolder.getBean(MarryDiaryDao.class);

    /**
     * 根据type获取别名
     * @param type
     * @return 取不到返回 默认 日记
     */
    public static String getMarryDiaryName(Integer type){
        String typeName = "日记";
        if (type ==  null || type == 0){
           return typeName;
        }
        if (type == 1){
            typeName = "活动";
        }
        return typeName;
    }

    public static String getMarryDictName(Integer type){
        String typeName = "婚礼策划";
        if (type ==  null){
           return typeName;
        }
        switch(type){
            case 0:
                typeName = "婚礼策划";
                break;
            case 1:
                typeName = "婚纱摄影";
                break;
            case 2:
                typeName = "艺术写真";
                break;
            case 3:
                typeName = "婚纱礼服";
                break;
            case 4:
                typeName = "结婚钻戒";
                break;
            case 5:
                typeName = "结婚用品";
                break;
            case 6:
                typeName = "蜜月旅行";
                break;
            case 7:
                typeName = "酒店预订";
                break;
            case 8:
                typeName = "推荐攻略";
                break;
        }
        return typeName;
    }

}
