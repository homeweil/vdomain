<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/7/22 0022
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
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

        .scrollTable {
            max-height: 550px;
            overflow-x: hidden;
            overflow-y: auto;
            max-width: 860px;
            word-wrap:break-word;

        }
    </style>
    <title>功能介绍管理</title>
</head>
<body class="body" >
<p><label class="titlelabel">功能介绍管理</label></p>
<div  style="display:block;position: fixed; text-align:right;margin-top: 10px;">
    <button class="btn" onclick="newFuncOnMouseDown()">新增介绍</button>&nbsp;&nbsp;
    <button class="btn" onclick="updateFuncOnMouseDown()">修改介绍</button>&nbsp;&nbsp;
    <button class="btn" onclick="delFuncOnMouseDown()">删除介绍</button>
</div>
<div>
    <table style=" margin-top: 60px;  ">
        <tr bgcolor="#34495e" style="color:#FFFFFF;">
            <th width="40px">ID</th>
            <th width="100px">功能名称</th>
            <th width="340px">功能标题</th>
            <th width="310px">功能描述</th>
        </tr>
        <td colspan="4">
            <div class="scrollTable">
                <table border="1px" style="border-color:#dcdcdc;">
                    <c:forEach  items="${tFuncList}" var="tFunc">
                        <tr  style=" height:30px; font-size: 15px;color:rgba(0, 0, 0, 0.6) ;font-weight:bold;" bgcolor="#ffffff" onclick="trOnMouseDown(this)">
                            <td style="text-align: center; width:50px;" >
                                ${tFunc.id}
                            </td>
                            <td width="200px">
                                <div style="width:200px; word-wrap:break-word;">
                                    ${tFunc.funcName}
                                </div>
                            </td>
                            <td width="340px">${tFunc.funcTitle}</td>
                            <td  >
                                <div style="width:310px; word-wrap:break-word;">
                                    ${tFunc.funcDesc}
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
    function newFuncOnMouseDown(){
        window.location.href="${pageContext.request.contextPath}/function/newFunc.cfg";
    }
    function updateFuncOnMouseDown(){
        if(lastTr==null)
        {
            alert("请选择要修改的介绍内容");
            return;
        }
        window.location.href="${pageContext.request.contextPath}/function/updateFunc.cfg?func_Id="+lastTr.cells[0].innerText;
    }
    function delFuncOnMouseDown(){
        if(lastTr==null)
        {
            alert("请选择要删除的内容");
            return;
        }
        window.location.href="${pageContext.request.contextPath}/function/delFunc.cfg?id="+lastTr.cells[0].innerText;

    }
</SCRIPT>
</html>
