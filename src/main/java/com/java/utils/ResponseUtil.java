package com.java.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ResponseUtil {

	public static void write(HttpServletResponse response,Object object) throws Exception{
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer=response.getWriter();
		writer.println(object);
		writer.flush();
		writer.close();
	}
}
