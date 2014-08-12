<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/7/30 0030
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="http://cdn.bootcss.com/twitter-bootstrap/2.2.2/css/bootstrap.min.css" rel="stylesheet">

<html>
<head>
    <title>操作失败</title>
    <style>
        .imguse{
            float:left;
            position:fixed;
            margin-left:100px;
            max-height:200px;
            margin-top:10px;
        }
        .btn{
            margin-top:150px;
            margin-left:190px;
            height:30px;
            width:120px;
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
            position:fixed;
            float:left;
            position:fixed;
        }
    </style>
</head>
<body>
<div style="margin-top:80px;">
    <p><img class="imguse" src="${pageContext.request.contextPath}/resources/images/failure.jpg"/></p>
    <p><button class="btn" onclick="doBack()">返回</button></p>
</div>
</body>
<script language="javascript">
    function doBack(){
        window.location.href="${pageContext.request.contextPath}/news/newsMgr.cfg";
    }
</script>
</html>
