$(function(){//发送异步请求判断权限名称是否可用
 			$("#name").change(function(){
 					var val = $(this).val();
 					val = $.trim(val);
 					var url = "privilege.do?opt=ajax";
 					var args = {"p_name":val, "time": new Date()};
 					$.post(url, args, function(data){
 						$("#cname").html(data).css("color","red");
 					});
 			});
 		});
 		function check(){
 				//验证权限名称是否为空
 				if($("#name").val()==""){
 					$("#cname").html("权限名称不能为空").css("color","red");
 				}
 				//根据异步请求的返回值判断是否可提交表单
				if($("#cname").html()=="权限名称可用"){
					return true;
				} else {
					return false;
				}
			}