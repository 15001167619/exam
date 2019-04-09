package com.etycx.marry.api;

import com.alibaba.fastjson.JSONObject;
import com.etycx.marry.common.base.ApiBaseController;
import com.etycx.marry.common.config.ConfigConstants;
import com.etycx.marry.common.config.Const;
import com.etycx.marry.common.utils.DateUtils;
import com.etycx.marry.common.utils.FileUtils;
import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.modules.comment.service.MarryCommentService;
import com.etycx.marry.modules.diary.service.MarryDiaryService;
import com.etycx.marry.modules.operation.entity.MarryOperation;
import com.etycx.marry.modules.operation.service.MarryOperationService;
import com.etycx.marry.modules.product.service.MarryProductService;
import com.etycx.marry.modules.strategy.service.MarryStrategyService;
import com.etycx.marry.modules.sys.service.SystemService;
import com.etycx.marry.modules.user.controller.BaseUserController;
import com.etycx.marry.modules.user.entity.MarryUser;
import com.etycx.marry.modules.user.service.IUserService;
import com.etycx.marry.modules.user.service.MarryUserService;
import com.etycx.marry.remote.redis.ICoreRedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

import static com.etycx.marry.modules.user.controller.BaseUserController.REDIS_USER;

@Controller
@WebAppConfiguration
@RequestMapping(value = "api", produces = "application/json;charset=UTF-8")
public class ApiController extends ApiBaseController {

    @Autowired
    private MarryDiaryService diaryService;
    @Autowired
    private MarryProductService productService;
    @Autowired
    private MarryOperationService operationService;
    @Autowired
    private MarryCommentService commentService;
    @Autowired
    private MarryUserService marryUserService;
    @Autowired
    private MarryStrategyService marryStrategyService;
    @Autowired
    ICoreRedisService coreRedisService;
    @Autowired
    private IUserService iUserService;

    @ResponseBody
    @RequestMapping(value = "user/addOperation", method = RequestMethod.POST)
    public Object addOperation(@RequestParam("userId") Integer userId,@RequestParam("businessId") Integer businessId,@RequestParam("businessType") Integer businessType) {
        if (businessId == null || userId == null || businessType == null) {
            return getErrorObject();
        }
        operationService.save(new MarryOperation(userId,businessType,businessId));
        return true;
    }

    @ResponseBody
    @RequestMapping(value = "diary/getDiaryList", method = RequestMethod.GET)
    public Object getDiaryList(@RequestParam("pageNo") Integer pageNo,@RequestParam("pageSize") Integer pageSize,@RequestParam("type") Integer type) {
        if (pageNo == null || type == null || pageSize == null) {
            return getErrorObject();
        }
        return diaryService.getDiaryList(type,pageNo,pageSize);
    }

    @ResponseBody
    @RequestMapping(value = "strategy/getStrategyList", method = RequestMethod.GET)
    public Object getStrategyList(@RequestParam("pageNo") Integer pageNo,@RequestParam("pageSize") Integer pageSize,@RequestParam("type") Integer type) {
        if (pageNo == null || type == null || pageSize == null) {
            return getErrorObject();
        }
        return marryStrategyService.getStrategyList(type,pageNo,pageSize);
    }
    @ResponseBody
    @RequestMapping(value = "operation/getOperationList", method = RequestMethod.GET)
    public Object getOperationList(@RequestParam(value = "userId",required = false) Integer userId,@RequestParam("pageNo") Integer pageNo,@RequestParam("pageSize") Integer pageSize,@RequestParam("businessType") Integer businessType,@RequestParam(value = "type",required = false) Integer type) {
        if (pageNo == null || businessType == null || pageSize == null || userId == null) {
            return getErrorObject();
        }
        return operationService.getOperationList(userId,businessType,type,pageNo,pageSize);
    }

    @ResponseBody
    @RequestMapping(value = "evaluation/getUserEvaluationList", method = RequestMethod.GET)
    public Object getUserEvaluationList(@RequestParam(value = "userId") Integer userId,@RequestParam("pageNo") Integer pageNo,@RequestParam("pageSize") Integer pageSize) {
        if (pageNo == null || pageSize == null || userId == null) {
            return getErrorObject();
        }
        return commentService.getUserEvaluationList(userId,pageNo,pageSize);
    }

