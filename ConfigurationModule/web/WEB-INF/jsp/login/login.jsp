<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/8/11 0011
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontAwesome/font-awesome.css">
<html>
<head>
    <style>

        .divimg{
            margin-left:32%;
            border-radius: 20;
            border: 1px solid;
            border-color: #49afcd;

            width: 553px;
            height: 300px;
            background-image: url(${pageContext.request.contextPath}/resources/images/debut_dark.png);
        }
    </style>
    <title>微领域后端管理平台</title>
</head>
<body text-align="center; "  bgcolor="black" >
<div style="margin-top:150px;margin-left:39%; ">
    <p><span style=" margin-top:10px;font-size: 40px;color:#149bdf; font-family: '幼圆'">微领域后端管理平台</span></p>
</div>

<div style="text-align: center;">
    <div class="divimg">
        <form id="form" action="${pageContext.request.contextPath}/login/loading.cfg" method="post">
            <div style=" left:600px;top:200px;">
                <p>
                    <i style="margin-right: 5px;font-size: 20px;color: #3faeeb;" class="icon-user"></i>
                    <input style=" margin-top:60px;background-color:#ffffff ;border: 1px solid; height: 25px;width:160px;color:#213f71;" id="userName" name="userName" type="text"  maxlength=20/>
                </p>
                <p>
                    <i style="margin-right: 5px;font-size: 20px;color: #3faeeb;" class="icon-key"></i>
                    <input style=" margin-top:15px;background-color:#ffffff ;border: 1px solid; height: 25px;width:160px;color:#213f71;" id="passWord" name="passWord" type="passWord"  maxlength=20/>
                </p>

                <p>
                    <input style=" margin-top:24px;width:128px;height: 40px;border-radius: 20;background-color: #149bdf;font-family: '幼圆';font-size: 18px;font-weight: bolder; color:#f4f4f4;"   type="submit"  value="Login" />
                </p>
            </div>
        </form>
    </div>
</div>

</body>
<script language="JavaScript">

</script>
</html>
