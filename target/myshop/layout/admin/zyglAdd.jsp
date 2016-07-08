<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div align="center">
	<form id="admin_zyglAdd_addForm" method="post">
		<table class="tableForm">
			<tr>
				<th>编号</th>
				<td><input name="id" class="easyui-validatebox" data-options="required:true" />
				</td>
				<th>资源名称</th>
				<td><input name="text" class="easyui-validatebox" data-options="required:true" />
				</td>
			</tr>
			<tr>
				<th>资源地址</th>
				<td><input name="url" />
				</td>
				<th>资源排序</th>
				<td><input name="seq" class="easyui-numberspinner" data-options="min:0,max:999,editable:false,required:true,missingMessage:'请选择菜单排序'" value="10" style="width: 155px;" />
				</td>
			</tr>
			<tr>
				<th>上级资源</th>
				<td colspan="3"><input id="admin_zyglAdd_pid" name="pid" class="easyui-combotree" data-options="url:'${pageContext.request.contextPath}/resourceController/allTreeNode.action',parentField : 'pid',lines : true" style="width: 370px;" />
				</td>
			</tr>
		</table>
	</form>
</div>