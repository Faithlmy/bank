var t;
function tDate() {
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var hours = today.getHours();
	var minute = today.getMinutes();
	var second = today.getSeconds();
	var week = today.getDay();

	if (month < 10) {
		month = "0" + month;
	}
	if (day < 10) {
		day = "0" + day;
	}
	if (hours < 10) {
		hours = "0" + hours;
	}
	if (minute < 10) {
		minute = "0" + minute;
	}
	if (second < 10) {
		second = "0" + second;
	}
	var week1;
	switch (week) {
	case 1:
		week1 = "一";
		break;
	case 2:
		week1 = "二";
		break;
	case 3:
		week1 = "三";
		break;
	case 4:
		week1 = "四";
		break;
	case 5:
		week1 = "五";
		break;
	case 6:
		week1 = "六";
		break;
	case 0:
		week1 = "日";
		break;
	}
	var dateTime = year + "年" + month + "月" + day + "日 星期" + week1 + " "
			+ hours + ":" + minute + ":" + second;
	document.getElementById("dateTime").innerHTML = dateTime;
	t = setTimeout("tDate()", 1000);
}

function tGo() {
	tDate();
}
function tStop() {
	clearTimeout(t);
}

function switchSysBar() {
	var locate = location.href.replace('middel.html', '');
	var ssrc = document.all("img1").src.replace(locate, '');
	if (ssrc == "images/main_55.gif") {
		document.all("img1").src = "images/main_55_1.gif";
		document.all("frmTitle").style.display = "none";
	} else {
		document.all("img1").src = "images/main_55.gif";
		document.all("frmTitle").style.display = "";
	}
}

function showsubmenu(sid) {
	whichEl = eval("submenu" + sid);
	imgmenu = eval("imgmenu" + sid);
	eval("submenu" + sid + ".style.display=\"\";");
	imgmenu.background = "images/main_47.gif";
	for (i = 1; i < 20; i++) {
		if (sid != i) {
			eval("submenu" + i + ".style.display=\"none\";");
			imgmenu.background = "images/main_48.gif";
		}
	}
	/*
	 * if (whichEl.style.display == "none") { eval("submenu" + sid +
	 * ".style.display=\"\";"); imgmenu.background = "../images/main_47.gif"; }
	 * else { eval("submenu" + sid + ".style.display=\"none\";");
	 * imgmenu.background = "../images/main_48.gif"; }
	 */

}

function switchSysBar() {
	var locate = location.href.replace('middel.html', '');
	var ssrc = document.all("img1").src.replace(locate, '');
	if (ssrc == "images/main_55.gif") {
		document.all("img1").src = "images/main_55_1.gif";
		document.all("frmTitle").style.display = "none";
	} else {
		document.all("img1").src = "images/main_55.gif";
		document.all("frmTitle").style.display = "";
	}
}

// 后退操作
function back() {
	/*
	 * var url=window.location.href; alert("当前url"+url); var
	 * ss=document.referrer; alert("后退一步"+ss); var
	 * s=url.split("/")[1].split("/")[1]; alert("截取url"+s); var
	 * ss2=ss.split("/")[1].split("/")[1]; alert("截取后退一步"+ss2);
	 */
	history.go(-1);
}
function advance() {
	history.go(1);
}

function flush() {

}
