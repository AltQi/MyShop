<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	$(function() {
		$('#user_reg_regForm').form({
			url : '${pageContext.request.contextPath}/user/reg.do',
			success : function(result) {
			console.info(result);
				var r = $.parseJSON(result);
				console.info(result);
				
				if (r.success) {
					$('#user_reg_regDialog').dialog('close');
				}
				$.messager.show({
					title : '提示',
					msg : r.msg
				});
			}
		});

		$('#user_reg_regDialog').show().dialog({
			width: 500,
			height:600,
			modal : true,
			title : '用户注册',
			closed : true,
			buttons : [ {
				text : '注册',
				handler : function() {
					$('#user_reg_regForm').submit();
				}
			} ]
		});
	});

</script>
<div id="user_reg_regDialog" style="display: none;">
	<div align="center">
		<form method="post" id="user_reg_regForm"">
			<table class="tableForm">
				<tr>
        			<td width="80" align="right"><label for="userName"><span class="x">*</span>用户名：</label></td>
        			<td width="200">
        			<input type="text" class="easyui-validatebox"
						data-options="required:true" required="true"
						missingMessage="请输入用户名" name="username" id="userName" /></td>
      			</tr>
      			<tr>
        			<td align="right"><label for="password"><span class="x">*</span>密码：</label></td>
        			<td><input type="password" class="easyui-validatebox" data-options="required:true"
						 missingMessage="请输入密码" name="password" id="password" /></td>
      			</tr>
      			<tr>
        		<td align="right"><label for="rePwd"><span class="x">*</span>重复密码：</label></td>
        		<td><input type="password" name="rePwd"
						class="easyui-validatebox"
						data-options="required:true,validType:'equalsPwd[\'#user_reg_regForm input[name=password]\']'"
						missingMessage="请再次输入密码" id="rePwd" /></td>
      			</tr>
      			<tr>
        			<td align="right"><label for="gender">性别：</label></td>
        			<td><input type="radio" name="gender" value="男"><span>男</span>
							<input type="radio" name="gender" value="女"><span>女</span></td>
      			</tr>
 				<tr>
					<td align="right"><label for="birthday">生日：</label></td>
					<td><input type="text" class="easyui-datebox" name="birthday" id="birthday">
						</input></td>
				</tr> 
				<tr>
					<td align="right"><label for="phone">手机：</label></td>
					<td><input type="text" class="easyui-validatebox"
						name="phone" data-options="validType:'mobile'"  id="phone"/></td>
				</tr>
				<tr>
					<td align="right"><label for="qq">手机：</label></td>
					<td><input type="text" class="easyui-validatebox" name="qq"
						data-options="validType:'qq'"  id="qq"/></td>
				</tr>
				<tr>
					<td align="right"><label for="email">邮箱：</label></td>
					<td><input name="email" class="easyui-validatebox"
						data-options="validType:'email'"  id="email"/></td>
				</tr>
				<tr>
					<td align="right"><label for="province">省：</label></td>
					<td><input name="province" id="province"  id="province" class="easyui-combobox"
						data-options="editable:false,value:'1',valueField:'proId',textField:'proName',url:'${pageContext.request.contextPath}/user/getPro.do',
       onSelect: function(rec){
            var url = '${pageContext.request.contextPath}/user/getCity.do?cityProid='+rec.proId;
            $('#city').combobox('reload', url);
}"></td>
				</tr>
				<tr>
					<td align="right"><label for="city">市：</label></td>
					<td><input id="city" name="city" class="easyui-combobox"
						data-options="editable:false,valueField:'cityId',textField:'cityName',url:'${pageContext.request.contextPath}/user/getCity.do?cityProid=1'" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>