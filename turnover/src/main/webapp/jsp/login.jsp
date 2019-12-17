<%--
  Created by IntelliJ IDEA.
  User: yellow
  Date: 2019/12/6
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title>online</title>
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../css/newonline.css" type="text/css">

		<script type="text/javascript">
			// 时间戳 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
			function changeCode() {
				document.getElementById("CodePicture").src = "${pageContext.request.contextPath}/LCCode?d=" + new Date().getTime();
				document.getElementById("CodePicture2").src = "${pageContext.request.contextPath}/LCCode?d=" + new Date().getTime();
			}
		</script>
	</head>

	<body>
		<div class="ourweb">
			<div class="head">
				<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
					开始
				</button>
				<!-- 管理员登陆 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel" style="color: #8d7ce1">
									后台管理系统
								</h4>
								<h4 class="modal-title" id="myModalLabel">
									<em style="color: #9e9e9e;">Mananger System</em>
								</h4>
							</div>
							<!--模态框内容-->
							<div class="modal-body">
								<!--账号-->
								<form action="${pageContext.request.contextPath}/doAdminLogin"  class="loginForm">
									<div class="input-group">

										<input type="text" name="adminName" class="form-control" id="username2" placeholder="请输入管理员账号">
										<span class="input-group-addon"><img src="../img/join.png"></span>
									</div>
									<!--密码-->
									<div class="input-group">
										<input type="password" class="form-control" name="password" id="mima2" placeholder="请输入密码">
										<span class="input-group-addon"><img src="../img/locking.png"></span>
									</div>

									<div class="modal-footer" style="text-align: center">
										<button type="submit" class="btn btn-primary">登陆</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="main">
				<form action="${pageContext.request.contextPath}/doUserLogin" method="post" class="loginForm" >
				<div class="input-group">
					<span class="input-group-addon"><img src="../img/join.png"></span>
					<input type="text" class="form-control" name="userId" id="username" value="${userId}" placeholder="请输入你的账号">
				</div>
				<div class="input-group">
					<span class="input-group-addon"><img src="../img/locking.png"></span>
					<input type="password" class="form-control" name="userPassword"  id="mima1" placeholder="请输入密码">
				</div>
				<div class="input-group" style="margin-left: 0px;">
					<span class="input-group-addon"><img src="../img/safety.png"></span>
					<input type="text" class="form-control" name="code" placeholder="请输入图中验证码" style="width: 190px;" id="yanzheng">
					<div class="yanz">
						<img id="CodePicture" style="width: 144px ;height: 44px" src="${pageContext.request.contextPath}/LCCode">
					</div>
					<div class="refresh" style="display: inline;position: absolute;top: 7px;left: 348.8px;font-size: 20px;color: transparent;">
						<a href="javascript:void(0);" onclick="changeCode()" style="color: transparent;">换一张</a>
					</div>
				</div>
				<div class="other">
					<div class="rem">
						<input type="checkbox" class="remember1">
						<a class="remem1">记住密码</a>
					</div>
					<div class="forget">
						<a href="#">忘记密码 ?</a>
					</div>
				</div>
				<div class="onAndReg">
					<button type="submit" class="btn btn-primary" onclick="submit1()" style="width: 450px;padding: 10px 0px;">登 陆</button>
				</div>
				<div class="toreg">
					<a href="${pageContext.request.contextPath}/userRegister" class="reg">还没有账号？立即注册</a>
				</div>
			</form>
			</div>
		</div>
		<script src="../js/online.js" type="text/javascript"></script>
	</body>
</html>