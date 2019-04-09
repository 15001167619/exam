package com.etycx.marry.social.interceptor;

import com.etycx.marry.modules.user.controller.BaseUserController;
import com.etycx.marry.social.controller.BaseController;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Slf4j
@Data
public class ContextInterceptor extends HandlerInterceptorAdapter {

	public String defaultLogin = "/loginordinary";
	public Map<String,String> defineUrls;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String requestMethod = request.getRequestURI();
		if(requestMethod==null)
			return false;
		if(requestMethod.contains("/")){
			int length = requestMethod.length();
			requestMethod = requestMethod.substring(requestMethod.lastIndexOf("/"),length);
		}
		if(defineUrls!=null&&defineUrls.size()>0){
			if(defineUrls.containsKey(requestMethod)){
				//查看用户是否登录
				if(request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID) == null){
					if(requestMethod.endsWith("loginordinary")){
						return true;
					}
					response.sendRedirect(request.getContextPath() + defaultLogin);
					log.info("跳转到login页面 -------- "+request.getContextPath() + defaultLogin+"-----");
					return false;
				}
			}
		}
		new BaseController().init(request, response);
		return super.preHandle(request, response, handler);
	}
}
