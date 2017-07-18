<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="include/path_lib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>

	<!-- <meta name="viewport" content="width=device-width" /> -->
	<link rel="stylesheet" type="text/css" href="${path}/css/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${path}/css/default/icon.css">
	<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${path}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${path}/js/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${path}/js/md5.js"></script>

	<style type="text/css">
		html,body{
			margin: 0 auto;
			padding: 0;
			background: #9e9e9e;
		}
		.div_btn{
			text-align: center;
		}
		.btn_login{
			width: 200px;
			height: 35px;
			background: #00bcd4;
			padding: 5px 5px;
			margin-top: 5px;
			font-size: 18px;
			display: inline-block;
			vertical-align: baseline;
			outline: none;
			cursor: pointer;
			text-shadow: 0 1px 1px rgba(0,0,0,.3);
			border-radius: .5em;
			box-shadow: 0 1px 2px rgba(0,0,0,.2);
		}
		#loginwin .name{
			display: inline-block;
			width: 60px;
			line-height: 30px;
			font-size: 16px;
			font-style: inherit;
		}
		.form-name{
			width: 350px;
			height: 30px;
			line-height: 30px;
			border-radius: 4px;
			boder: 1px solid #c8cccf;
			color:#6a6f77;
			outline: none;
			text-decoration: none;
			-web-kit-appearance: none;
			-moz-appearance: none;
			box-sizing: border-box;
		}
		input:focus{
			border: 1px solid #ff7496;
		}
		.div_btn a{
			text-decoration: none;
		}
		.div_btn a:hover{
			text-decoration: underline;
		}
	</style>
  </head>
  
  <body>
  		<div id="loginwin" class="easyui-window" title="登录" style="width: 500px;height:200px;padding:5px 10px"
     	minimizable="false" maximizable="false" resizable="false" collapsible="false" closable="false">
   		<div class="easyui-layout" fit="true">
   			<!-- <h1>XXX个人系统登录</h1> -->
   			<div border="false" style="padding: 5px;background: #fff;border: 1px solid #ccc;">
   				<div style="padding: 5px 0;">
   					<span class="name">用户名:</span>
   					<input type="text" name="userName" id="name" class="form-name easyui-validatebox" placeholder="输入用户名">
   				</div>
   				<div style="padding: 5px 0;">
   					<span class="name">密&emsp;码:</span>
   					<input type="password" name="password" id="pass" class="form-name easyui-validatebox" placeholder="输入密码">
   				</div>
   				<div style="padding:5px 0;text-align: center;color: red;" id="showMsg"></div>
   				<div class="div_btn">
	   				<button class="btn_login" onclick="login();">登&emsp;&emsp;录</button>
	   				<a href="javascript:void(0);" onclick="sinup();">还没有账号，点击注册</a>
	   			</div>
   			</div>
   		</div>
     </div>
     
     <div id="dlg-buttons">
     	<a href="javascript:back()" class="easyui-linkbutton" iconCls="icon-undo">返回登录</a>
    	<a href="javascript:save()" class="easyui-linkbutton" iconCls="icon-ok">保存</a> 
	</div>
     <!-- 注册 -->
     <div id="dlg" class="easyui-dialog" style="width: 730px;height:280px;padding:10px 10px;" data-options="closable: false"
	            buttons="#dlg-buttons">
	            <form method="post" id="fm">
	                <table cellspacing="8px;">
	                    <tr>
	                        <td>用户名：</td>
	                        <td><input type="text" id="userName" name="userName"
	                            class="easyui-validatebox" required="true" />&nbsp;<span
	                            style="color: red">*</span>
	                        </td>
	                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                        <td>密码：</td>
	                        <td><input type="password" id="password" name="password"
	                            class="easyui-validatebox" required="true" />&nbsp;<span
	                            style="color: red">*</span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>真实姓名：</td>
	                        <td><input type="text" id="trueName" name="trueName"
	                            class="easyui-validatebox" required="true" />&nbsp;<span
	                            style="color: red">*</span>
	                        </td>
	                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                        <td>邮箱：</td>
	                        <td><input type="text" id="email" name="email"
	                            validType="email" class="easyui-validatebox" required="true" />&nbsp;<span
	                            style="color: red">*</span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>联系电话：</td>
	                        <td><input type="text" id="phone" name="phone"
	                            class="easyui-validatebox" required="true" />&nbsp;<span
	                            style="color: red">*</span>
	                        </td>
	                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                        <td>用户角色：</td>
	                        <td><select name="roleName" class="easyui-combobox"
	                            id="roleName" style="width: 154px;" editable="false"
	                            panelHeight="auto">
	                                <option value="">请选择角色</option>
	                                <option value="系统管理员">系统管理员</option>
	                                <option value="销售主管">销售主管</option>
	                                <option value="客户经理">客户经理</option>
	                                <option value="高管">高管</option>
	                        </select> &nbsp;<span style="color: red">*</span>
	                        </td>
	                    </tr>
	                </table>
	            </form>
        	</div>
  </body>
  <script type="text/javascript">
  	$(document).ready(function(){
  		reset();
  		$("input[name='userName']").focus();
  		$("#dlg").dialog("close");
  	});
  	function reset(){
  		$("#pass").val("");
  		$("#name").val("");
  		$("#fm").form("clear");
  	}
  	document.onkeydown=function(e){
  		var event=e || window.event;
  		var code=event.keyCode || event.which || event.charCode;
  		if(code==13){
  			login();
  		}
  	};
  	function login(){
  		if($("#name").val()==null || $("#name").val()==""){
  			$.messager.alert("系统消息","用户名为空");
  			$("#name").focus();
  			return false;
  		}
  		if($("#pass").val()==null || $("#pass").val()==""){
  			$.messager.alert("系统消息","密码为空");
  			$("#pass").focus();
  			return false;
  		}
  		$.ajax({
  			url: "${path}/login.action",
  			type: "post",
  			data: {
  				"userName": $("#name").val(),
  				"password": hex_md5($("#pass").val())
  			},
  			cache: false,
  			dataType: "json",
  			success: function(data){
  				if(data.success){
  					window.location.href="${path}/user/index.html";
  				}else{
  					$.messager.alert("系统消息",data.errMsg);
  				}
  			},
  			error: function(request){
  				$.messager.alert("系统提示",request);
  			}
  		});
  	}
  	function sinup(){
  		$("#loginwin").window("close");
  		$("#dlg").dialog("open").dialog("setTitle","注册用户");
  	}
  	var userName=null,password=null;
  	function save(){
  		userName=$("#userName").val();
		password=$("#password").val();
  		$("#fm").form("submit",{
  			url: "${path}/sinup.action",
  			onSubmit: function(){
  				if($("#roleName").combobox("getValue")==""){
  					$.messager.alert("系统提示","请选择用户角色");
  					return false;
  				}
  				return $(this).form("validate");
  			},
  			success: function(data){
  				var result=eval('('+data+')');
  				if(result.success){
  					//$.messager.alert("系统提示","注册成功");
  					
  					$("#dlg").dialog("close");
  					$("#loginwin").window("open");
  					$("#name").val(userName);
  					$("#pass").val(password);
  					/* $.ajax({
			  			url: "${path}/login.action",
			  			type: "post",
			  			data: {
			  				"userName": userName,
			  				"password": hex_md5(password)
			  			},
			  			cache: false,
			  			dataType: "json",
			  			success: function(data){
			  				if(data.success){
			  					window.location.href="${path}/user/index.html";
			  				}else{
			  					$.messager.alert("系统消息",data.errMsg);
			  				}
			  			},
			  			error: function(request){
			  				$.messager.alert("系统提示",request);
			  			}
			  		}); */
  					//window.location.href=$()
  				}else{
  					$.messager.alert("系统提示","注册失败,你可以重新注册");
  					return;
  				}
  			}
  		});
  	}
  	function back(){
  		$("#dlg").dialog("close");
  		$("#loginwin").window("open");
  	}
  </script>
</html>
