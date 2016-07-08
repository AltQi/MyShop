<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function admin_cdgl_deleteFun(id) {
		if (id != undefined) {
			$('#admin_cdgl_treegrid').treegrid('select', id);
		}
		var node = $('#admin_cdgl_treegrid').treegrid('getSelected');
		if (node) {
			$.messager.confirm('询问', '您确定要删除【' + node.text + '】？', function(b) {
				if (b) {
					$.ajax({
						url : '${pageContext.request.contextPath}/menuController/remove.action',
						data : {
							id : node.id
						},
						cache : false,
						dataType : 'JSON',
						success : function(r) {
							if (r.success) {
								$('#admin_cdgl_treegrid').treegrid('remove', r.obj);

								$('#layout_west_tree').tree('reload');
							}
							$.messager.show({
								msg : r.msg,
								title : '提示'
							});
						}
					});
				}
			});
		}
	}
		function admin_cdgl_editFun(id) {
		if (id != undefined) {
			$('#admin_cdgl_treegrid').treegrid('select', id);
		}
		var node = $('#admin_cdgl_treegrid').treegrid('getSelected');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/layout/admin/cdglAdd.jsp',
			width : 500,
			height : 200,
			modal : true,
			title : '菜单编辑',
			buttons : [ {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : function() {
					
					$('#admin_cdglAdd_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/menuController/edit.action',
						success : function(result) {
							try {
								var r = $.parseJSON(result);
								if (r.success) {
									$('#admin_cdgl_treegrid').treegrid('reload');
									d.dialog('destroy');

									$('#layout_west_tree').tree('reload');
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
				$('#admin_cdglAdd_addForm').form('load', node);
			}
		});
	}

	var iconData = [ {
		value : '',
		text : '默认'
	}, {
		value : 'icon-add',
		text : 'icon-add'
	}, {
		value : 'icon-edit',
		text : 'icon-edit'
	}, {
		value : 'icon-remove',
		text : 'icon-remove'
	}, {
		value : 'icon-save',
		text : 'icon-save'
	}, {
		value : 'icon-cut',
		text : 'icon-cut'
	}, {
		value : 'icon-ok',
		text : 'icon-ok'
	}, {
		value : 'icon-no',
		text : 'icon-no'
	}, {
		value : 'icon-cancel',
		text : 'icon-cancel'
	}, {
		value : 'icon-reload',
		text : 'icon-reload'
	}, {
		value : 'icon-search',
		text : 'icon-search'
	}, {
		value : 'icon-print',
		text : 'icon-print'
	}, {
		value : 'icon-help',
		text : 'icon-help'
	}, {
		value : 'icon-undo',
		text : 'icon-undo'
	}, {
		value : 'icon-redo',
		text : 'icon-redo'
	}, {
		value : 'icon-back',
		text : 'icon-back'
	}, {
		value : 'icon-sum',
		text : 'icon-sum'
	}, {
		value : 'icon-tip',
		text : 'icon-tip'
	} ];
	$(function() {
		$('#admin_cdgl_treegrid').treegrid({
			url : '${pageContext.request.contextPath}/menuController/allTreeNode.do',
			idField : 'id',
			treeField : 'text',
			parentField : 'pid',
			fit : true,
			fitColumns : true,
			
			border : false,
			frozenColumns : [ [ {
				title : '编号',
				field : 'id',
				width : 150,
				hidden : true
			}, {
				field : 'text',
				title : '菜单名称',
				width : 150
				
			} ] ],
			columns : [ [ {
				field : 'iconcls',
				title : '菜单图标',
				width : 60,
				formatter : function(value) {
					if (!value) {
						return '';
					} else {
						return formatString('<span class="{0}" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span>', value);
					}
				}
			}, {
				field : 'url',
				title : '菜单路径',
				width : 200
			}, {
				field : 'seq',
				title : '排序',
				width : 50
			}, {
				field : 'pid',
				title : '上级菜单ID',
				width : 150,
				hidden:true
			}, {
				field : 'pname',
				title : '上级菜单名称',
				width : 80
			}, {
				field : 'action',
				title : '动作',
				width : 50,
				formatter : function(value, row, index) {
					return formatString('<img onclick="admin_cdgl_editFun(\'{0}\');" src="{1}"/>&nbsp;<img onclick="admin_cdgl_deleteFun(\'{2}\');" src="{3}"/>', row.id, '${pageContext.request.contextPath}/images/pencil.png', row.id, '${pageContext.request.contextPath}/images/cancel.png');
				}
			} ] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					admin_cdgl_appendFun();
				}
			}, '-', {
				text : '展开',
				iconCls : 'icon-redo',
				handler : function() {
					var node = $('#admin_cdgl_treegrid').treegrid('getSelected');
					if (node) {
						$('#admin_cdgl_treegrid').treegrid('expandAll', node.cid);
					} else {
						$('#admin_cdgl_treegrid').treegrid('expandAll');
					}
				}
			}, '-', {
				text : '折叠',
				iconCls : 'icon-undo',
				handler : function() {
					var node = $('#admin_cdgl_treegrid').treegrid('getSelected');
					if (node) {
						$('#admin_cdgl_treegrid').treegrid('collapseAll', node.cid);
					} else {
						$('#admin_cdgl_treegrid').treegrid('collapseAll');
					}
				}
			}, '-', {
				text : '刷新',
				iconCls : 'icon-reload',
				handler : function() {
					$('#admin_cdgl_treegrid').treegrid('reload');
				}
			} ],
			onContextMenu : function(e, row) {
				e.preventDefault();
				$(this).treegrid('unselectAll');
				$(this).treegrid('select', row.id);
				$('#admin_cdgl_menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			}
		});
		
	function admin_cdgl_appendFun() {
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/layout/admin/cdglAdd.jsp',
			width : 500,
			height : 200,
			modal : true,
			title : '菜单添加',
			buttons : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#admin_cdglAdd_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/menuController/add.action',
						success : function(result) {
							try {
								var r = $.parseJSON(result);
								if (r.success) {
									 $('#admin_cdgl_treegrid').treegrid('append', {
										parent : r.obj.pid,
										data : [ r.obj ]
									}); 

									d.dialog('destroy');

									$('#layout_west_tree').tree('reload');
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
			}
		});
	}
	

	
	
	});
</script>
<table id="admin_cdgl_treegrid"></table>
<div id="admin_cdgl_menu" class="easyui-menu" style="width:120px;display: none;">
	<div onclick="admin_cdgl_appendFun();" data-options="iconCls:'icon-add'">增加</div>
	<div onclick="admin_cdgl_deleteFun();" data-options="iconCls:'icon-remove'">删除</div>
	<div onclick="admin_cdgl_editFun();" data-options="iconCls:'icon-edit'">编辑</div>
</div>
