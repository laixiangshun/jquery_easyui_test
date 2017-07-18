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
  	<base href="<%=basePath%>">
    <title>${title}</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/locale/easyui-lang-zh_CN.js"></script>
	<style type="text/css">
		.title_bar{
			float: right;
			position: absolute;
			right: 20px;
			bottom: 5px;
		}
		.tabs{
			background: #eaf2ff;
			height: 80px;
		}
		.layout{
			margin-top: -10px;
		}
		.content{
			margin-right: 5px;
		}
		.footer{
			height: 60px;
			background: #eaf2ff;
			text-align: center;
			font-size: 14px;
			color: #00bcd4;
		}
		.footer p{
			margin: 0;
			padding: 5px;
		}
		#layout{
			color: blue;
		}
		#layout:hover{
			cursor: pointer;
			text-decoration: underline;
			font-size: 16px;
		}
	</style>
  </head>
  
  <body>
   <div class="easyui-layout" split="true" style="width:100%;height:100%;">
  		<div region="north" split="true" title="" class="tabs">
  			<div class="title_bar">
  				<span>${username}&nbsp;&nbsp;&nbsp;&nbsp;欢迎你使用本系统</span>
  				<a id="layout">退出</a>
  			</div>
  		</div>
  		<div region="west" split="true" title="功能菜单" style="width:150px;">
  			<p style="padding: 5px;margin: 0;">系统管理</p>
  			<ul>
  				<li><a href="javascript:void(0);" onclick="showcontent('${pageContext.request.contextPath}/user/userlist.html')">用户管理</a></li>
  			</ul>
  		</div>
  		<div region="center" id="content" class="content" title=""></div>
  		<div region="south" split="true" title="" class="footer">
  			<p>所有权归@copyRight:lai</p>
  			<p>地址:高新区孵化园</p>
  		</div>
  	</div>
  	<script type="text/javascript">
  		function showcontent(url){
  			if(url!=null){
  				$.ajax({
  					url: url,
  					type: "get",
  					success: function(data){
  						$("#content").html(data);
  					}
  				});
  			}
  		}
  		$(document).ready(function(){
  			footerPosition();//footer自适应页面高度，始终位于页面底部
  		});
  		function footerPosition(){
  			var width=window.innerHeight;
  			var headerheight=$(".tabs").height();
  			var footerheight=$(".footer").height();
  			var minheight=width-headerheight-footerheight-10;
  			$("#content").css("minHeight",Math.max(634,minheight));
  		}
  		$("#layout").click(function(){
  			var url="${pageContext.request.contextPath}/logout.action";
  			$.ajax({
  				url: url,
  				type: "post",
  				cache: false,
  				dataType: "json",
  				success: function(data){
  					if(data.success){
  						window.location.href="${pageContext.request.contextPath}/login.html";
  					}else{
  						$.messager.alert("系统提示","退出失败");
  					}
  				}
  			});
  		});
  	</script>
  </body>
</html>
