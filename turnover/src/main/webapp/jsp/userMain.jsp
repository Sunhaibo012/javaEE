<!--<%--
  Created by IntelliJ IDEA.
  User: yellow
  Date: 2019/12/6
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
-->
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<title>userMain</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="../css/admin.css" type="text/css">
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>

	<body>
		<div class="head1">
			<div class="logo">
				<img src="../img/logo-2.jpg">
			</div>
			<div class="correlation">
				<div class="message">
					<a href="#"><img src="../img/message1.png"></a>
				</div>
				<div class="quit">
					<a href="${pageContext.request.contextPath}/loginPage"><img src="../img/quit.png"></a>
				</div>
			</div>
		</div>

		<div class="main">
			<div class="personal">
				<div class="top">
					<div class="photo">
						<img src="../img/头像.png">
						<div class="header">
							<input type="hidden" id="picPath" value="${detail.picPath}" />
							<div id="thisImage">
							</div>
						</div>
						<form method="post" enctype="multipart/form-data">
							<p class="modify">
								<input type="file" class="file" id="file" />
								<a href="javascript:;" id="queryImg">修改头像</a>
							</p>
						</form>
					</div>
					<div class="other">
						<div class="username">
							<p style="color: #cccccc">${user.user_name}</p>
							<p style="color: #cccccc">ID:${user.user_id}</p>
						</div>
						<div class="change" style="margin-top: 12px;">
							<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="font-size: 12px;">密码设置</button>
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
												&times;
												</button>
													<h4 class="modal-title" id="myModalLabel">
														密码修改
													</h4>
										</div>
										<form action="${pageContext.request.contextPath}/updatePassword" method="post">
										<div class="modal-body">
												<div class="input-group">
													<span class="input-group-addon">id</span>
													<input type="text" class="form-control" name="userId" value="${user.user_id}" placeholder="${user.user_id}" readonly>
												</div>
												<div class="input-group">
													<span class="input-group-addon">旧密码</span>
													<input type="password" class="form-control" name="oldPassword"  placeholder="请输入旧密码">
												</div>
												<div class="input-group">
													<span class="input-group-addon">新密码</span>
													<input type="password" class="form-control" name="newPassword" id="newpwd1" placeholder="请输入新密码">
												</div>
												<div class="input-group">
													<span class="input-group-addon">确认密码</span>
													<input type="password" class="form-control" name="repeatPassword" id="newpwd2" placeholder="请确认密码">
												</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
												</button>
													<button type="submit" class="btn btn-primary" onclick="sure()">
														提交更改
													</button>
										</div>
										</form>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal -->
							</div>
						</div>
					</div>
				</div>
				<div class="menu">
					<ul>
						<li>
							<button id="active1" onclick="show1()">个 人 信 息</button>
						</li>
						<li>
							<button  id="active2"  onclick="show2()">个 人 通 知</button>
						</li>
					</ul>
				</div>
			</div>
			<div class="operate">
				<div class="mubu">
					<!--个人信息-->
					<div id="myInformation">
						<form action="${pageContext.request.contextPath}/userUpdate" method="get">
							<div class="form-group">
								<label>账号:</label>
								<input type="text" class="form-control" name="user_id"  value="${user.user_id}" readonly>
							</div>
							<div class="form-group">
								<label>昵称:</label>
								<input type="text" class="form-control" name="user_name"  value="${user.user_name}">
							</div>
							<div class="form-group">
								<label>邮箱:</label>
								<input type="text" class="form-control" name="user_email"  value="${user.user_email}">
							</div>
							<div class="form-group">
								<label>生日:</label>
								<input type="date" class="form-control" name="user_birthday"  value="${user.user_birthday}">
							</div>
							<div class="form-group">
								<label>电话:</label>
								<input type="text" class="form-control" name="user_tel"  value="${user.user_tel}">
							</div>
							<div class="form-group">
								<label style="margin-right: 6px;">个性签名:</label>
								<input type="text" class="form-control" name="user_signature"  value="${user.user_signature}">
							</div>
							<input type="submit"  class="btn btn-default" value="确认修改" />
						</form>
					</div>
					<!--个人通知-->
					<div id="announce">
						<div class="search">
							<form>
								<input type="text" id="myInput" placeholder="标题/关键字">
							</form>
							<button class="dele">
                    <span class="glyphicon glyphicon-trash s1"></span>
                    删除
                </button>
							<button id="fabu2" class="btn btn-info" onclick="Show()">
                    <span class="glyphicon glyphicon-plus" ></span>
                    发布
                </button>
							<div id="shade" class="c1 hide"></div>
							<div id="modal" class="c2 hide">
								<h4>添加公告</h4>
								<div class="line"></div>
								<form>
									<span>公告标题：</span><br>
									<input type="text" class="form-control">
									<br>
									<span>作者：</span><br>
									<input type="text" class="form-control">
									<br>
									<div class="form-group">
										<span>内容：</span><br>
										<!--<label for="name">内容:</label>-->
										<textarea class="form-control" rows="15"></textarea>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" onclick="Hide()">关闭</button>
										<button type="button" class="btn btn-primary">发布</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript " src="../js/admin.js "></script>