    @ResponseBody
    @RequestMapping(value = "product/getProductList", method = RequestMethod.GET)
    public Object getProductList(@RequestParam(value = "userId",required = false) Integer userId,@RequestParam("pageNo") Integer pageNo,@RequestParam("pageSize") Integer pageSize,
                                 @RequestParam("type") Integer type,
                                 @RequestParam("totalCategory") Integer totalCategory,
                                 @RequestParam("dictIds") String dictIds,@RequestParam("topOn") Integer topOn) {
        if (pageNo == null || type == null || pageSize == null) {
            return getErrorObject();
        }
        return productService.getProductList(type,pageNo,pageSize,dictIds,topOn,totalCategory,userId);
    }

    @ResponseBody
    @RequestMapping(value = "product/getSearchList", method = RequestMethod.GET)
    public Object getSearchList(@RequestParam(value = "userId",required = false) Integer userId,@RequestParam("pageNo") Integer pageNo,@RequestParam("pageSize") Integer pageSize,
                                 @RequestParam("searchContent") String searchContent) {
        if (pageNo == null || StringUtils.isBlank(searchContent) || pageSize == null) {
            return getErrorObject();
        }
        return productService.getSearchList(pageNo,pageSize,searchContent,userId);
    }

    @ResponseBody
    @RequestMapping(value = "product/getPageTurningList", method = RequestMethod.GET)
    public Object getPageTurningList(@RequestParam("pageNo") Integer pageNo,@RequestParam("pageSize") Integer pageSize,@RequestParam("type") Integer type) {
        if (pageNo == null || type == null || pageSize == null) {
            return getErrorObject();
        }
        return productService.getPageTurningList(type,pageNo,pageSize);
    }

    @ResponseBody
    @RequestMapping(value = "user/addComment", method = RequestMethod.POST)
    public Object addComment(@RequestParam(value = "hasPicture",defaultValue = "0") Integer hasPicture,
                             @RequestParam(value = "picUrls",required = false) String picUrls,
                             @RequestParam("userId") Integer userId,@RequestParam("businessId") Integer businessId,@RequestParam("pId") Integer pId,@RequestParam("content") String content) {
        if (businessId == null || userId == null || pId == null || StringUtils.isBlank(content)) {
            return getErrorObject();
        }
        return commentService.addComment(userId,businessId,pId,content,hasPicture,picUrls);
    }

    @ResponseBody
    @RequestMapping(value = "user/childCommentList", method = RequestMethod.GET)
    public Object childCommentList(@RequestParam("pageNo") Integer pageNo,@RequestParam("pageSize") Integer pageSize,@RequestParam("businessId") Integer businessId,@RequestParam("pId") Integer pId) {
        if (pageNo == null || businessId == null || pageSize == null || pId == null) {
            return getErrorObject();
        }
        return commentService.childCommentList(businessId,pId,pageNo,pageSize);
    }

