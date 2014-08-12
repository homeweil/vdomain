<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/8/12 0012
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="http://cdn.bootcss.com/twitter-bootstrap/2.2.2/css/bootstrap.min.css" rel="stylesheet">
    <title>修改账户</title>
    <style>
        .btn
        {
            border: none;
            background: #34495e;
            color: white;
            font-size: 16.5px;
            text-decoration: none;
            text-shadow: none;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            -webkit-transition: 0.25s;
            -moz-transition: 0.25s;
            -o-transition: 0.25s;
            transition: 0.25s;
            -webkit-backface-visibility: hidden;
        }
    </style>
</head>
<body>
<div>
    <form id="form" action="${pageContext.request.contextPath}/login/updateUserDo.cfg" method="post">
        <p><label>ID</label><input type="text" readonly="readonly"  id="id" name="id" value="${user.id}"/></p>
        <p><label>账户</label><input type="text" id="userName" name="userName" readonly="readonly"  value="${user.userName}" /></p>
        <p><label>旧密码</label><input name="oldPassword" type="password"/></p>
        <p><label>新密码</label><input name="newPassword" type="password"/></p>
        <p><input class="btn" type="submit" value="提交">&nbsp;&nbsp;<input class="btn" type="button" onclick="back()" value="返回"></p>
    </form>
</div>
</body>
<script language="JavaScript">
    function back()
    {
        window.location.href="${pageContext.request.contextPath}/login/userMgr.cfg";
    }
</script>
</html>
