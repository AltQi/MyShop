<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
function edit(){
		$('#tt').treegrid('unselectAll');
    	  $('#ddas').dialog('open'); 
/*     	  $('#ddas').dialog({
    	  			onLoad : function() {
				$('#admin_cdglAdd_addForm').form('load', node);
			}
    	  });  */
      var node = $('#tt').treegrid('getSelected');
	}
$(function(){
    $('#tt').treegrid({    
    url:'${pageContext.request.contextPath}/menuController/allTreeNode.action',    
    idField:'id',    
    treeField:'text',
    fit:'true',
    parentField : 'pid',
    fitColumns:true,    
    columns:[[ 
     {field:'text',title:'内容',width:80},     
        {title:'图标',field:'iconcls',width:180},    
        {field:'seq',title:'排序',width:60,align:'right'},    
         
        {field:'url',title:'地址',width:80}    
    ]],
    toolbar: '#tb'
}); 

})
</script>
  <body>
<div id="tt"></div>
<div id="tb">
<a class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true,title:'编辑'" onclick="edit()"/a>
<a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true,title:'增加'" onclick="add()"/a>
</div>
<div id="ddas"  title="编辑" style="width:400px;height:200px;"   
       class="easyui-dialog"  data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">   
    <form id="form" method="post">
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
				<th>上级菜单</th>
				<td><input id="pid" name="pid" class="easyui-combotree" data-options="url:'${pageContext.request.contextPath}/menuController/allTreeNode.action',idField : 'id',
			treeField : 'text',parentField : 'pid',lines : true,fit : true" style="width:140px;" />
				</td>
			</tr>
		</table>
	</form> 
</div>  

  </body>
  
