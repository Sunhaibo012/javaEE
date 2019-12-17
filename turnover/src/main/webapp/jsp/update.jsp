<%--
  Created by IntelliJ IDEA.
  User: yellow
  Date: 2019/12/16
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/adminMain.css" type="text/css">
    <script src="../js/adminMain.js"></script>
</head>
<body>
<div class="modal-dialog">
    <div class="modal-content">
        <!-- 模态框头部 -->
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="font-size:18px">修改人员信息</h4>
        </div>
        <!-- 模态框主体 -->
        <form action="${pageContext.request.contextPath}/update">
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
</body>
</html>
