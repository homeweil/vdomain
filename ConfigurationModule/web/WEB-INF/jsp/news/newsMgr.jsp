<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/8/12 0012
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
    <title>公告信息管理</title>
</head>
<body>
<p><label class="titlelabel">功能介绍管理</label></p>
<div  style="display:block;text-align:left;margin-top: 10px;">
    <form id="form" action="${pageContext.request.contextPath}/news/addNews.cfg" method="post" >
        <p>
        <span>发新消息</span>
        <input id="newsContent" name="newsContent" maxlength="250"/>
        <input  class="btn" type="submit" value="发布消息" >
        <input class="btn"  onclick="delOnMouseDown()"  type="button" value="删除消息">
        </p>
    </form>

</div>

<div>
    <table style=" margin-top: 20px;  ">
        <tr bgcolor="#34495e" style="color:#FFFFFF;">
            <th width="51">编号</th>
            <th width="401px">消息</th>
        </tr>
        <td colspan="4">
            <div class="scrollTable">
                <table border="1px" style="border-color:#dcdcdc;">
                    <c:forEach  items="${newsList}" var="news">
                        <tr  style=" height:30px; font-size: 15px;color:rgba(0, 0, 0, 0.6) ;font-weight:bold;" bgcolor="#ffffff" onclick="trOnMouseDown(this)">

                            <td style="text-align: center; width:50px;" >
                                    ${news.id}
                            </td>
                            <td width="200px">
                                <div style="width:400px; word-wrap:break-word;">
                                        ${news.newsContent}
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


    function delOnMouseDown(){
        if(lastTr==null)
        {
            alert("请选择要删除的内容");
            return;
        }
        window.location.href="${pageContext.request.contextPath}/news/delNews.cfg?id="+lastTr.cells[0].innerText;

    }
</SCRIPT>
</html>
