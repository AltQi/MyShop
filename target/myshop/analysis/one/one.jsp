<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	var one_datagrid;
	var rows;
	function analysis(index){
		var row_index=$('#one_datagrid').datagrid('getRows')[index]
		 $('#one_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/analysis/one/one_analysis.jsp',
			width : 700,
			height : 600,
			modal : true,
			title : row_index.username+'的行为分析',
			onClose : function() {
				$(this).dialog('destroy');
			}
		});
};
	function yhgl_search() {
		
	       $('#one_center').layout('add', {
					 region: 'north',    
		 title:'用户查询',
		 collapsed:true,
		 height:120,
		 
		 split: true,    
		 href:'${pageContext.request.contextPath}/layout/admin/yhglSearch.jsp' 
	
	});
if ($('#one_center').layout('panel', 'north').panel('options').collapsed) {
		$('#one_center').layout('expand', 'north');
	} else {
		$('#one_center').layout('collapse', 'north');
	} 
};
	$(function() {
		one_datagrid = $('#one_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/user/pagesize.do',
			iconCls : 'icon-save',
			pagination : true,
			pageSize : 6,
			pageList : [ 6, 12, 18, 24 ],
			fit : true,
			fitColumns : true,
			nowarp : false,
			border : false,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			columns : [ [ {
				title : 'ID',
				field : 'id',
				width : 100,
				sortable : true,
				checkbox : true
			}, {
				title : '姓名',
				field : 'username',
				width : 150,
				sortable : true,
				editor:{type:'validatebox',
				options:{
				required:true
				}
				} 
			}, {
				title : '密码',
				field : 'password',
				width : 100,
				sortable : true,
				formatter: function(value,row,index){
					return '******';
				}

			}, {
				title : '性别',
				field : 'gender',
				width : 100
			}, {
				title : '邮箱',
				field : 'email',
				width : 100
			}, {
				title : '省份',
				field : 'province',
				width : 100
			}, {
				title : '市',
				field : 'city',
				width : 100
			}, {
				title : '出生日期',
				field : 'birthday',
				width : 100,
				formatter : formatDatebox,
			editor:{type:'datebox',
				options:{
				required:true
				}
				} 
			}, {
				title : '状态',
				field : 'status',
				width : 100
			}, {
				title : '创建时间',
				field : 'createdate',
				width : 100,
				formatter : formatDateBoxFull
			},{
				field : 'action',
				title : '动作',
				width : 100 ,
				formatter : function(value, row, index) {
						return formatString('<input type="button" onclick="analysis(\'{0}\');" value="用户行为分析"/>',index);		
				} 
			} ] ],
			toolbar : [  {
				text : '查询',
				iconCls : 'icon-search',
				handler : function() {
					yhgl_search();
				}
			}]
		});
});
</script>
<div id="one_center" class="easyui-layout" fit="true">
	<div data-options="region:'center' "style="background:#eee;">
		<table id="one_datagrid"></table>
	</div>
</div>
