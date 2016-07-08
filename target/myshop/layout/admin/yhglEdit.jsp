<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	$(function() {
		$('#admin_yhglEdit_combogrid').combogrid({
			multiple : true,
			nowrap : false,
			url : '${pageContext.request.contextPath}/roleController/combogrid.action',
			panelWidth : 450,
			panelHeight : 200,
			idField : 'id',
			textField : 'text',
			pagination : true,
			fitColumns : true,
			editable : true,
			rownumbers : true,
			mode : 'remote',
			delay : 500,
			pageSize : 100,
			pageList : [ 100 ],
			columns : [ [ {
				field : 'id',
				title : '编号',
				width : 150,
				hidden : true
			}, {
				field : 'text',
				title : '角色名称',
				width : 150
			} ] ]
		});
	});
</script>
<div align="center">
	<form id="admin_yhglEdit_editForm" method="post">
		<table class="tableForm">
			<tr>
				<th style="width: 100px;">编号</th>
				<td><input name="id" readonly="readonly" />
				</td>
				<th style="width: 80px;">登录名称</th>
				<td><input name="username" class="easyui-validatebox" data-options="required:true" />
				</td>
			</tr>
			<tr>
				<th>密码</th>
				<td><input name="passerword" type="password" readonly="readonly" style="width: 150px;" />
				</td>
				<th>创建时间</th>
				<td><input name="createdate" class="easyui-datetimebox"  />
				</td>
			</tr>
			<tr>
				<th>所属角色</th>
				<td><input id="admin_yhglEdit_combogrid" name="roleId" style="width: 155px;" />
				</td>
			</tr>
		</table>
	</form>
</div>