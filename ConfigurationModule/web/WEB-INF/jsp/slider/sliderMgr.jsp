<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/7/23 0023
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="http://cdn.bootcss.com/twitter-bootstrap/2.2.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .titlelabel{
            font-size:20px;
            font-weight: bold;
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
        }

        .trStyle
        {
            display: table-row-group;
            font-weight:bold;
            font-size: 18px;
            letter-spacing: 0.01em;
            color: rgba(0, 0, 0, 0.6);
            padding-left: 5px;

        }
        .scrollTable {
            max-height: 550px;;
            overflow-x: hidden;
            overflow-y: auto;
            max-width: 860px;
            word-wrap:break-word;

        }
        .aCSS
        {
            color:rgba(0, 0, 0, 0.6);
            text-align:center;

        }
    </style>
    <title>首页轮播图管理</title>
</head>
<body class="body">
<p><label class="titlelabel">首页轮播图管理</label></p>
<div style="position: fixed; text-align:right;margin-top: 10px;">
    <button class="btn" onclick="newFuncOnMouseDown()">新增轮播图</button>&nbsp;&nbsp;
    <button class="btn" onclick="updateFuncOnMouseDown()">修改轮播图</button>&nbsp;&nbsp;
    <button class="btn" onclick="delSliderOnMouseDown()">删除介绍</button>
</div>
<div style="height:400px;">
    <table style=" margin-top: 60px;" >
        <tr bgcolor="#34495e" style="color:#FFFFFF; ">
            <th width="30px">ID</th>  <th width="100px">轮播图名称</th>   <th width="320px">轮播图片</th>   <th width="200px">功能描述</th>  <th width="160px">链接地址</th>
        </tr>
        <td colspan="5">
            <div class="scrollTable">
                <table border="1px" style="border-color:#dcdcdc;">
                    <c:forEach  items="${tSliderList}" var="tSlider">
                        <tr class="trStyle"  bgcolor="#ffffff" onclick="trOnMouseDown(this)">
                            <td style="text-align: center;">${tSlider.id}</td>
                            <div style="width:310px; word-wrap:break-word;">
                                <td style="text-align: center;">
                                        ${tSlider.sliderFlag}
                                </td>
                            </div>
                            <td width="320px"><img src="${pageContext.request.contextPath}${tSlider.imgUrl}" style=" min-width:320px;"/></td>
                            <td width="250px" valign="middle"><label style="margin:5px auto;min-width:220px;padding-left:10px;">${tSlider.imgDesc}</label> </td>
                            <td style="text-align:center;width: 100px;" >
                                <div style="width:120px;">
                                    <a class="aCSS">链接地址:${tSlider.targetUrl}</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </td>
    </table>
</div>
</body>
<SCRIPT LANGUAGE="JavaScript">
    var lastTr=null;
    function trOnMouseDown(obj){
        if(lastTr!=null)
        {
            lastTr.bgColor="#ffffff";
        }
        if(obj.bgColor=="#ffffff")
            obj.bgColor="#4682b4";
        lastTr = obj;
    }

    function newFuncOnMouseDown()
    {
        window.location.href="${pageContext.request.contextPath}/slider/newSlider.cfg";
    }

    function updateFuncOnMouseDown()
    {
        if(lastTr==null)
        {
            alert("请选择要修改的介绍内容");
            return;
        }
        window.location.href="${pageContext.request.contextPath}/slider/updateSlider.cfg?sliderId="+lastTr.cells[0].innerText;
    }

    function delSliderOnMouseDown()
    {
        if(lastTr==null)
        {
            alert("请选择要删除的内容");
            return;
        }
        window.location.href="${pageContext.request.contextPath}/slider/delSlider.cfg?id="+lastTr.cells[0].innerText;

    }


</SCRIPT>
</html>
