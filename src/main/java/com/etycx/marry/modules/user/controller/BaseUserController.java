package com.etycx.marry.modules.user.controller;

import com.alibaba.fastjson.JSONObject;
import com.etycx.marry.common.config.Const;
import com.etycx.marry.common.utils.*;
import com.etycx.marry.common.web.BaseController;
import com.etycx.marry.modules.sys.service.SystemService;
import com.etycx.marry.modules.user.entity.MarryUser;
import com.etycx.marry.modules.user.service.IUserService;
import com.etycx.marry.remote.redis.ICoreRedisService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class BaseUserController extends BaseController {

    @Autowired
    private IUserService iUserService;

    private static String login = "LOGIN_USER";

    public static String CURRENT_USER_ID = "CURRENT_USER_ID";

    private static String regist = "REGIST_CODE";

    public static String REDIS_USERID = "userId-";
    public static String REDIS_USER = "user-";

    @Autowired
    ICoreRedisService coreRedisService;
    /**
     * 用户账号密码登录
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/baseUserLogin", method = RequestMethod.POST)
    public String UserPswLogin(HttpServletRequest request, HttpServletResponse response, String tel, String pass, Model model) throws Exception {
        MarryUser marryUser = iUserService.getIUserByPhone(tel);
        if (marryUser != null) {
            if(SystemService.validatePassword(pass, marryUser.getPassword())){
                request.getSession().setAttribute(CURRENT_USER_ID,marryUser.getId());
                return "redirect:/index";
            }else{
                model.addAttribute("message",Const.LoginStatusEnum.WRONG_PASS.getValue());
                return "modules/jxweb/loginordinary";
            }
        } else {
            model.addAttribute("message",Const.LoginStatusEnum.NOT_FIND_USER.getValue());
            return "modules/jxweb/loginordinary";
        }
    }

    /**
     * 手机验证码登录
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/phoneLogin", method = RequestMethod.POST)
    public String phoneLogin(HttpServletRequest request, HttpServletResponse response, String tel, String Verification, Model model) throws Exception {
        MarryUser marryUser = iUserService.getIUserByPhone(tel);
        if (marryUser != null) {
            if(validateCode(tel,Verification)){
                request.getSession().setAttribute(CURRENT_USER_ID,marryUser.getId());
                return "redirect:/index";
            }else{
                model.addAttribute("message",Const.LoginStatusEnum.WRONG_VERIFICATION_CODE.getValue());
                return "modules/jxweb/loginphone";
            }
        } else {
            model.addAttribute("message",Const.LoginStatusEnum.NOT_FIND_USER.getValue());
            return "modules/jxweb/loginphone";
        }
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
     * 获取用户id
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    public Object getUserId(HttpServletRequest request) throws Exception
    {
        HttpSession session = request.getSession();
        if(session!=null){
            Object login = session.getAttribute("login");
            if(login!=null){
                return login;
            }
        }
        return "false";
    }

    /**
     *
     * 用户注册
     * @param password
     * @param confirmPassword
     * @return
     */
    @RequestMapping(value = "/registUser",method = RequestMethod.POST)
    public String regist(HttpServletRequest request, @RequestParam("tel") String tel, @RequestParam("Verification") String verification, @RequestParam("pass")String password, @RequestParam("sure_pass")String confirmPassword,Model model) {
        if (validateCode(tel, verification)) {
            if (!password.equals(confirmPassword)) {
                    model.addAttribute("message", Const.RegisterStatusEnum.WRONG_PASS.getValue());
                    return "modules/jxweb/register";
            } else {
                MarryUser user = iUserService.getIuser(tel);
                    if (null != user) {
                        model.addAttribute("message", Const.RegisterStatusEnum.WRONG_PHONE.getValue());
                        return "modules/jxweb/register";
                    } else {
                        MarryUser marryUser = new MarryUser();
                        marryUser.setPhoneNum(tel);
                        marryUser.setPassword(SystemService.entryptPassword(password));
                        marryUser.setName("会员");
                        marryUser.setHeadUrl("/marry/jxweb/jx/img/201901081037.jpg");
                        iUserService.save(marryUser);
                        request.getSession().setAttribute(CURRENT_USER_ID, marryUser.getId());
                        return "redirect:/index";
                    }
            }
        } else {
            model.addAttribute("message", Const.RegisterStatusEnum.WRONG_VERIFICATION_CODE.getValue());
            return "modules/jxweb/register";
        }
    }

    /**
     * 获取手机验证码
     * @param tel
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getVerificationCode",method = RequestMethod.POST)
    @ResponseBody
    public String sendMassage(String tel,HttpServletRequest request)throws Exception{
        String code=RandomNum.getNonce_str();
        JSONObject _result= new JSONObject();
        if(Const.SendoCodeStatusEnum.SEND_SUCCESS.getCode()==DysmsUtil.sendSMS(tel,code)){
            coreRedisService.addToRedis(tel,code,300);
            _result.put("code",Const.SendoCodeStatusEnum.SEND_SUCCESS.getCode());
            _result.put("message",Const.SendoCodeStatusEnum.SEND_SUCCESS.getValue());
        }else{
            _result.put("code",Const.SendoCodeStatusEnum.UNKONW_WRONG.getCode());
            _result.put("message",Const.SendoCodeStatusEnum.UNKONW_WRONG.getValue());
        }
        return _result.toJSONString();
    }


}
