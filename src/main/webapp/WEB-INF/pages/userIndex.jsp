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
  	<%-- <base href="<%=basePath%>">
    <title>${title}</title> --%>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/locale/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body>
  		<table id="dg" title="用户管理" class="easyui-datagrid" fitColumns="true" toolbar="#tb"
  			pagination="true" rownumbers="true" url="${pageContext.request.contextPath}/user/list.action" fit="true">
  			<thead>
  				<tr>
  					<th field="cb" checkbox="true" align="center"></th>
	                <th field="id" width="50" align="center">编号</th>
	                <th field="userName" width="50" align="center">用户名</th>
	                <th field="password" width="50" align="center">密码</th>
	                <th field="trueName" width="50" align="center">真实姓名</th>
	                <th field="email" width="50" align="center">邮件</th>
	                <th field="phone" width="50" align="center">联系电话</th>
	                <th field="roleName" width="50" align="center">角色</th>
  				</tr>
  			</thead>
  		</table>
  		<div id="tb">
  			<a onclick="openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
  			<a href="javascript:openUserModifyDialog();" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
  			<a href="javascript:deleteUser();" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</a>
  			
  			<div>&nbsp;用户名：&nbsp;
  			  	<input type="text" id="s_userName" size="20" onkeydown="if(event.keyCode == 13)searchUser()" />
  			  	<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
  			  	<a href="javascript:reset();" class="easyui-linkbutton" iconCls="icon-reload" plain="true">重置</a>
        	</div>
        	<div id="dlg-buttons">
            	<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a> 
                <a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
       		</div>
       		
       		<div id="dlg" class="easyui-dialog" style="width: 730px;height:280px;padding:10px 10px;" closed="true"
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
  		</div>
  </body>
  <script type="text/javascript">
  	var url;
  	$(document).ready(function(){
  		//searchUser(1);
  	});
  	function searchUser(pageIndex){
  		//$("#dg").datagrid('load',{"userName": $("#s_userName").val(),"page": pageIndex});
  		$("#dg").datagrid('load',{"userName": $("#s_userName").val()});
  	}
  	//添加用户
  	function openUserAddDialog(){
  		$("#dlg").dialog("open").dialog("setTitle","添加用户");
  		url="${pageContext.request.contextPath}/user/save.action";
  		resetValue();
  	}
  	//关闭弹出框
  	function closeUserDialog(){
  		$("#dlg").dialog("close");
  		resetValue();
  	}
  	function resetValue(){
	    $("#userName").val("");
        $("#password").val("");
        $("#trueName").val("");
        $("#email").val("");
        $("#phone").val("");
        $("#roleName").combobox("setValue","");
  	}
  	//保存用户
  	function saveUser(){
  		$("#fm").form("submit",{
  			url: url,
  			onSubmit: function(){
  				if($("#roleName").combobox("getValue")==""){
  					$.messager.alert("系统提示","请选择用户角色");
  					return false;
  				}
  				return $(this).form("validate");
  			},
  			success: function(result){
  				var result=eval('('+result+')');
  				if(result.success){
  					$.messager.alert("系统提示","操作成功");
  					resetValue();
  					$("#dlg").dialog("close");
  					$("#dg").datagrid("reload");
  				}else{
  					$.messager.alert("系统提示","操作失败");
  					return;
  				}
  			}
  		});
  	}
  	//修改
  	function openUserModifyDialog(){
  		var selectedRows=$("#dg").datagrid("getSelections");
  		if(selectedRows.length!=1){
  			$.messager.alert("系统提示","请选择一个用户进行修改");
  			return false;
  		}
  		var row=selectedRows[0];
  		$("#dlg").dialog("open").dialog("setTitle","修改用户");
  		$("#fm").form("load",row);
  		url="${pageContext.request.contextPath}/user/save.action?id="+row.id;
  	}
  	//删除用户
  	function deleteUser(){
  		var selectedRows=$("#dg").datagrid("getSelections");
  		if(selectedRows.length==0){
  			$.messager.alert("系统提示","请选择用户进行删除");
  			return false;
  		}
  		var idarray=[];
  		for(var i=0;i<selectedRows.length;i++){
  			idarray.push(selectedRows[i].id);
  		}
  		var ids=idarray.join(",");
  		$.messager.confirm("系统提示","你确定要删除这<font color='red'>"+selectedRows.length+"</font>条数据吗？",function(r){
  			if(r){
  				$.post("${pageContext.request.contextPath}/user/delete.action",{"ids": ids},function(data){
  					if(data.success){
  						$.messager.alert("系统提示","用户删除成功");
  						$("#dg").datagrid("reload");
  					}else{
  						$.messager.alert("系统提示","数据删除失败");
  					}
  				},"json");
  			}
  		});
  	}
  	//重置
  	function reset(){
  		window.location.reload(true);
  	}
  </script>
</html>
