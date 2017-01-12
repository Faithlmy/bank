$(function() {
	alert("dashjakf");
	/*$("#name").change(function() {//异步请求验证角色名称是否重复
		var val = $(this).val();
		val = $.trim(val);
		$.ajax({
			type : "post",
			url : "role.do?opt=valname",
			data : "mes=" + val,
			dataType : "text",
			cache : false,
			async : true,
			success : function(data) {
				$("#rname").html(data).css("color", "red");
			}
		});
	});*/
	//异步请求获取权限树
	$("#pri").focus(function(){
		alert("123");
		if($("#pri").val()!=""){//如果文本框中的值不为
			$("#node").show();
		}else{
			$.ajax({
			type : "post",
			url : "privilege.do?opt=tree",
			cache : false,
			dataType:"json",
			success : function(data) {
				d = new dTree('d');
				d.config.check = true;
				d.add(0, -1, '系统');
		 		for(var i = 0;i<data.length;i++ ){
		 			d.add(data[i].p_id,data[i].p_parent,data[i].p_name);
		 		}
		 		document.getElementById("node").innerHTML = d;
		 		$("#node").show();
			}
		});
		}
	});
	//单击确定  隐藏权限列表
	$("#certain").click(function() {
		$("#node").hide();
	});
});
//提交表单前的验证
function check() {
	//验证角色名称是否为空
	if ($("#name").val()=="") {
		$("#rname").html("角色名称不能为空").css("color", "red");
	}
	//根据异步请求的返回值判断是否可提交表单
	if ($("#rname").html() == "角色名称可用") {
		return true;
	} else {
		return false;
	}
}

