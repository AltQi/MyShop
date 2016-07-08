<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(function(){
	/* 商品tree的初始化 */
  	$('#category_tree').tree({
		url : '${pageContext.request.contextPath}/category/categoryList.action',
		idFiled:'id',
		textFiled:'cname',
		parentField : 'parentId',
		
 		onClick : function(node) {
			var url;
			if (node.url) {
				url = '${pageContext.request.contextPath}' + node.url;
			} else {
				url = '${pageContext.request.contextPath}/error/dog.jsp';
			}
			/* 在中央面板center.jsp展示商品 */
 			items_show_addTabFun({
					title : node.text,
					closable : true,
					iconCls : node.iconCls,
					href : url
				}); 
			
		}
	}); 
	 
})
</script>
	 <!-- 商品tree的初始化  -->
    <div id="category_tree"></div>