<%--		<script>--%>
<%--			var surechange = document.getElementById("surechange");--%>
<%--			surechange.onclick = function() {--%>
<%--				alert("修改成功");--%>
<%--			}--%>
<%--		</script>--%>
		<script>
			$(document).ready(function() {
				//显示头像
				var picPath = document.getElementById("picPath").value;
				var queryImg = document.getElementById("queryImg");
				if(picPath == null || picPath == "") {
					$("#thisImage").html('');
				} else {
					$("#thisImage").append("<img class=\"head\" src=\"" + "<%=basePath%>" + picPath + "\"/>");
				}
				//点击超链接触发头像上传
				$("#queryImg").bind("click", function() {
					if($("#file").click()) {
						if($("#file").val() == '' || $("#file").val() == null) {
							$("#file").change();
						}
					}
				});
				//头像上传
				$("#file").change(function() {
					var animateimg = $("#file").val(); //获取上传的图片路径
					var imgarr = animateimg.split('\\'); //分割
					var myimg = imgarr[imgarr.length - 1]; //去掉 // 获取图片名
					var houzui = myimg.lastIndexOf('.'); //获取 . 出现的位置
					var ext = myimg.substring(houzui, myimg.length).toUpperCase(); //切割 . 获取文件后缀
					var file = $('#file').get(0).files[0]; //获取上传的文件
					var user_id = "${user.user_id}"; //获取id
					var fileSize = file.size; //获取上传的文件大小
					var maxSize = 1048576;
					if(ext != '.PNG' && ext != '.GIF' && ext != '.JPG' && ext != '.JPEG' && ext != '.BMP') {
						alert('文件类型错误,请上传正确图片类型');
						return false;
					} else if(parseInt(fileSize) >= parseInt(maxSize)) {
						alert('上传的文件不能超过1MB');
						return false;
					} else {
						//上传请求
						var formData = new FormData();
						formData.append("file", file);
						formData.append("user_id", user_id);
						$.ajax({
							type: "POST", //请求类型
							url: "<%=basePath%>queryImg",
							data: formData, //请求参数
							contentType: false,
							processData: false, //这个很有必要，不然不行
							success: function(
								data) {
								if(data.result == "true") {
									location
										.reload();
								}
								if(data.result == "false") {
									alert("亲,修改头像失败了");
								}
							},
							error: function(
								data) { //当访问时候，404，500 等非200的错误状态码
								alert("亲,修改头像失败了");
							}
						});
					}
				});
			});
		</script>
		<script>
			function sure(){
				var psw1 = $("#newpwd1").value;
				var psw2 = $("#newpwd2").value;
				if (psw1 != psw2) {
					alert("两次输入密码不同，请重新填写！");
				} else {
					alert("修改成功，请重新登录");
				}
			}
		</script>
	</body>

</html>