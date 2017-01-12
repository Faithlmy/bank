// 登录验证
// form 登录表单对象
function loginCheck(form) {
	var id = form.id.value;
	var pswd = form.pwd.value;
	var verify = form.vtf.value;
	var msg;
	if (id == "") {
		msg = "请输入账号";
	} else if (id.length < 2 || id.length > 120) {
		msg = "账号应为2—120位字符";
	} else if (pswd == "") {
		msg = "请输入密码";
	} else if (verify == "") {
		msg = "请输入验证码";
	} else {
		return true;
	}
	alert(msg);
	return false;
}

// 注册验证
// form 注册表单对象
function regCheck(form) {
	var id = form.d_id.value;
	var pswd = form.d_pwd.value;
	var pCfm = form.d_pCfm.value;
	var name = form.d_name.value;
	var cardNo = form.d_cardNo.value;
	var email = form.d_email.value;
	var addr = form.d_addr.value;
	var zip = form.d_zip.value;

	var msg;
	if (id == "") {
		msg = "请输入账号";
	} else if (id.length < 2 || id.length > 120) {
		msg = "账号应为2—120位字符";
	} else if (pswd == "") {
		msg = "请输入密码";
	} else if (pCfm != pswd) {
		msg = "两次输入密码不一致";
	} else if (cardNo != "") {
		msg = isCardNo(cardNo);
	} else if (email != "" && !ismail(email)) {
		msg = "邮箱格式非法";
	} else if (addr.length > 1000) {
		msg = "地址长度应小于1000字符";
	} else if (zip != "") {
		if (isNaN(zip))
			msg = "邮编中不能包含非数字字符";
		else if (zip < 100000 || zip > 1000000)
			msg = "邮编位数不正确";
	}
	// 如果有错误信息，则弹出对话框提示，并返回false
	if (msg) {
		alert(msg);
		return false;
	}
	return true;
}

function check(formId) {
	var flag = true;
	$("#" + formId + " input").each(function() {
		if ($(this).attr('required') || $(this).attr('validType')) {
			if (!$(this).validatebox('isValid')) {
				flag = false;
				return;
			}
		}
	});
	return flag;
}


// 判断账户名是否合法 如不合法在指定组件中提示
// value 输入账户的控件的值
// tip 给出提示的组件的Id
// echo 如果账户合法，给出的字符串；如果没有该参数，则账户合法时指定组件没有提示信息。
function vtfId(value, tip, echo) {
	var msg;
	if (value == "") {
		msg = "请输入账户";
	} else if (value.length < 3 || value.length > 100) {
		msg = "账户应为3—100位字符";
	}
	if (msg) {
		document.getElementById(tip).innerHTML = msg;
	} else {
		if (!echo)
			echo = "";
		document.getElementById(tip).innerHTML = echo;
	}
}

function vtfPwd(value, tip, echo) {
	vtfNull(value, "请输入密码", tip, echo);
}

function vtfCode(value, tip, echo) {
	vtfNull(value, "请输入验证码", tip, echo);
}

// 判断两次输入的密码是否一致
// 密码框的名称必须为d_pwd
// input 确认密码控件
// tip 提示组件
// 密码一致时的字符串
function vtfEqPwd(input, tip, echo) {
	var msg;
	if (input.value != input.form.d_pwd.value) {
		msg = "两次输入的密码不一致";
	}
	if (msg) {
		document.getElementById(tip).innerHTML = msg;
	} else {
		if (!echo)
			echo = "";
		document.getElementById(tip).innerHTML = echo;
	}
}

// 验证身份证号
function vtfCardNo(value, tip, echo) {
	if (!echo)
		echo = "";
	if (value == "") {
		document.getElementById(tip).innerHTML = echo;
		return;
	}
	var msg = isCardNo(value);
	if (!msg)
		msg = echo;
	document.getElementById(tip).innerHTML = msg;
}

// 验证电子邮箱
function vtfEmail(value, tip, echo) {
	if (!echo)
		echo = "";
	if (value == "" || ismail(value)) {
		document.getElementById(tip).innerHTML = echo;
	} else
		document.getElementById(tip).innerHTML = "邮箱格式非法";
}

// 验证地址长度
function vtfAddr(value, tip, echo) {
	vtfLength(value, "地址长度超过1000", 1000, tip, echo);
}
// 验证是否为空
// value 输入控件中的值
// text 如果输入为空的提示文本
// tip 提示组件的Id
// echo 如果输入文本不为空，提示的文本，如果不给出，默认为""
function vtfNull(value, text, tip, echo) {
	var msg;
	if (value == "") {
		msg = text;
	}
	if (msg) {
		document.getElementById(tip).innerHTML = msg;
	} else {
		if (!echo)
			echo = "";
		document.getElementById(tip).innerHTML = echo;
	}
}

// 验证是否为空
// value 输入控件中的值
// text 如果输入为空的提示文本
// max 文本上限
// tip 提示组件的Id
// echo 如果输入文本不为空，给提示的文本，如果无提示文本，默认为""
function vtfLength(value, text, max, tip, echo) {
	if (value == "" || value.length <= max) {
		if (!echo)
			echo = "";
		document.getElementById(tip).innerHTML = echo;
	} else {
		document.getElementById(tip).innerHTML = text;
	}
}

