<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/easyui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/icon.css">
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/locale/easyui-lang-zh_CN.js"></script>
	<script src="${pageContext.request.contextPath}/js/md5.js"></script>
  </head>
  
  <body>
     <div id="loginwin" class="easyui-window" title="登录" style="width: 500px;height:380px;padding:10px 10px;"
     	minimizable="false" maximizable="false" resizable="false" collapsible="false">
   		<div class="easyui-layout" fit="true">
   			<h1>XXX个人系统登录</h1>
   			<div region="center" border="false" style="padding: 5px;background: #fff;border: 1px solid #ccc;">
   				<div style="padding: 5px 0;">
   					<label for="userName">用户名:</label>
   					<input type="text" name="userName" style="width:260px;">
   				</div>
   				<div style="padding: 5px 0;">
   					<label for="password">密码:</label>
   					<input type="password" name="password" style="width:260px;">
   				</div>
   				<div style="padding:5px 0;text-align: center;color: red;" id="showMsg"></div>
   			</div>
   			<div region="south" border="false" style="text-align: right;padding: 5px 0;">
   				<a class="easyui-linkbutton" iconcls="icon-ok" href="javascript:void(0);" onclick="login();">登录</a>
   			</div>
   		</div>
     </div>
  </body>
</html>
