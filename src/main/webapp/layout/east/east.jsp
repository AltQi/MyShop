<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	
	$.ajax({
		url : '${pageContext.request.contextPath}/cart/sessionCheck.action',
		dataType : 'json',
		success : function(result) {
			if (result.success) {
				$.ajax({
					url : '${pageContext.request.contextPath}/cart/cart_guess_product.action',
					dataType : 'JSON',
					success : function(r) {
						if (r.success) {
							var ul=$('#guess_like_product');
							r.obj.forEach(function (element, index, array) {
								ul.append(formatString(element.details,'${pageContext.request.contextPath}'+r.obj[index].picturepath,r.obj[index].name, r.obj[index].currentprice,r.obj[index].shortDescription,'${pageContext.request.contextPath}'+r.obj[index].picturepath,r.obj[index].id)) 
							});

							$('.itemsquantity').numberspinner({    
							    min: 1,    
							    editable: false,
							    value:1
							});  
							/* 商品拖动初始化cart.js */
							item_cart_init(); 
						}
						else{
							$.ajax({
								url : '${pageContext.request.contextPath}/order/order_guess_product.action',
								dataType : 'JSON',
								success : function(r){
									if (r.success) {
										var ul=$('#guess_like_product');
										r.obj.forEach(function (element, index, array) {
											ul.append(formatString(element.details,'${pageContext.request.contextPath}'+r.obj[index].picturepath,r.obj[index].name, r.obj[index].currentprice,r.obj[index].shortDescription,'${pageContext.request.contextPath}'+r.obj[index].picturepath,r.obj[index].id)) 
										});
										$('.itemsquantity').numberspinner({    
										    min: 1,    
										    editable: false,
										    value:1
										});  
										/* 商品拖动初始化cart.js */
										item_cart_init(); 
									}
									else{
										$('#user_session_judge').append('您还未买过东西，暂时还无法向您推荐商品')
									}
								}
							});	
						}
					}
				});
			}
			else{
				 $('#user_session_judge').append('您登录后会自动启动此功能') 
			}
		}
	});	
})
</script>
<div id="user_session_judge"></div>
	<div  class="products" >
		<ul id="guess_like_product">

		</ul>
	</div>	


