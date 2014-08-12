<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/8/5 0005
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="http://cdn.bootcss.com/twitter-bootstrap/2.2.2/css/bootstrap.min.css" rel="stylesheet">
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
            font-weight:bold;
            color: rgba(0, 0, 0, 0.6);
        }
        .scrollTable {
            max-height: 550px;;
            overflow-x: hidden;
            overflow-y: auto;
            word-wrap:break-word;
            position: fixed;
        }

    </style>
    <title>试用申请管理</title>
</head>
<body class="body">
<p><label class="titlelabel">试用申请管理</label></p>
<div style="position: fixed; text-align:right;margin-top: 10px;">
    <button class="btn" onclick="CheckOnMouseDown()">确认申请</button>&nbsp;&nbsp;
    <button class="btn" onclick="delOnMouseDown()">清除记录</button>&nbsp;&nbsp;
</div>
<div style="height:400px;">
    <table  style="position:fixed; margin-top: 60px;min-width:860px; "  >
        <tr bgcolor="#34495e" style="color:#FFFFFF; margin-left:4px;">
            <th width="32px">ID</th>
            <th width="151px">公司名称</th>
            <th width="101px">申请者</th>
            <th width="101px">联系电话</th>
            <th width="171px">E-Mail</th>
            <th width="155px">申请时间</th>
            <th width="155px">审核</th>
        </tr>
        <td colspan="7">
            <div class="scrollTable">
                <table border="1"  style="border-color:#dcdcdc; min-width:860px; ">

                    <c:forEach  items="${trialList}" var="trial">
                        <tr class="trStyle" bgcolor="#ffffff"  onclick="trOnMouseDown(this)">
                            <td style="text-align:center;" width="30px">${trial.id}</td>
                            <td style="text-align:center;" width="150px">${trial.companyName}</td>
                            <td style="text-align:center;" width="100px">${trial.userName}</td>
                            <td width="100">${trial.phoneNum}</td>
                            <td style="text-align:center;" width="170px">${trial.eMail}</td>
                            <td width="150px">${trial.tTime}</td>
                            <td width="150px"><span <c:if test="${trial.tCheck =='YES'}">style="color:green;"</c:if>
                                                    <c:if test="${trial.tCheck =='NOT'}">style="color:red;"</c:if>>${trial.tCheck}</span></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </td>
    </table>
</div>
</body>
<script language="JavaScript">
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

    function CheckOnMouseDown(){
        if(lastTr==null)
        {
            alert("请选择条目");
            return;
        }
        window.location.href="${pageContext.request.contextPath}/trial/updateTrialDo.cfg?id="+lastTr.cells[0].innerText;
    }
    function delOnMouseDown(){
        if(lastTr==null)
        {
            alert("请选择要删除的内容");
            return;
        }
        window.location.href="${pageContext.request.contextPath}/trial/delTrialDo.cfg?id="+lastTr.cells[0].innerText;

    }
</script>
</html>
