<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

 
<script type="text/javascript">
  function one_orderPrice(result){
	    // 路径配置
    require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });
    // 使用
    require(
        [
            'echarts',
            'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('one_orderPrice')); 
            
            var option = {
            	    title : {
            	        text : '用户花费折线图',
            	        subtext : 'dataZoom支持'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter : function (params) {
            	        	
            	            var date = new Date(params.value[0]);
            	            data = date.getFullYear() + '-'
            	                   + (date.getMonth() + 1) + '-'
            	                   + date.getDate() + ' '
            	                   + date.getHours() + ':'
            	                   + date.getMinutes();
            	                   
            	            return data + '<br/>'
            	                   + params.value[1];
            	        }
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    dataZoom: {
            	        show: true,
            	        start : 70
            	    },
            	    legend : {
            	        data : ['series1']
            	    },
            	    grid: {
            	        y2: 80
            	    },
            	    xAxis : [
            	        {
            	            type : 'time',
            	            splitNumber:10
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    series : [
            	        {
            	            name: 'series1',
            	            type: 'line',
            	            showAllSymbol: true,
            	            symbolSize: function (value){
            	                return Math.round(value[1]/140) + 2;
            	            },
            	            data: (function () {
            	                var d = [];
            	                
            	                var now = new Date();
            	                var value;
            	                for(var i=0;i<result.length;i++){
            	                    d.push([
										result[i].createTime,
										result[i].orderPrice
            	                    ]);
            	                }
            	                return d;
            	            })()
            	        }
            	    ]
            	};           	                    
            // 为echarts对象加载数据 
            myChart.setOption(option); 
        }
    );
  }
  function one_buy_type(result){
	  var names=[];
	  for(let i=0;i<result.length;i++){
		  names.push(result[i].name);
	  }

	    // 路径配置
  require.config({
      paths: {
          echarts: 'http://echarts.baidu.com/build/dist'
      }
  });
  // 使用
  require(
      [
          'echarts',
          'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
      ],
      function (ec) {
          // 基于准备好的dom，初始化echarts图表
          var myChart = ec.init(document.getElementById('one_buy_type')); 
          var option = {
        		    title : {
        		        text: '用户购买商品类型构成',
        		        //subtext: '纯属虚构',
        		        x:'center'
        		    },
        		    tooltip : {
        		        trigger: 'item',
        		        formatter: "{a} <br/>{b} : {c} ({d}%)"
        		    },
        		    legend: {
        		        orient : 'vertical',
        		        x : 'left',
        		        data:names
        		    },
        		    toolbox: {
        		        show : true,
        		        feature : {
        		            mark : {show: true},
        		            dataView : {show: true, readOnly: false},
        		            magicType : {
        		                show: true, 
        		                type: ['pie', 'funnel'],
        		                option: {
        		                    funnel: {
        		                        x: '25%',
        		                        width: '50%',
        		                        funnelAlign: 'left',
        		                        max: 1548
        		                    }
        		                }
        		            },
        		            restore : {show: true},
        		            saveAsImage : {show: true}
        		        }
        		    },
        		    calculable : true,
        		    series : [
        		        {
        		         
        		            type:'pie',
        		            radius : '55%',
        		            center: ['50%', '60%'],
        		            data:result
        		        }
        		    ]
        		};
          // 为echarts对象加载数据 
          myChart.setOption(option); 
      }
  );
}
  $(function(){
		$.ajax({
			
			url : '${pageContext.request.contextPath}/user/getOneOrderPrice.action',
			data:{
				userId:$('#one_datagrid').datagrid('getChecked')[0].id
			},
			cache : false,
			dataType : 'JSON',
			success : function(r) {
				one_orderPrice(r);
			}
		});
		$.ajax({
			url : '${pageContext.request.contextPath}/user/getOneBuyType.action',
			data:{
				userId:$('#one_datagrid').datagrid('getChecked')[0].id
			},
			cache : false,
			dataType : 'JSON',
			success : function(r) {
				one_buy_type(r);
			}
		}); 
  })
</script>
        <div id="one_orderPrice" style="height:400px;border:1px solid #333;">
        
        </div>
        <div id="one_buy_type" style="height:400px;border:1px solid #333;"></div>