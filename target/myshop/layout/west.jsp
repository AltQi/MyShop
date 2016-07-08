<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	$(function() {

		$('#layout_west_tree').tree({
			url : '${pageContext.request.contextPath}/menuController/allTreeNode.action',
			parentField : 'pid',
			lines : true,
			onClick : function(node) {
				var url;
				if (node.url) {
					url = '${pageContext.request.contextPath}' + node.url;
				} else {
					url = '${pageContext.request.contextPath}/error/error.jsp';
				}
				if (url.indexOf('druidController') > -1) {/*要查看连接池监控页面*/
					layout_center_addTabFun({
						title : node.text,
						closable : true,
						iconCls : node.iconCls,
						content : '<iframe src="' + url + '" frameborder="0" style="border:0;width:100%;height:99%;"></iframe>'
					});
				} else {
					layout_center_addTabFun({
						title : node.text,
						closable : true,
						iconCls : node.iconCls,
						href : url
					});
				}
			}
		});

	});
</script>
<div class="easyui-accordion" data-options="fit:true,border:false">
	<div title="树形系统菜单" data-options="iconCls:'icon-save',tools : [ {
				iconCls : 'icon-reload',
				handler : function() {
					$('#layout_west_tree').tree('reload');
				}
			}, {
				iconCls : 'icon-redo',
				handler : function() {
					var node = $('#layout_west_tree').tree('getSelected');
					if (node) {
						$('#layout_west_tree').tree('expandAll', node.target);
					} else {
						$('#layout_west_tree').tree('expandAll');
					}
				}
			}, {
				iconCls : 'icon-undo',
				handler : function() {
					var node = $('#layout_west_tree').tree('getSelected');
					if (node) {
						$('#layout_west_tree').tree('collapseAll', node.target);
					} else {
						$('#layout_west_tree').tree('collapseAll');
					}
				}
			} ]">
		<ul id="layout_west_tree"></ul>
	</div>
	<div title="普通系统菜单" data-options="iconCls:'icon-reload'">
		
	</div>
</div>