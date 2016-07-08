<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){
	/* 初始化搜索框 */
	$('#item-search').searchbox({ 
		searcher:function(value,name){ 
		alert(value + "," + name) 
		}, 
		menu:'#item-search-menu', 
		prompt:'请输入商品名称' ,
		width:300
		}); 
	/* 根据session判断是否有用户已登录 */
	$.ajax({
		url : '/myshop/cart/sessionCheck.action',
		dataType : 'json',
		success : function(result) {
			if (result.success) {
				$('#welcome').html(formatString('[<strong>{0}</strong>]，欢迎你！',result.obj));
			}
		}
	});	
	});

/* 打开普通用户登录对话框 */
function open_login_dialog(){
	$('#loginDialog').show().dialog({
		width: 400,
		height:200,
		title:'用户登录',
		closable : true,
		modal : true,
		buttons : [ {
			text : '注册',
			handler : function() {
			$('#user_reg_regDialog').dialog('open');
			}
		}, {
			text : '登录',
			handler : function() {
			 	$('#loginInputForm').form('submit',{
			 		url:'${pageContext.request.contextPath}/user/login.action',

			 				success : function(r) {
			 					r = $.parseJSON(r);
			 					if (r && r.success) {
			 						$('#loginDialog').dialog('close');
			 						$.messager.show({
			 							title : '提示',
			 							msg : r.msg
			 						});
			 						setTimeout(function(){
			 							location.href="index.jsp";},1000);			 						
			 					} else {
			 						$.messager.alert('提示', r.msg);
			 					}
			 				}
			 			});
		} 
	}]
	});
	$('#loginDialog').dialog('open');
}

/* 打开管理员用户登录对话框 */
function open_manager_dialog(){
 	$('#loginDialog').show().dialog({
		width: 400,
		height:200,
		title:'用户登录',
		closable : true,
		modal : true,
		buttons : [{
			text : '登录',
			handler : function() {
				
			 	$('#loginInputForm').form('submit',{
			 		url:'${pageContext.request.contextPath}/user/managerLogin.action',
			 				success : function(r) {
			 					r = $.parseJSON(r);
			 					if (r && r.success) {
			 						$('#loginDialog').dialog('close');
			 						$.messager.show({
			 							title : '提示',
			 							msg : r.msg
			 						});
			 						setTimeout(function(){
			 							location.href="manager.jsp";},1000);			 						
			 					} else {
			 						$.messager.alert('提示', r.msg);
			 					}
			 				}
			 			});
			 	/* $('#loginInputForm').form('submit'); */
		} 
	}]
	});
	$('#loginDialog').dialog('open');
}
/* 打开注册对话框 */
function open_reg_dialog(){
	$('#user_reg_regDialog').dialog('open');
}
</script> 
 	<!--  包含菜单的搜索框 -->
	<input id="item-search"></input> 
	<div id="item-search-menu" style="width:120px"> 
	<div data-options="name:'1',iconCls:'icon-ok'">All Items</div> 
	<div data-options="name:'2'">外套</div>
	<div data-options="name:'3'">内搭</div>
	<div data-options="name:'4'">裤装</div>
	<div data-options="name:'5'">运动鞋</div>
	<div data-options="name:'6'">运动服</div>
	<div data-options="name:'27'">特色男装</div>
	</div>
	<!-- 登录及注册按钮 -->
	<div id="RegAndLogin" style="display:block;float : right"  >
	<button type="button"  class="easyui-linkbutton"  data-options="iconCls:'icon-ok'"  style="width:80;height:30"onclick="open_login_dialog()">登录</button>
	<button type="button"  class="easyui-linkbutton"  data-options="iconCls:'icon-ok'"  style="width:80;height:30"onclick="open_reg_dialog()">注册</button>
	<button type="button"  class="easyui-linkbutton"  data-options="iconCls:'icon-ok'"  style="width:100;height:30"onclick="open_manager_dialog()">后台登录</button>
	</div>
	<!-- 欢迎登陆提示 -->
	<div id="welcome" style="float : right">

	</div>  





    
 

