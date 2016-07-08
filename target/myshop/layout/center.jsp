 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
		function layout_center_addTabFun(opts) {
		var t = $('#layout_center_tabs');
		if (t.tabs('exists', opts.title)) {
			t.tabs('select', opts.title);
		} else {
			t.tabs('add', opts);
		}
	}
</script>
<div id="cccenter" class="easyui-layout" fit="true" ,border="false">
	<div data-options="region:'center'" style="overflow: hidden;background:#eee;">
		<div id="layout_center_tabs"  class="easyui-tabs" fit="true" border="false"></div>
	</div>
	</div>