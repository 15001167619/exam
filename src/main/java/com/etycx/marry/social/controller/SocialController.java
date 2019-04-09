package com.etycx.marry.social.controller;

import com.etycx.marry.common.config.Global;
import com.etycx.marry.social.util.Constans;
import com.etycx.marry.social.util.WeChatDevUtils;
import com.qq.connect.QQConnectException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import weibo4j.Oauth;
import weibo4j.model.WeiboException;
import weibo4j.util.WeiboConfig;

import java.io.IOException;

@Controller
@Slf4j
@RequestMapping("/social")
public class SocialController extends BaseController {

	@RequestMapping("/weibo")
	public void weibo() throws WeiboException, IOException {
		updateProperties();
		Oauth oauth = new Oauth();
		String url = oauth.authorize("code","");
		getResponse().sendRedirect(url);
	}
	
	@RequestMapping("/wechat")
	public void wechat() throws IOException, Exception {
		String state = getUUID();
		getRequest().getSession().setAttribute("state", state);
		getResponse().sendRedirect(WeChatDevUtils.getQrconnect(Global.getConfig(Constans.WX.SOCIAL_LOGIN_REDIRECT_URI), state));
	}
	
	@RequestMapping("/mobile/wechat")
	public void mobileWechat() throws Exception {
		getRequest().getSession().setAttribute("state", "1");
		String redirectUrl = Global.getConfig(Constans.WX.SOCIAL_LOGIN_REDIRECT_URI);
		log.info("===================redirectUrl " + redirectUrl);
		String url = new WeChatDevUtils().getAuthrUrl(redirectUrl, "snsapi_userinfo");
		log.info("===================url " + url);
		getResponse().sendRedirect(url);		
	}
	
	@RequestMapping("/qq")
	public void qq() throws IOException, QQConnectException {
		getResponse().setContentType("text/html;charset=utf-8");
		getResponse().sendRedirect(new com.qq.connect.oauth.Oauth().getAuthorizeURL(getRequest()));
	}
	
	@RequestMapping("/faceBook")
	public String faceBook() {
		
		return "";
	}
	
	private void updateProperties() {
		WeiboConfig.updateProperties("client_ID", Global.getConfig(Constans.WEIBO.SOCIAL_LOGIN_CLIENT_ID));
		WeiboConfig.updateProperties("client_SERCRET", Global.getConfig(Constans.WEIBO.SOCIAL_LOGIN_CLIENT_SERCRET));
		WeiboConfig.updateProperties("redirect_URI", Global.getConfig(Constans.WEIBO.SOCIAL_LOGIN_REDIRECT_URI));
	}
	
}
