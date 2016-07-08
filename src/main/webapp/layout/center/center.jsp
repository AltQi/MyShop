<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script>
var cartcontent

$(function(){
	/* 购物车datagrid的初始化 */
	/* cartcontent在center/cart.jsp中 */
	$('#cartcontent').datagrid({
		url:'${pageContext.request.contextPath}/product/productCart.action',
		singleSelect:true,
		showFooter:true,
		fitColumns : true,
		nowrap : false,
		columns : [ [ {
			title : '图片',
			field : 'picturepath' ,
 			formatter : function(value,row,index) {
					return formatString('<img  src="{0}"/>', '${pageContext.request.contextPath}'+value);
			} 
		},{
			title : 'ID',
			field : 'id',
			hidden:true
		}, {
			title : '名称',
			field : 'name',
			editor:{type:'validatebox',
			options:{
			required:true
			}
			} 
		}, {
			title : '数量',
			field : 'quantity'
		}, {
			title : '价格',
			field : 'currentprice'
		},{
			title : '描述',
			field : 'shortDescription'
		},{
			field : 'action',
			title : '删除',
			formatter : function(value, row, index) {
					return formatString('<img onclick="cartcontent_deleteFun(\'{0}\');" src="{1}"/>', index,'${pageContext.request.contextPath}/images/cancel.png');					
			}
		} ] ],
		/* 加载成功后显示行脚 */
		onLoadSuccess:function(){
 			var dg = $('#cartcontent');
			var data = dg.datagrid('getData');
			/* dg.datagrid('loadData', data); */
			var cost = 0;
			var rows = data.rows;
			
			for(var i=0; i<rows.length; i++){
				cost += rows[i].currentprice*rows[i].quantity;
			}
			dg.datagrid('reloadFooter', [{name:'Total',currentprice:cost}]); 
		}
	});


	/* 首页Tab初始化 */
	$('#items_show_tabs').tabs({    
	    border:false,
	    onAdd:function(){
			$.ajax({
				url : '${pageContext.request.contextPath}/product/productDetails.action',
				data : {
					id : $('#category_tree').tree('getSelected').id
				},
				dataType : 'JSON',
				success : function(r) {
					
					var ul=$('#items_product');
					/* 动态创建商品div节点 */
					r.forEach(function (element, index, array) {
					     ul.append(formatString(element.details,'${pageContext.request.contextPath}'+r[index].picturepath,r[index].name, r[index].currentprice,r[index].shortDescription,'${pageContext.request.contextPath}'+r[index].picturepath,r[index].id)) 
					});
					/* 购买数量输入框 */
					$('.itemsquantity').numberspinner({    
					    min: 1,    
					    editable: false,
					    value:1
					});  
					/* 商品拖动初始化cart.js */
					item_cart_init(); 			
				}
			});
	    }
	});
	$.ajax({
		url : '${pageContext.request.contextPath}/product/productSellMostDetails.action',
		dataType : 'JSON',
		success : function(r) {
			
			var ul=$('#sell_most_product');
			/* 动态创建商品div节点 */
			r.forEach(function (element, index, array) {
			     ul.append(formatString(element.details,'${pageContext.request.contextPath}'+r[index].picturepath,r[index].name, r[index].currentprice,r[index].shortDescription,'${pageContext.request.contextPath}'+r[index].picturepath,r[index].id)) 
			});
			/* 购买数量输入框 */
			$('.itemsquantity').numberspinner({    
			    min: 1,    
			    editable: false,
			    value:1
			});  
			/* 商品拖动初始化cart.js */
			item_cart_init(); 			
		}
	});
	item_cart_init();
})
</script>
<!-- 购物车的jsp -->
<%@ include file="/layout/center/cart.jsp"%>
<div id="items_show_tabs" >
    <div title="首页" >   
         <!-- <div id="one_orderPrice" style="height:400px;"> -->
        <h1>卖的最多</h1><hr/>
       	<div  class="products" >
		<ul id="sell_most_product">

		</ul>
	</div>	
        <!-- </div> -->
    </div>
</div>