    /**
     * @author 武海升
     */
    @RequestMapping(value = "user/headPic")
    @ResponseBody
    public String coverPicUpload(MultipartFile file) {
        JSONObject jsonObject = FileUtils.setFilenamePath(file, ConfigConstants.BANNER_COVER);
        //上传图片
        FileUtils.uploadFile(file,jsonObject.getString("filenamePath"));
        String returnFilenamePath = jsonObject.getString("returnFilenamePath");
        System.out.println(returnFilenamePath);
        return returnFilenamePath;
    }
    /**
     * @author yuanc
     */
    @RequestMapping(value = "user/userInfo")
    @ResponseBody
    public String updateUserInfo(String userId,
                                  String headUrl,
                                  String name,
                                 Integer sex,
                                  String birthday,
                                 String weddingDate) {
//        MarryUser user = new MarryUser();
//        user.setId(userId);
//        user.setHeadUrl(headUrl);
//        user.setName(name);
//        user.setSex(sex);
//        user.setBirthday(DateUtils.parseDate(birthday));
//        user.setWeddingDate(DateUtils.parseDate(weddingDate));
        marryUserService.updateUser(userId,headUrl,name,sex,birthday,weddingDate);
        coreRedisService.addObjectData(REDIS_USER+userId,marryUserService.get(userId),86400);
        JSONObject _result = new JSONObject();
        _result.put("code",200);
        return _result.toJSONString();
    }
    /**
     * 验证验证码
     * @param tel 手机号
     * @param formCode 表单提交的验证码
     * @return 验证成功返回true
     */
    public  boolean validateCode(String tel, String formCode) {
        String code=coreRedisService.getRedisValueByKey(tel);
        return com.etycx.marry.common.utils.StringUtils.isNotEmpty(code)&&code.equalsIgnoreCase(formCode) == true ?  true :  false;
    }
    /**
     * @author yuanc
     */
    @RequestMapping(value = "user/updatePhone")
    @ResponseBody
    public String updatePhone(String userId,
                                 String tel,
                                 String verification) {
        MarryUser marryUser = iUserService.get(userId);
        JSONObject _result = new JSONObject();
        if (marryUser != null) {
            if(validateCode(tel,verification)){
                MarryUser newPhone = iUserService.getIUserByPhone(tel);
                if(null==newPhone){
                    marryUserService.updatePhone(marryUser.getId(),tel);
                    coreRedisService.addObjectData(REDIS_USER+userId,marryUserService.get(userId),86400);
                    _result.put("code",Const.LoginStatusEnum.UPDATE_PHONE_SUCCESS.getCode());
                    _result.put("message", Const.LoginStatusEnum.UPDATE_PHONE_SUCCESS.getValue());
                    return _result.toJSONString();
                }else{
                    _result.put("code",Const.LoginStatusEnum.WRONG_PHONE.getCode());
                    _result.put("message", Const.LoginStatusEnum.WRONG_PHONE.getValue());
                    return _result.toJSONString();
                }
            }else{
                _result.put("code",Const.LoginStatusEnum.WRONG_VERIFICATION_CODE.getCode());
                _result.put("message", Const.LoginStatusEnum.WRONG_VERIFICATION_CODE.getValue());
                return _result.toJSONString();
            }
        }else{
            _result.put("code",Const.LoginStatusEnum.NOT_FIND_USER.getCode());
            _result.put("message", Const.LoginStatusEnum.NOT_FIND_USER.getValue());
            return _result.toJSONString();
        }

    }
    /**
     * @author yuanc
     */
    @RequestMapping(value = "user/updatePassword")
    @ResponseBody
    public String updatePhone(String userId,
                              String ordPass,
                              String newPass,
                              String surePass) {
        MarryUser marryUser = iUserService.get(userId);
        JSONObject _result = new JSONObject();
        if (marryUser != null) {
            if(SystemService.validatePassword(ordPass, marryUser.getPassword())){
                    if(newPass.equals(surePass)){
                        marryUserService.updatePassword(marryUser.getId(),SystemService.entryptPassword(newPass));
                        coreRedisService.addObjectData(REDIS_USER+userId,marryUserService.get(userId),86400);
                        _result.put("code",Const.LoginStatusEnum.UPDATE_PASSWORD_SUCCESS.getCode());
                        _result.put("message", Const.LoginStatusEnum.UPDATE_PASSWORD_SUCCESS.getValue());
                        return _result.toJSONString();
                    }else{
                        _result.put("code",Const.LoginStatusEnum.DISACCORD_PASS.getCode());
                        _result.put("message", Const.LoginStatusEnum.DISACCORD_PASS.getValue());
                        return _result.toJSONString();
                    }

            }else{
                _result.put("code",Const.LoginStatusEnum.OLD_WRONG_PASS.getCode());
                _result.put("message", Const.LoginStatusEnum.OLD_WRONG_PASS.getValue());
                return _result.toJSONString();
            }
        }else{
            _result.put("code",Const.LoginStatusEnum.NOT_FIND_USER.getCode());
            _result.put("message", Const.LoginStatusEnum.NOT_FIND_USER.getValue());
            return _result.toJSONString();
        }

    }



    /**
     * 退出登录
     * @author yuanc
     */
    @RequestMapping(value = "user/logOut")
    @ResponseBody
    public String logOut(HttpServletRequest request) {
            request.getSession().removeAttribute(BaseUserController.CURRENT_USER_ID);
            JSONObject _result= new JSONObject();
            _result.put("code",200);
            return _result.toJSONString();
    }
    /**
     * @param files 文件集
     */
    @RequestMapping(value = "user/commentPicUpload",method = RequestMethod.POST)
    @ResponseBody
    public String commodityUrlPicUpload(@RequestParam(value = "imgFile", required = false) MultipartFile[] files) {
        MultipartFile file = null;
        if (files != null && files.length > 0) {
            for (int i = 0; i < files.length; i++) {
                file = files[i];
            }
        }
        JSONObject jsonObject = FileUtils.setFilenamePath(file, ConfigConstants.MARRY_PRODUCT_LIST_COVER);
        FileUtils.uploadFile(file,jsonObject.getString("filenamePath"));
        return jsonObject.getString("returnFilenamePath");
    }



}
