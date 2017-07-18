package com.java.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.entity.User;
import com.java.service.UserService;
import com.java.utils.ResponseUtil;
import com.java.utils.Tools;

@Controller
public class LoginController {

	Logger logger=LoggerFactory.getLogger(this.getClass());
	@Autowired 
	private UserService userService;
	/**
	 * µÇÂ¼½çÃæ
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login.html",method=RequestMethod.GET)
	public String LoginHtml(HttpServletRequest request,HttpServletResponse response) throws Exception{
		return "login2";
	}
	
	/**
	 * µÇÂ¼
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/login.action",method=RequestMethod.POST)
	public void Login(HttpServletRequest request,HttpServletResponse response) throws Exception{
		try {
			
			String userName=request.getParameter("userName");
			String password=request.getParameter("password");
			User user=new User();
			if(userName!=null && userName!="" && password!=null && password!=""){
				user.setUserName(userName);
				user.setPassword(password);
			}
			User userresult=this.userService.login(user);
			JSONObject jsonObject=new JSONObject();
			if(userresult==null){
				jsonObject.put("success", false);
				jsonObject.put("errMsg", "ÓÃ»§Ãû»òÃÜÂë´íÎó");
			}else{
				HttpSession session=request.getSession();
				session.setAttribute("user", userresult);
				String token=session.getId();
				session.setAttribute("token", Tools.getMd5(token));
				jsonObject.put("success", true);
			}
			ResponseUtil.write(response, jsonObject);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}
	
	@RequestMapping(value="/sinup.action",method=RequestMethod.POST)
	public void Sinup(User user,HttpServletRequest request,HttpServletResponse response) throws Exception{
		try {
			int resultTotal=0;
			user.setPassword(Tools.getMd5(user.getPassword()));
			resultTotal=userService.add(user);
			JSONObject jsonObject=new JSONObject();
			if(resultTotal>0){
				jsonObject.put("success", true);
			}else{
				jsonObject.put("success", false);
			}
			ResponseUtil.write(response, jsonObject);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}
	/**
	 * ÍË³öµÇÂ¼
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/logout.action",method=RequestMethod.POST)
	public void Logout(HttpServletRequest request,HttpServletResponse response) throws Exception{
		JSONObject jsonObject=new JSONObject();
		try {
			HttpSession session=request.getSession();
			session.removeAttribute("token");
			session.removeAttribute("user");
			jsonObject.put("success", true);
		} catch (Exception e) {
			jsonObject.put("success", false);
			logger.error(e.getMessage(),e);
		}
		ResponseUtil.write(response, jsonObject);
	}
}
