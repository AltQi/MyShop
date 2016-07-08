<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">

/* 增加商品展示的Tab */
function items_show_addTabFun(opts) {
	var t = $('#items_show_tabs');
	if (t.tabs('exists', opts.title)) {
		t.tabs('select', opts.title);
	} else {
		t.tabs('add', opts);
	}
}
/* 删除购物车中的商品 */
function cartcontent_deleteFun(index){
	var dg = $('#cartcontent');
	var data = dg.datagrid('getData');
	function remove(){
		var row = data.rows[index];
 		$.ajax({
			url : '${pageContext.request.contextPath}/cart/sessionRemove.action',
			data:{
				id:row.id
			},
			dataType : 'json',
			success : function(result) {
				if (result.success) {
				}
				 else {
					$.messager.show({
						title : '提示',
						msg : '删除失败'
					});
				}
			}
		});  
		data.total -= row.quantity;
		data.rows.splice(index,1);
		
	}
	remove();
	/* 删除后，重新计算行脚 */
	dg.datagrid('loadData', data);
	var cost = 0;
	var rows = dg.datagrid('getRows');
	for(var i=0; i<rows.length; i++){
		cost += rows[i].price*rows[i].quantity;
	}
	dg.datagrid('reloadFooter', [{name:'Total',price:cost}]);
}
/* 结算功能 */
function checkout(){
 	var dg = $('#cartcontent');
	var data = dg.datagrid('getData');
	$.ajax({
		url : '${pageContext.request.contextPath}/cart/sessionCheck.action',
		dataType : 'json',
		success : function(result) {
			console.log(result.success);
			if (result.success) {
				if(data.total>0){
		  			$.messager.confirm('请确认',formatString('您确认花费{0}元购买吗',$('#cartcontent').datagrid('getFooterRows')[0]['currentprice']),function(r){    
		  			    if (r){    
							$.ajax({
								url : '${pageContext.request.contextPath}/order/submit.action',
								dataType : 'json',
								success : function(result) {
									if (result.success) {
										$('#cartcontent').datagrid('reload');
										$.messager.show({
											title : '提示',
											msg : '支付成功，欢迎再次购物'
										});
									}
									 else {
										$.messager.show({
											title : '提示',
											msg : '支付失败，请重新支付'
										});
									}
								}
							});
		  			    }    
		  			});  
		  			
				} 
		  		else{
		  			$.messager.alert("提示", "请先购买商品"); 
		  		}
			}
			else{
				$.messager.confirm('登录','请您先登录后购买',function(r){    
	  			    if (r){    
	  			    	open_login_dialog();    
	  			    }    
	  			});  
			}
		}
	});	
/* 	if(se!='0'){
	
	}
	else{
	
	} */

		
} 
function refresh(){
	 $('#cartcontent').datagrid('reload');
}
</script>
   	<div class="cart" >
		<div class="ctitle">Shopping Cart</div>
		<div>
<!-- 		<table id="cartcontent" fitColumns="true" style="width1:300px;height:auto;">
			<thead>
				<tr>
					<th field="name" width=140>Name</th>
					<th field="quantity" width=60 align="right">Quantity</th>
					<th field="price" width=60 align="right">Price</th>
				</tr>
			</thead>
		</table> -->
		<div id="cartcontent" ></div>
		<button type="button"  class="easyui-linkbutton"  data-options="iconCls:'icon-ok'"  style="float:right;width:80;height:30"onclick="checkout()">结算</button>
		<button type="button"  class="easyui-linkbutton"  data-options="iconCls:'icon-ok'"  style="float:right;width:80;height:30"onclick="refresh()">刷新</button>
		</div>
	</div> 
 
