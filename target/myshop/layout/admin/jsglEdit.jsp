<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div align="center">
	<form id="admin_jsglEdit_editForm" method="post">
		<table class="tableForm">
			<tr>
				<th>编号</th>
				<td><input name="id" class="easyui-validatebox" data-options="required:true" /></td>
				<th>角色名称</th>
				<td><input name="text" class="easyui-validatebox" data-options="required:true" /></td>
			</tr>
			<tr>
				<th>可访问资源</th>
				<td colspan="3"><input id="admin_jsglEdit_pid" name="resourceIds" class="easyui-combotree" data-options="url:'${pageContext.request.contextPath}/resourceController/allTreeNode.action',parentField : 'pid',lines : true,multiple:true" style="width: 370px;" />
			</tr>
		</table>
	</form>
</div>