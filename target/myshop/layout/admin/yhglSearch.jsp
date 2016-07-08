<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
			function admin_yhgl_searchFun() {
 			$('#one_datagrid').datagrid('load',{
			 username: $('#yhgl_searchForm').find('[name=username]').val() , 
			createdatetimeStart: parseToDate($('#yhgl_searchForm').find('[name=createdatetimeStart]').val()) ,
			createdatetimeEnd:parseToDate( $('#yhgl_searchForm').find('[name=createdatetimeEnd]').val())
			}
			
			); 
	}
		function admin_yhgl_cleanFun() {
/* 			$('#yhgl_searchForm input').val('');
			$('#datagrid').datagrid('load', {
			}); */
			$('#yhgl_searchForm').form('clear');
		}

</script>
<div>
<form id="yhgl_searchForm" method="post">
			<table class="tableForm">
				<tr>
					<th style="width: 170px;">检索用户名称(可模糊查询)</th>
					<td><input name="username" style="width: 315px;" /></td>
				</tr>
				<tr>
					<th>创建时间</th>
					<td><input name="createdatetimeStart"
						class="easyui-datetimebox" editable="false" />至<input
						name="createdatetimeEnd" class="easyui-datetimebox"
						editable="false" /></td>
				</tr>
			</table>
			<a href="javascript:void(0);" class="easyui-linkbutton"data-options="iconCls:'icon-search',plain:true"onclick="admin_yhgl_searchFun();">过滤条件</a> 
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="admin_yhgl_cleanFun();">清空条件</a>
</form>
</div>
