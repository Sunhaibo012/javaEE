<%--
  Created by IntelliJ IDEA.
  User: yellow
  Date: 2019/12/6
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../css/newregister.css" type="text/css">
	</head>

	<body>
		<div class="mypart">
			<div class="left">
				<img src="../img/20.jpg">
			</div>
			<div class="right">
				<button type="button" class="close" aria-hidden="true"><a href="${pageContext.request.contextPath}/loginPage"><img src="../img/close.png"></a></button>
				<form action="${pageContext.request.contextPath}/doUserRegister" method="post">
					<div class="menu">
						<div class="input-group">
							<span class="input-group-addon"><img src="../img/join.png"></span>
							<input type="text" id="userName" name="userName" class="form-control" placeholder="请输入昵称"><span style="font-size: 14px;" id="s_userName"></span>
						</div>
						<div class="input-group">
							<span class="input-group-addon"><img src="../img/unlock.png"></span>
							<input type="password" name="userPassword" class="form-control" placeholder="请输入密码 长度5-10个字符">
						</div>
						<div class="input-group">
							<span class="input-group-addon"><img src="../img/locking.png"></span>
							<input type="password" name="repeatPassword" class="form-control" placeholder="请重复输入密码">
						</div>
						<div class="input-group">
							<span class="input-group-addon"><img src="../img/email.png"></span>
							<input type="text" name="userEmail" class="form-control" placeholder="请输入邮箱地址">
						</div>
						<div class="input-group" style="margin-left: 0px;">
							<span class="input-group-addon"><img src="../img/safety.png"></span>
							<input type="text" class="form-control" name="resultCode" placeholder="请输入图中验证码" style="width: 170px;">
							<div class="yanz">
								<img id="CodePicture" style="width: 108px ;height: 42px" src="${pageContext.request.contextPath}/RSCode">
							</div>
							<div class="refresh" style="display: inline;position: absolute;top: 7px;left: 348.8px;font-size: 20px;color: transparent;">
								<a href="javascript:void(0);" onclick="changeCode()" style="color: transparent;">换一张</a>
							</div>
						</div>
						<div class="toreg">
							<button type="button" class="btn btn-primary" onclick="reset1()">重 置
				</button>
							<button type="submit" class="btn btn-primary" onclick="submit1(this)">立 即 注 册
				</button>
						</div>
					</div>
					</form>
			</div>
		</div>
		<script src="../js/register.js" type="text/javascript"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script>
			//在页面加载完成后
			$(function() {
				//给username绑定blur事件
				$("#userName").blur(function() {
					//获取username文本输入框的值
					var userName = $(this).val();
					//发送ajax请求
					//期望服务器响应回的数据格式：{"userExist":true,"msg":"此用户名太受欢迎了，请换一个"}
					//{"userExist":false,"msg":"此用户名可用"}
					$.get("CheckUserServlet", {
						userName: userName
					}, function(data) {
						//判断userExist键的值是否是true
						var span = $("#s_userName");
						if(data.userExist) {
							//用户名存在
							span.css("color", "red"); //样式
							span.html("*该用户名已存在");
						} else {
							//用户名不存在
							span.css("color", "blue"); //样式
							span.html("*此用户名可用");
						}
					}, "json");
				});
			});

			function changeCode() {
				document.getElementById("code").src = "${pageContext.request.contextPath}/RSCode?d=" + new Date().getTime();
			}
		</script>
	</body>

</html>