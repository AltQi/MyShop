<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

 
<script type="text/javascript">
  function people_address_map_init(result){
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
            'echarts/chart/map' // 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('people_address_map')); 
            
            var option = {
          		    title : {
          		        text: '用户所在区域',
          		        //subtext: '纯属虚构',
          		        x:'center'
          		    },
          		    tooltip : {
          		        trigger: 'item'
          		    },
          		    legend: {
          		        orient: 'vertical',
          		        x:'left',
          		        data:['用户数量']
          		    },
          		    dataRange: {
          		        min: 0,
          		        max: 35,
          		        x: 'left',
          		        y: 'bottom',
          		        text:['高','低'],           // 文本，默认为数值文本
          		        calculable : true
          		    },
          		    toolbox: {
          		        show: true,
          		        orient : 'vertical',
          		        x: 'right',
          		        y: 'center',
          		        feature : {
          		            mark : {show: true},
          		            dataView : {show: true, readOnly: false},
          		            restore : {show: true},
          		            saveAsImage : {show: true}
          		        }
          		    },
          		    roamController: {
          		        show: true,
          		        x: 'right',
          		        mapTypeControl: {
          		            'china': true
          		        }
          		    },
          		    series : [
          		        {
          		            name: '用户数量',
          		            type: 'map',
          		            mapType: 'china',
          		            roam: false,
          		            itemStyle:{
          		                normal:{label:{show:true}},
          		                emphasis:{label:{show:true}}
          		            },
          		            data:result
          		        }
          		    ]
          		};
            // 为echarts对象加载数据 
            myChart.setOption(option); 
        }
    );
  }
  function people_gender(result){
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
          var myChart = ec.init(document.getElementById('people_gender')); 
          var option = {
        		    title : {
        		        text: '用户年龄构成',
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
			url : '${pageContext.request.contextPath}/user/getPeopleCountPro.action',
			cache : false,
			dataType : 'JSON',
			success : function(r) {
				people_address_map_init(r);
			}
		});
		$.ajax({
			url : '${pageContext.request.contextPath}/user/getPeopleAgeCount.action',
			cache : false,
			dataType : 'JSON',
			success : function(r) {
				people_gender(r);
			}
		}); 
  })
</script>
        <div id="people_address_map" style="height:400px;border:1px solid #333;"></div>
        <div id="people_gender" style="height:400px;border:1px solid #333;"></div>