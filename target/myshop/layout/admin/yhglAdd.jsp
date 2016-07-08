<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		$('#user_yhgl_addForm').form({
			url : '${pageContext.request.contextPath}/user/reg.do',
			success : function(result) {
				var r = $.parseJSON(result);
				if (r.success) {
					$('#user_reg_regDialog').dialog('close');
					$('#datagrid').datagrid('load',{});
				
				$.messager.show({
					title : '提示',
					msg : r.msg
				});}
				else{
				$.messager.show({
					title : '提示',
					msg : r.msg
				});
				}
			}
		});

	});

</script>
	<div align="center">
		<form method="post" id="user_yhgl_addForm"">
			<table class="tableForm">
				<tr>
					<th align="right">登录名</th>
					<td><input name="username" class="easyui-validatebox"
						data-options="required:true" required="true"
						missingMessage="请输入用户名" /></td>
				</tr>
				<tr>
					<th align="right">密码</th>
					<td><input type="password" name="password"
						class="easyui-validatebox" data-options="required:true"
						style="width: 150px;" missingMessage="请输入密码" /></td>
				</tr>
				<tr>
					<th align="right">性别</th>
					<td><input type="radio" name="gender" value="男"><span>男</span>
						<input type="radio" name="gender" value="女"><span>女</span></td>
					<th align="right">生日</th>
					<td><input type="text" class="easyui-datebox" name="birthday">
						</input></td>
				</tr>
				<tr>
					<th align="right">手机</th>
					<td><input type="text" class="easyui-validatebox"
						name="phone" data-options="validType:'mobile'" /></td>
					<th align="right">QQ</th>
					<td><input type="text" class="easyui-validatebox" name="qq"
						data-options="required:true,validType:'qq'" /></td>
				</tr>
			</table>
		</form>
	</div>