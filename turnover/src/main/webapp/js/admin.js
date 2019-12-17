var active1 = document.getElementById("active1");
var active2 = document.getElementById("active2");
active1.style.cssText = 'background-color: rgba(13, 13, 13, 0.2);color: white;';
var d = document.getElementById('myInformation');
d.style.display = "block";
// 显示个人信息
function show1() {
	document.getElementById('announce').style.display = 'none';
	var d = document.getElementById('myInformation');
	d.style.display = "block";
	active1.style.cssText = 'background-color: rgba(13, 13, 13, 0.2);color: white;';
	active2.style.cssText = 'background-color: transparent;color: #cfcfcf;';

}
// 显示个人通知
function show2() {
	document.getElementById('myInformation').style.display = 'none';
	var d = document.getElementById('announce');
	d.style.display = "block";
	active2.style.cssText = 'background-color: rgba(13, 13, 13, 0.2);color: white;';
	active1.style.cssText = 'background-color: transparent;color: #cfcfcf;';
	active1.style.border = "0px";
}

// 改名
function changename(obj) {

	document.getElementById("name").readOnly = false;
	var ts = document.getElementById("name").value;
	var cn = document.getElementById("changen");
	if(cn.innerHTML == "修改") {
		cn.innerHTML = "保存";
		ts.contentEditable = "true";
	} else {
		cn.innerHTML = "修改";
		ts.contentEditable = "false";
	}
}

// 改邮箱
function changeemail(obj) {

	document.getElementById("email").readOnly = false;
	var ts = document.getElementById("email").value;
	var cn = document.getElementById("changeme");
	if(cn.innerHTML == "修改") {
		cn.innerHTML = "保存";
		ts.contentEditable = "true";
	} else {
		cn.innerHTML = "修改";
		ts.contentEditable = "false";
	}

}

//编辑 
var allX = document.getElementsByClassName("glyphicon glyphicon-edit x1");
for(var i = 0; i < allX.length; i++) {
	allX[i].onclick = function() {
		var ts = this.parentNode.parentNode;
		if(this.className == "glyphicon glyphicon-edit x1") {
			this.className = "glyphicon glyphicon-ok x1";
			ts.contentEditable = "true";
		} else {
			this.className = "glyphicon glyphicon-edit x1";
			ts.contentEditable = "false";
		}
	}
}