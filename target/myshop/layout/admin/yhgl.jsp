<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	var datagrid;
	var rows;
	var editrow=undefined;
	function admin_yhgl_editFun(index){
		$('#datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/layout/admin/yhglEdit.jsp',
			width : 520,
			height : 200,
			modal : true,
			title : '编辑用户',
			buttons : [ {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#admin_yhglEdit_editForm').form('submit', {
						url : '${pageContext.request.contextPath}/user/edit.action',
						success : function(result) {
							try {
								var r = $.parseJSON(result);
								if (r.success) {
									$('#datagrid').datagrid('updateRow', {
										index : index,
										row : r.obj
									});
									d.dialog('destroy');
								}
								$.messager.show({
									title : '提示',
									msg : r.msg
								});
							} catch (e) {
								$.messager.alert('提示', result);
							}
						}
					});
				}
			} ],
			onClose : function() {
				$(this).dialog('destroy');
			},
			onLoad : function() {
				
				var rows = $('#datagrid').datagrid('getRows');
				var o = rows[index];
				o.roleId = stringToList(rows[index].roleIds);
			o.birthday=formatDatebox(rows[index].birthday);
				o.createdate=formatDateBoxFull(rows[index].createdate);
				o.password =rows[index].password;
				$('#admin_yhglEdit_editForm').form('load', o);
			}
		});
};
		
	$(function() {

		datagrid = $('#datagrid').datagrid({
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
				formatter : formatDateBoxFull,
				/* editor : 'datetimebox', */
/* 			 	editor:{type:'datetimebox',
				options:{
				required:'true'
				}
				}  */
			},{
				field : 'action',
				title : '动作',
				width : 100,
				formatter : function(value, row, index) {
					if (row.id == '0') {
						return '系统用户';
					} else {
						return formatString('<img onclick="admin_yhgl_editFun(\'{0}\');" src="{1}"/>&nbsp;<img onclick="admin_yhgl_deleteFun(\'{2}\');" src="{3}"/>', index, '${pageContext.request.contextPath}/images/pencil.png', index, '${pageContext.request.contextPath}/images/cancel.png');
					}
				}
			} ] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					yhgl_add();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					 rows=datagrid.datagrid('getSelections');
					
				if (rows.length > 0) {
				$.messager.confirm('请确认','确定删除?',function(b){
				if(b){
				var ids=[];
				for(var i=0;i<rows.length;i++){
						ids.push(rows[i].id);
						}
					$.ajax({
						url : '${pageContext.request.contextPath}/user/remove.action',
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(result) {
							if (result.success) {
								$('#datagrid').datagrid('load');
								$('#datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
							}
							 else {
								$.messager.show({
									title : '提示',
									msg : result.msg
								});
							}
						}
					});
					
				}
				});
				}
				else {
			$.messager.show({
				title : '提示',
				msg : '请勾选要删除的记录！'
			});
		}
				}
			},'-', {
				text : '查询',
				iconCls : 'icon-search',
				handler : function() {
					yhgl_search();
				}
			} , '-', {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					datagrid.datagrid('endEdit',editrow);
				}
			} , '-', {
				text : '取消编辑',
				iconCls : 'icon-redo',
				handler : function() {
				editrow=undefined;
					datagrid.datagrid('rejectChanges');
				}
			}],
			onAfterEdit:function(rowIndex,rowData,changes){
			var inserted=datagrid.datagrid('getChanges','inserted');
			var updated=datagrid.datagrid('getChanges','updated');
			var url='';
			if(inserted.length>0){
			url='${pageContext.request.contextPath}/user/add.do';
			}
			if(updated.length>0){
			url='${pageContext.request.contextPath}/user/add.do';
			} 
			$.ajax({
			url : '${pageContext.request.contextPath}/user/add.do',
			data:  rowData ,
			dataType:'json',
			success:function(r){
				if(r&&r.success){
				datagrid.datagrid('acceptChanges');
				$.messager.show({title:'我的消息',msg:r.msg});
					}else{
						datagrid.datagrid('rejectChanges');
						$.messager.alert('错误',r.msg,'error');
						}
						editrow=undefined;
						console.info(editrow);
				}
			});
			
			},
			onDblClickRow:function(rowIndex,rowData){
					if(editrow!=undefined){
					datagrid.datagrid('endEdit',editrow);
					}
					if(editrow==undefined){
					datagrid.datagrid('beginEdit',rowIndex); 
					 editrow=rowIndex;
					}
			
			}

		});

		function yhgl_add() {
		
			datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid(
					'clearSelections');
					if(editrow!=undefined){
					datagrid.datagrid('endEdit',editrow);
					}
					if(editrow==undefined){
					datagrid.datagrid('insertRow',{
					index:0,
					row:{}
					});
					 datagrid.datagrid('beginEdit',0); 
					 editrow=0;}
 			$("<div></div>").dialog(
							{
								href : '${pageContext.request.contextPath}/layout/admin/yhglAdd.jsp',
								width : 520,
								height : 200,
								modal : true,
								title : '添加用户',
								buttons : [ {
									text : '添加',
									handler : function() {
										$('#user_yhgl_addForm').submit();
									}
								} ],
								onClose : function() {
									$(this).dialog('destroy');
								}
							}); 
		};
	

		function yhgl_search() {
	
			       $('#ccccenter').layout('add', {
							 region: 'north',    
				 title:'用户查询',
				 collapsed:true,
				 height:120,
				 
				 split: true,    
				 href:'${pageContext.request.contextPath}/layout/admin/yhglSearch.jsp' 
			
			});
		if ($('#ccccenter').layout('panel', 'north').panel('options').collapsed) {
				$('#ccccenter').layout('expand', 'north');
			} else {
				$('#ccccenter').layout('collapse', 'north');
			} 
		};


	});
</script>
<div id="ccccenter" class="easyui-layout" fit="true">
	<div data-options="region:'center' "style="padding:5px;background:#eee;">
		<table id="datagrid"></table>
	</div>
</div>

