
//重置
function reset1(argument) {
	var inputs = document.getElementsByClassName("form-control");
	for(var i = 0; i < inputs.length; i++) {
		inputs[i].value = '';
	}
}
//登陆验证
function submit1(argument) {
	var inputs = document.getElementsByClassName("form-control");

	for (var i = 0; i < inputs.length; i++) {

		var tag = inputs[i];
		// tag.value 得到这个标签的内容
		if (tag.value == '') {

			switch (i) {
				case 0:
					return alert("用户名不可为空");
					break;
				case 1:
					return alert("密码不可为空");
					break;
				case 2:
					return alert("确认密码不可为空");
					break;
				case 3:
					return alert("邮箱不可为空");
					break;
				case 4:
					return alert("验证码不可为空");

			}
		}
	}

	var psw1 = inputs[1].value;
	var psw2 = inputs[2].value;

	if (psw1 != psw2) {
		return alert("两次输入密码不一致");
		return false;
	}

	var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
	// 邮箱输入框的内容
	var email = inputs[3].value;
	// test()方法是校验方法 括号里输入需要校验的字符 返回布尔类型结果 使用!取反
	if (!reg.test(email)) {
		return alert("请输入正确的邮箱地址");
	}
		alert("注册成功");
}


//刷新验证码
//function createnew() {
//	var block = document.getElementById('code');
//	var codeword = ' ';
//	var codes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
//	var codelgt = 4;
//	for(var i = 0; i < codelgt; i++) {
//		var newcode = Math.floor(Math.random() * codes.length);
//		codeword = codeword + codes[newcode];
//	}
//	block.innerHTML = codeword;
//
//}
//显示
//window.onload = function() {
//	createnew();
//}