package com.java.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.java.entity.User;

public class ValidateInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		String url=request.getRequestURI();
		if(url.endsWith("login.html")==true || url.endsWith("login.action")==true || url.endsWith("/sinup.action")==true){
			return true;
		}else{
			if(user==null){
				System.out.println(request.getContextPath());
				response.sendRedirect(request.getContextPath()+"/login.html");
				return false;
			}
			return true;
		}
	}
}
