<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



<script type="text/javascript">
var loginInputForm;
	$(function() {
	/* 登录表单 及提交操作*/
loginInputForm=$('loginInputForm').form();
		//表单回车换行功能
		loginInputForm.find('input').on('keyup', function(event) {
			if (event.keyCode == '13') {
				loginInputForm.submit();
			}
		})
	});
	/* easyui的validatebox验证两次密码一只扩展 */
	$.extend($.fn.validatebox.defaults.rules, {
		equalsPwd : {
			validator : function(value, param) {
				return value == $(param[0]).val();
			},
			message : '兩次密码不一致'
		},
    //移动手机号码验证
    mobile: {//value值为文本框中的值
        validator: function (value) {
            var reg = /^1[3|4|5|8|9]\d{9}$/;
            return reg.test(value);
        },
        message: '输入手机号码格式不准确.'
    },
    qq: {// 验证QQ,从10000开始
                validator: function (value) {
                    return /^[1-9]\d{4,9}$/i.test(value);
                },
                message: 'QQ号码格式不正确'
            }
	});
</script>
<!-- 登录对话框，初始化为隐藏 -->
	<div id="loginDialog" style="display:none">
		<form id="loginInputForm" method="post">
			<table>
			      	<tr>
        			<td width="80" align="right"><label for="userName"><span class="x">*</span>用户名：</label></td>
        			<td width="200">
        			<input type="text" class="easyui-validatebox"
						required="true" missingMessage="请输入用户名" name="username" id="userName" /></td>
      				</tr>
      				<tr>
        			<td align="right"><label for="password"><span class="x">*</span>密码：</label></td>
        			<td><input type="password" class="easyui-validatebox" required="true" missingMessage="请输入密码" name="password" id="password" /></td>
      				</tr>
			</table>
		</form>
	</div>
	
