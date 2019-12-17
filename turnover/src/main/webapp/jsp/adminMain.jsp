<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>online</title>
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../css/adminMain.css" type="text/css">
		<script src="../js/adminMain.js"></script>
		
	</head>

	<body>
		<div class="head">
			<div class="logo">
				<img src="../img/nenu.png">
			</div>
			<div class="position">
				<div class="date">
					<canvas id="canvas"></canvas>

				</div>

			</div>
			<div class="adminName">
				<div class="other">
					<ul>
						<li>
							<div class="touxiang">
								<img src="../img/头像.jpg">
							</div>
							<img src="../img/show_more.png" style="margin-top: -56px;margin-left: 80px;width: 33px;">
							<ul>
								<li><img src="../img/join1.png">
									<a>我的主页</a>
								</li>
								<li><img src="../img/shezhi.png">
									<a>个人设置</a>
								</li>
								<li><img src="../img/icon4.png">
									<a href="${pageContext.request.contextPath}/loginPage">退出</a>
								</li>
							</ul>
						</li>
					</ul>

				</div>
			</div>
		</div>
		<div class="main">
			<div class="left">
				<div class="information">
					<img src="../img/头像.jpg">
					<a class="adminId">你好！admin</a>
				</div>
				<div class="operate">
					<ul class="menu">
						<li id="char">
							<a href="#" class="second"><button onclick="character()" style="border: 0;background-color:transparent;">角色管理</button></a>
						</li>
					</ul>
				</div>
			</div>
			<div class="right">
				<div class="message">
					<!-- <a href="${pageContext.request.contextPath}/findAllUser">所有人员</a> -->
					<div class="function">
						<form style="display: inline-block; width: 380px;" action="${pageContext.request.contextPath}/byName" method="post">
							<input style="width: 194px;display: inline;" type="text" name="user_name" class="form-control" placeholder="输入角色名">
							<button type="submit" class="btn btn-primary" style="display: inline;margin-left:20px;">查询</button>
						</form>
						<div class="weather">
							<iframe id="tianqi" scrolling="no" frameborder="0" allowtransparency="true" style="height: 30px;" src="http://i.tianqi.com/index.php?c=code&a=getcode&id=34&h=25&w=280"></iframe>
						</div>
						<div class="line">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>账号</th>
										<!--<th>密码</th>-->
										<th>昵称</th>
										<th>性别</th>
										<th>电话</th>
										<th>邮箱</th>
										<th>生日</th>
										<th>个性签名</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${pageInfo.list}" var="user">
										<tr>
											<td style="width:13%">${user.user_id }</td>
											<!--<td>${user.user_password }</td>-->
											<td style="width:13%"> ${user.user_name}</td>
											<td style="width:8%"> ${user.sex } </td>
											<td style="width:17%"> ${user.user_tel }</td>
											<td style="width:12%">${user.user_email }</td>
											<td style="width:10%">${user.user_birthday}</td>
											<td style="width:13%">${user.user_signature} </td>
											<td style="width:14%">
												<a class="btn btn-active " data-toggle="modal" data-target="#myModal" href="${pageContext.request.contextPath}/toUpdate/${user.user_id}">修改</a>
												<a class="btn btn-active" onclick="if (confirm('您确定删除吗？')==false) return false;" href="${pageContext.request.contextPath}/delete/${user.user_id}">删除</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<table>
							<tr>
								<div class="number">
									以上数据：
									<B style="color:red">${pageInfo.total} </B>条
								</div>
								<div class="pages">
									共[
									<B>${pageInfo.total}</B>]条记录，共[
									<B>${pageInfo.pages}</B>]页 ,
									<c:if test="${ pageInfo.pageNum > 1 }">
										[
										<A href="${pageContext.request.contextPath}/findAllUser?pageNum=${pageInfo.prePage}&pageSize=4">前一页</A>]
									</c:if>
									<input type="hidden" name="page" id="page" value="" /> 第
									<B>${pageInfo.pageNum}</B>页
									<c:if test="${ pageInfo.pageNum < pageInfo.pages }">
										[
										<A href="${pageContext.request.contextPath}/findAllUser?pageNum=${pageInfo.nextPage}&pageSize=4">后一页</A>]
									</c:if>
								</div>
							</tr>
						</table>
					</div>
					<!-- 模态框 -->
					<div class="modal fade" id="myModal">
						<div class="modal-dialog">

							<div class="modal-content">
								<form action="${pageContext.request.contextPath}/update">
								<!-- 模态框头部 -->
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title" style="font-size:18px">修改人员信息</h4>
								</div>
								<!-- 模态框主体 -->
								<div class="modal-body">

										<div class="input-group">
											<span class="input-group-addon">账号</span>
											<input type="text" class="form-control" name="user_id" value="${p.user_id}" readonly>
										</div>
										<div class="input-group">
											<span class="input-group-addon">密码</span>
											<input type="text" class="form-control" name="user_password" value="${p.user_password}">
										</div>
										<div class="input-group">
											<span class="input-group-addon">昵称</span>
											<input type="text" class="form-control" name="user_name" value="${p.user_name}">
										</div>
										<div class="input-group">
											<span class="input-group-addon">性别</span>
											<input type="text" class="form-control" name="sex" value="${p.sex}">
										</div>
										<div class="input-group">
											<span class="input-group-addon">电话</span>
											<input type="text" class="form-control" name="user_tel" value="${p.user_tel}">
										</div>
										<div class="input-group">
											<span class="input-group-addon">邮箱</span>
											<input type="text" class="form-control" name="user_email" value="${p.user_email}">
										</div>
										<div class="input-group">
											<span class="input-group-addon">生日</span>
											<input type="date" class="form-control" name="user_birthday" value="${p.user_birthday}">
										</div>
										<div class="input-group">
											<span class="input-group-addon">个性签名</span>
											<input type="text" class="form-control" name="user_signature" value="${p.user_signature}">
										</div>
								</div>
								<!-- 模态框底部 -->
								<div class="modal-footer">
									<button type="submit" class="btn btn-secondary">确认修改</button>
									<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
								</div>
							</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="../js/digit.js"></script>
		<script src="../js/time.js"></script>
	</body>
</html>