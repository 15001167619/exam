package com.etycx.marry.social.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

@Slf4j
public class BaseController {

	
	private static ThreadLocal<ServletRequest> currentRequest = new ThreadLocal<>();
	private static ThreadLocal<ServletResponse> currentResponse = new ThreadLocal<>();
	
	@ModelAttribute
	public void init(HttpServletRequest request, HttpServletResponse response) {
		currentRequest.set(request);
		currentResponse.set(response);
		getRequest().getSession().setAttribute("login_current_url", getRequest().getHeader("Referer"));
		log.info("================login_current_url " + getRequest().getHeader("Referer"));
	}
	
	public HttpServletRequest getRequest() {
		return (HttpServletRequest) currentRequest.get();
	}
	

	public HttpServletResponse getResponse() {
		return (HttpServletResponse) currentResponse.get();
	}
	
	public static final String SUCESS = "success";

	public static final String FAILURE = "failure";

	public static final String ERROR = "error";

	public static final String JSON_VIEW = "json/json";
	
	public static String getUUID() {
		String s = UUID.randomUUID().toString();
		return (s.substring(0, 8) + s.substring(9, 13) + s.substring(14, 18) + s.substring(19, 23) + s.substring(24)).substring(0, 32);
	}

}
