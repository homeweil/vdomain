<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/7/22 0022
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="http://cdn.bootcss.com/twitter-bootstrap/2.2.2/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jQuery.js"></script>
    <style>
        .mainBody
        {
            font: 100% 微软雅黑;
            margin: 20px auto;
        }
        .textComment
        {
            width:340px;
            overflow:auto;
            word-break:break-all;
        }
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
        .titlelabel
        {
            font-weight:bold;
            font-size: 18px;
            color: rgba(0, 0, 0, 0.6);
        }
    </style>
    <title>新增功能介绍</title>
</head>
<body>

<p><label class="titlelabel">新增功能介绍</label></p>
<div style="margin-left:30px;">
        <form id="funForm" action="${pageContext.request.contextPath}/newFuncDo.cfg" method="post" >
            <p><label>功能名称</label><input  id="funcName" name="funcName" type="text" style="width:250px;"/></p>
            <p><label>介绍标题</label><input  id="funcTitle" name="funcTitle" type="text" style="width:250px;"/></p>
            <p><label>父级ID</label><input  id="funcPanterId" name="funcPanterId" type="text" style="width:250px;"/></p>
            <p><label>介绍图片</label><img name="funcPicUrl" style="width:350px;height:200px;" /><input class="btn" type="button" value="选择图片"/></p>
            <p><label>介绍描述</label><textarea id="funcDesc" name="funcDesc" class="textComment"></textarea></p>
            <p style="margin-left:65px;"><button onclick="doSave()" class="btn">提交</button> <button class="btn" onclick="back()">返回</button></p>
        </form>
</div>

<script LANGUAGE="JavaScript">
    function doSave()
    {

        var form=$("#funcForm");
        if($("#funcName").val()==""||$("#funcName").val()==null)
        alert("功能名称不能为空");
       form.submit();
    }
    function back()
    {
        window.location.href="funcMgr.cfg";
    }
</script>
</body>
</html>
