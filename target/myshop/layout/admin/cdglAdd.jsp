<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
	$(function() {
		$('#admin_cdglAdd_combobox').combobox({
			data : iconData,
 			formatter : function(v) {
				return formatString('<span class="{0}" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span>{1}', v.value, v.value);
			} 
		});
	});
</script>
<div align="center">
	<form id="admin_cdglAdd_addForm" method="post">
		<table class="tableForm">
			<tr>
				<th>编号</th>
				<td><input name="id" class="easyui-validatebox" data-options="required:true" />
				</td>
				<th>菜单名称</th>
				<td><input name="text" class="easyui-validatebox" data-options="required:true" />
				</td>
			</tr>
			<tr>
				<th>菜单地址</th>
				<td><input name="url" />
				</td>
				<th>菜单排序</th>
				<td><input name="seq" class="easyui-numberspinner" data-options="min:0,max:999,editable:false,required:true,missingMessage:'请选择菜单排序'" value="10" style="width: 155px;" />
				</td>
			</tr>
			<tr>
				<th>菜单图标</th>
				<td><input id="admin_cdglAdd_combobox" name="iconcls" style="width:155px;" />
				</td>
				<th>上级菜单</th>
				<td><input id="admin_cdglAdd_pid" name="pid" class="easyui-combotree" data-options="url:'${pageContext.request.contextPath}/menuController/allTreeNode.action',idField : 'id',
			treeField : 'text',parentField : 'pid',lines : true,fit : true" style="width:140px;" />
				</td>
			</tr>
		</table>
	</form>
</div>