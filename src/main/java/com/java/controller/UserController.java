package com.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.entity.User;
import com.java.service.UserService;
import com.java.utils.ComSize;
import com.java.utils.PageBean;
import com.java.utils.ResponseUtil;
import com.java.utils.StringUtil;
import com.java.utils.Tools;

@Controller
@RequestMapping("/user")
public class UserController {

	Logger logger=LoggerFactory.getLogger(this.getClass());
	@Autowired
	private UserService userService;
	
	/**
	 * 返回主页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="index.html",method=RequestMethod.GET)
	public String IndexHtml(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		return "index";
	}
	@RequestMapping(value="/userlist.html",method=RequestMethod.GET)
	public String userList(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		try {
			model.addAttribute("title", "用户管理");
			return "userIndex";
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return null;
		}
		
	}
	@RequestMapping(value="/list.action",method=RequestMethod.POST)
	public void list(@RequestParam(value="page",required=false) String page,@RequestParam(value="rows",required=false) String size,
			User user,HttpServletRequest request,HttpServletResponse response) throws Exception{
		try {
			PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(size));
			Map<String, Object> map=new HashMap<>();
			map.put("userName", StringUtil.formatLike(user.getUserName()));
			map.put("start", pageBean.getStart());
			map.put("size", pageBean.getPageSize());
			List<User> userlist=this.userService.find(map);
			Long total=this.userService.getTotal(map);
			JSONObject result=new JSONObject();
			JSONArray array=JSONArray.fromObject(userlist);
			result.put("rows",array);
			result.put("total", total);
			ResponseUtil.write(response, result);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}
	
	/**
	 * 修改用户或保存用户
	 * @param user
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/save.action",method=RequestMethod.POST)
	public void Save(User user,HttpServletRequest request,HttpServletResponse response) throws Exception{
		int resultTotal=0;
		if(user.getId()==null){
			user.setPassword(Tools.getMd5(user.getPassword()));
			resultTotal=userService.add(user);
		}else{
			user.setPassword(Tools.getMd5(user.getPassword()));
			resultTotal=userService.update(user);
		}
		JSONObject jsonObject=new JSONObject();
		if(resultTotal>0){
			jsonObject.put("success", true);
		}else{
			jsonObject.put("success", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	
	/**
	 * 删除用户
	 * @param ids
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/delete.action",method=RequestMethod.POST)
	public void DeleteUser(@RequestParam("ids") String ids,HttpServletRequest request,HttpServletResponse response) throws Exception{
		String[] idarray=ids.split(",");
		JSONObject jsonObject=new JSONObject();
		int resultTotal=0;
		for(String id: idarray){
			resultTotal+=userService.delete(Integer.parseInt(id));
		}
		if(resultTotal==idarray.length){
			jsonObject.put("success", true);
		}else{
			jsonObject.put("success", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
}