// 验证是否为空
// tip 提示组件的Id
// value 获取输入控件中的值
function showLength(value, tip, length) {
	if (value.length <= length)
		document.getElementById(tip).innerHTML = value.length + 1 + "/1000";
	else
		document.getElementById(tip).innerHTML = "<font color='red'>"
				+ (value.length + 1) + "</font>/1000";
}

// 将textarea组件内容写入表单
// fName 表单名称
// area textarea组件名称
// input input组件名称
function area2form(fName, area, input) {
	var str = "document." + fName + ".";
	eval(str + input + ".value = " + str + area + ".value;");
}

function sele2from(fName, sele, input) {
	var str = "document." + fName + ".";
	eval(str + input + ".value=" + str + sele + "value;");
}

// 验证身份证号是否合法 合法返回null，否则返回错误信息，不能验证尾数为X的身份证号
function isCardNo(num) {
	if (isNaN(num)) {
		return "身份证号输入的不全是数字！"
	}
	var len = num.length, re;
	if (len == 15) // 15位身份证的判断
		re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/);
	else if (len == 18) // 18位身份证的判断
		re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\d)$/);
	else {
		return "身份证号输入的数字位数不对！";
	}
	var a = num.match(re); // 判断是否有符合条件的表达式
	if (a != null) {
		if (len == 15) {
			var D = new Date("19" + a[3] + "/" + a[4] + "/" + a[5]);
			var B = D.getYear() == a[3] && (D.getMonth() + 1) == a[4]
					&& D.getDate() == a[5];
		} else { // 对18位身份证中日期的判断
			var D = new Date(a[3] + "/" + a[4] + "/" + a[5]);
			var B = D.getFullYear() == a[3] && (D.getMonth() + 1) == a[4]
					&& D.getDate() == a[5];
		}
		if (!B) {
			var msg = "输入的身份证号 " + a[0] + " 里出生日期不对！";
			return msg;
		}
	}
	return null;
}

var aCity = {
	11 : "北京",
	12 : "天津",
	13 : "河北",
	14 : "山西",
	15 : "内蒙古",
	21 : "辽宁",
	22 : "吉林",
	23 : "黑龙江",
	31 : "上海",
	32 : "江苏",
	33 : "浙江",
	34 : "安徽",
	35 : "福建",
	36 : "江西",
	37 : "山东",
	41 : "河南",
	42 : "湖北",
	43 : "湖南",
	44 : "广东",
	45 : "广西",
	46 : "海南",
	50 : "重庆",
	51 : "四川",
	52 : "贵州",
	53 : "云南",
	54 : "西藏",
	61 : "陕西",
	62 : "甘肃",
	63 : "青海",
	64 : "宁夏",
	65 : "新疆",
	71 : "台湾",
	81 : "香港",
	82 : "澳门",
	91 : "国外"
}

// 验证身份证号是否合法 合法返回true，否则返回错误信息
function isCardID(sId) {
	var iSum = 0;
	var info = "";
	if (!/^\d{17}(\d|x)$/i.test(sId))
		return "你输入的身份证长度或格式错误";
	sId = sId.replace(/x$/i, "a");
	if (aCity[parseInt(sId.substr(0, 2))] == null)
		return "你的身份证地区非法";
	sBirthday = sId.substr(6, 4) + "-" + Number(sId.substr(10, 2)) + "-"
			+ Number(sId.substr(12, 2));
	var d = new Date(sBirthday.replace(/-/g, "/"));
	if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d
			.getDate()))
		return "身份证上的出生日期非法";
	for ( var i = 17; i >= 0; i--)
		iSum += (Math.pow(2, i) % 11) * parseInt(sId.charAt(17 - i), 11);
	if (iSum % 11 != 1)
		return "你输入的身份证号非法";
	return true;// aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女")
}

function isPhone(value) {
	// 验证电话号码
	var flag = /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i
			.test(value);
	if (!flag)
		// 验证手机号码
		flag = /^(13|15|18)\d{9}$/i.test(value);
	return flag;
}

// 验证邮箱是否合法
function ismail(mail) {
	// 测试E-mail的正则表达式
	var reg = new RegExp(
			/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za -z0-9]+)*\. [A-Za-z0-9]+$/);
	return (reg.test(mail));
}

function vtfCateName() {
	var names = document.getElementById("c_name");
	if (names.value.length < 5 || names.value.length > 10) {
		document.getElementById("names").innerHTML = "商品类别名称为6-10位";
	} else {
		document.getElementById("names").innerHTML = " ";
	}
}

// 商品类别描述验证
function vtfCateDescribe() {
	var describes = document.getElementById("c_describe");
	if (describes.value.length > 1000) {
		document.getElementById("describes").innerHTML = "字数不能多于1000字";
	} else {
		document.getElementById("describe").innerHTML = " ";
	}
}

// 商品名称验证
function vtfGoodsName() {
	var names = document.getElementById("p_name");
	if (names.value.length < 2 || names.value.length > 10) {
		document.getElementById("names").innerHTML = "商品名称为2-50字";
	} else {
		document.getElementById("names").innerHTML = " ";

	}
}