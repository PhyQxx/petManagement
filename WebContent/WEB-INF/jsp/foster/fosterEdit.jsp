<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.framework.util.ManageConstants"%>
<%
	String basePath = (String) request.getServletContext().getAttribute(ManageConstants.BASE_PATH);
	String staticPath = (String) request.getServletContext().getAttribute(ManageConstants.STATIC_PATH);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>寄养信息编辑</title>
<jsp:include page="/WEB-INF/jsp/login/include.jsp"></jsp:include>
<script type="text/javascript">
	var regex = /^\w+$/;//默认判断规则：数字字母下划线组成
	$(function() {
		// 	var userRoleId = "${editUser.userRoleId}";//获取编辑用户的角色ID
		// 	loadRoleList($('#userRoleId'),"EDIT_ROLE",userRoleId); 
		// 	var userRoleId = "${editUser.userRoleId}";//获取编辑用户的角色ID
		var Id = "${editFoster.id}";//获取编辑用户用户ID
		// 	$("#userRoleId").comboBox();
		// 	if(userRoleId!=""){
		// 		$('#userRoleId').comboBox('select',userRoleId);   		
		// 	}
		// 如果为修改页面 则设置用户账号不可修改
		// 	if(userId!=""){
		// 		$('#userId').attr('disabled',true); 	
		// 	}
		// 	$('#userId').blur(function(){
		// 		$('#userId').valid({define:function(val,error){
		// 				if(!regex.test(val))
		// 				{
		// 					error('用户名组成：数字、字母、下划线!');
		// 					return false;
		// 				}
		// 			if(val.length<5 || val.length>14)
		// 			{
		// 				error('请输入5-14位字符!');
		// 				return false;
		// 			}
		// 			return true;
		// 		}
		// 		});
		// 		$.valid();
		// 		}); 

		// 	$('#userPassword').blur(function(){
		// 		$('#userPassword').valid({define:function(val,error){
		// 				if(!regex.test(val))
		// 				{
		// 					error('密码组成：数字、字母、下划线!');
		// 					return false;
		// 				}
		// 			if(val.length<6 || val.length>10)
		// 			{
		// 				error('请输6-10位字符!');
		// 				return false;
		// 			}
		// 			return true;
		// 		}});
		// 		$.valid();
		// 		}); 

		// 确认密码失去焦点时 验证提示
		// 	$('#userPassword2').blur(function(){
		// 			$('#userPassword2').valid({
		// 				define:function(val,error){
		// 					if(val!=$('#userPassword').val()){
		// 						 error('确认密码需与密码相同!');
		// 						  return false;
		// 					}
		// 					return true;
		// 				}
		// 			});
		// 			$.valid();
		// 		}); 
	});

	//保存
	function save() {
		// 	$('#userId').valid({define:function(val,error){
		// 			if(!regex.test(val))
		// 			{
		// 				error('用户名组成：数字、字母、下划线!');
		// 				return false;
		// 			}
		// 		if(val.length<5 || val.length>14)
		// 		{
		// 			error('请输入5-14位字符!');
		// 			return false;
		// 		}
		// 		return true;
		// 	}});//数字验证
		// 	$('#userName').valid({notNull : true,len : 10});
		// 	$('#userPassword').valid({define:function(val,error){
		// 			if(!regex.test(val))
		// 			{
		// 				error('密码组成：数字、字母、下划线!');
		// 				return false;
		// 			}
		// 		if(val.length<6 || val.length>10)
		// 		{
		// 			error('请输6-10位字符!');
		// 			return false;
		// 		}
		// 		return true;
		// 	}});//数字验证
		// 	$('#userPassword2').valid({define:function(val,error){
		// 		if(val!=$('#userPassword').val()){
		// 			 error('确认密码需与密码相同!');
		// 			  return false;
		// 		}
		// 		return true;
		// 	}});
		if ($.valid()) {
			// 默认为修改页面
			var urlAddress = "fosterController/updateFoster";
			// 如果没有获取到id值 则为新增页
			if ($('#hidId').val() == "") {
				urlAddress = "fosterController/insertFoster";
			}
			//提交保存
			$("#editForm").ajaxSubmit({
				url : urlAddress,
				dataType : "json",
				success : function(data) {
					if (data >= 1) {
						parent.loadData();
						parent.modal.close()
						parent.alertify.success('操作成功!');
					} else if (data == -1) {
						parent.alertify.error('该用户已存在！');
					} else {
						parent.alertify.error('操作失败！');
					}

				}
			})
		}
	}
</script>
</head>
<body>
	<div class="modal-body" style="height: 380px;">
		<form id="editForm" class="form-horizontal no-margin">
			<input type="hidden" id="hidId" name="id" value="${editFoster.id}">
			<div class="form-group">
				<label for="person" class="col-sm-3 col-xs-3 control-label">寄养人</label>
				<div class="col-sm-8 col-xs-8">
					<input id="person" name="person" value="${editFoster.person}"
						class="form-control" type="text" />
				</div>
			</div>
			<div class="form-group">
				<label for="phone" class="col-sm-3 col-xs-3 control-label">联系电话</label>
				<div class="col-sm-8 col-xs-8">
					<input id="phone" name="phone" value="${editFoster.phone}"
						class="form-control" type="text" />
				</div>
			</div>
			<div class="form-group">
				<label for="no" class="col-sm-3 col-xs-3 control-label">宠物编号</label>
				<div class="col-sm-8 col-xs-8">
					<input id="no" name="no" value="${editFoster.no}"
						class="form-control" type="text" />
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 col-xs-3 control-label">宠物姓名</label>
				<div class="col-sm-8 col-xs-8">
					<input id="name" name="name" value="${editFoster.name}"
						class="form-control" type="text" />
				</div>
			</div>
			<div class="form-group">
				<label for="price" class="col-sm-3 col-xs-3 control-label">宠物价格</label>
				<div class="col-sm-8 col-xs-8">
					<input id="price" name="price" value="${editFoster.price}"
						class="form-control" type="text" />
				</div>
			</div>

			<div class="form-group">
				<label for="remark" class="col-sm-3 col-xs-3 control-label">备注</label>
				<div class="col-sm-8 col-xs-8">
					<input id="remark" name="remark" value="${editFoster.remark}"
						class="form-control" type="text" />
				</div>
			</div>

		</form>
	</div>
	<div class="modal-footer">
		<button class="btn btn-success" type="button" onclick="save()">
			<i class="fa fa-check-circle"></i> 保 存
		</button>
		<button class="btn btn-danger" type="button"
			onclick="parent.modal.close()">
			<i class="fa fa-times-circle"></i> 取 消
		</button>
	</div>
</body>
</html>