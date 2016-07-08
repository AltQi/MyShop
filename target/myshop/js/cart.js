function item_cart_init(){
	/* 商品的可拖动初始化 */
	$('.item').draggable({
		revert:true,
		proxy:'clone',
		onStartDrag:function(){
			$(this).draggable('options').cursor = 'not-allowed';
			$(this).draggable('proxy').css('z-index',10);
		},
		onStopDrag:function(){
			$(this).draggable('options').cursor='move';
			
		}
	});
	/* 购物车可放置初始化 */
	$('.cart').droppable({
		onDragEnter:function(e,source){
			$(source).draggable('options').cursor='auto';
		},
		onDragLeave:function(e,source){
			$(source).draggable('options').cursor='not-allowed';
			
		},
		onDrop:function(e,source){
			console.log(source);
			var name = $(source).find('p:eq(0)').html();
			var currentprice = $(source).find('p:eq(1)').html();
			var quantity = $('.itemsquantity').numberspinner('getValue');
			var shortDescription = $(source).find('p:eq(2)').html();
			var picturePath = $(source).find('p:eq(4)').html();
			var id = $(source).find('p:eq(5)').html();
			$.ajax({
				url : '/myshop/cart/sessionCheck.action',
				dataType : 'json',
				success : function(result) {
					if (result.success) {
						addProduct(name, parseFloat(currentprice.split('$')[1]),parseInt(quantity),shortDescription.split(':')[1],picturePath.substring(7),id);
					}
					 else {
				  			$.messager.confirm('登录','请您先登录后购买',function(r){    
				  			    if (r){    
				  			    	open_login_dialog();    
				  			    }    
				  			});  
					}
				}
			});	
		}
	});
}	

/* 向购物车内增加商品 */
function click_button_buy(obj){
	var name,currentprice,quantity,shortDescription,picturePath,id;
	 name = $(obj).parent().find('p:eq(0)').html();
		currentprice = $(obj).parent().find('p:eq(1)').html();
		 quantity = $(obj).parent().find('.itemsquantity').numberspinner('getValue');
		 shortDescription = $(obj).parent().find('p:eq(2)').html();
		 picturePath = $(obj).parent().find('p:eq(4)').html();
		 id = $(obj).parent().find('p:eq(5)').html();
	console.log(name)
	console.log(currentprice)
	console.log(quantity)
	console.log(shortDescription)
	console.log(picturePath)
	console.log(id)
	$.ajax({
		url : '/myshop/cart/sessionCheck.action',
		dataType : 'json',
		success : function(result) {
			if (result.success) {
				addProduct(name, parseFloat(currentprice.split('$')[1]),parseInt(quantity),shortDescription.split(':')[1],picturePath.substring(7),id);
			}
			 else {
		  			$.messager.confirm('登录','请您先登录后购买',function(r){    
		  			    if (r){    
		  			    	open_login_dialog();    
		  			    }    
		  			});  
			}
		}
	});


/*	console.log(name)
	*/
}
function addProduct(name,currentprice,quantity,shortDescription,picturePath,id){
			var dg = $('#cartcontent');
			var data = dg.datagrid('getData');
			console.log(data);
/*			for(var i=0; i<rowss.length; i++){
				if(rowss[i].id===id){
					data.rows[i].quantity=data.rows[i].quantity+quantity;
					
				}
				else{
					data.rows[i].name=name;
					data.rows[i].id=id;
					data.rows[i].quantity=quantity;
					data.rows[i].currentprice=currentprice;
					data.rows[i].shortDescription=shortDescription;
					data.rows[i].picturePath=picturePath;
				}
			}
			dg.datagrid('loadData',data);
			*/
			function add(){
				for(var i=0; i<data.total; i++){
					var row = data.rows[i];
					if (row.name == name){
						row.quantity += quantity;
						return;
					}
				}
				data.total += quantity;
				
				data.rows.push({
					name:name,
					id:id,
					quantity:quantity,
					currentprice:currentprice,
					shortDescription:shortDescription,
					picturepath:picturePath
				});
			}
			add();
			console.log(data);
			dg.datagrid('loadData', data);
			$.ajax({
				url : '/myshop/cart/sessionAdd.action',
				type:"post",
				data : {
					name:name,
					id:id,
					quantity:quantity,
					currentprice:currentprice,
					shortDescription:shortDescription,
					picturePath:picturePath
				}
			});
			var cost = 0;
			var rows = dg.datagrid('getRows');
			for(var i=0; i<rows.length; i++){
				cost += rows[i].currentprice*rows[i].quantity;
			}
			dg.datagrid('reloadFooter', [{name:'Total',currentprice:cost}]);


		}