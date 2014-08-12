<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/7/22 0022
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="http://cdn.bootcss.com/twitter-bootstrap/2.2.2/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jQuery.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/ajaxfileupload.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/ImgPreview.js"></script>
    <style>
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
    <title></title>
</head>
<body>
<p><label class="titlelabel">修改功能介绍</label></p>
<div style="margin-left:30px;">
    <form id="funcForm" name="funcForm" action="${pageContext.request.contextPath}/function/updateFuncDo.cfg?id=${param.func_Id}" method="post" >
        <p><label id="id" name="id" value="${param.func_Id}">ID:${param.func_Id}</label></p>
        <p><label>功能名称</label><input id="funcName" name="funcName" type="text" style="width:250px;" value="${tFunc.funcName}"></p>
        <p><label>介绍标题</label><input id="funcTitle" name="funcTitle" type="text" style="width:250px;" value="${tFunc.funcTitle}"></p>
        <p><label>父级ID</label>
           <input id="funcPanterId" name="funcParentId" type="text" style="width:250px;" value="${tFunc.funcParentId}" onkeyup="value=value.replace(/[^\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
        <p>
            <label>介绍图片</label>
            <input style="display: none;"id="funcPicUrl"  name="funcPicUrl" value="${tFunc.funcPicUrl}" >
            <input id="chooseIntroductionFile" name="chooseIntroductionFile" type="file"style="display: none;" onchange='PreviewImage("introductionImgPreview",this,"350","100%")' />
            <input type="button" class="btn" onclick="chooseIntroductionFile.click()" value="选择图片">
            <div id="introductionImgPreview" style='max-width:350px;margin-bottom:20px;'>
            <img
                    <c:choose>
                        <c:when test="${tFunc.funcPicUrl==null}">src="${pageContext.request.contextPath}/resources/images/PreviewBig.jpg"</c:when>
                        <c:otherwise>src="${pageContext.request.contextPath}${tFunc.funcPicUrl}"</c:otherwise>
                    </c:choose>
                    style='width:350px; '/>
            </div>
        <input type="button" class="btn" onclick="upLoadImg('introductionImgPreview','chooseIntroductionFile','funcPicUrl','350','100%')" value="上传图片"/>
        </p>

        <p>
            <label>图标图片</label>
            <input style="display: none;"id="funcIconUrl"  name="funcIconUrl"  value="${tFunc.funcIconUrl}">
            <input id="chooseIconFile" name="chooseIconFile"  type="file" style="display: none;"  onchange='PreviewImage("imgPreview",this,"180","180")' />
            <input type="button" class="btn" onclick="chooseIconFile.click()" value="选择图片">
            <div id="imgPreview"  style='max-width:180px; max-height:180px;margin-bottom:20px;'>
                <img <c:choose>
                        <c:when test="${tFunc.funcIconUrl==null}">src="${pageContext.request.contextPath}/resources/images/PreviewImg.jpg"</c:when>
                        <c:otherwise>src="${pageContext.request.contextPath}${tFunc.funcIconUrl}"</c:otherwise>
                    </c:choose>
                    style='width:180px; height:180px;'/>
            </div>
            <input type="button" onclick="upLoadImg('imgPreview','chooseIconFile','funcIconUrl','180','180')" value="上传图片" class="btn">
        </p>

        <p><label>介绍描述</label><textarea id="funcDesc" name="funcDesc" class="textComment">${tFunc.funcDesc}</textarea></p>
        <p style="margin-left:65px;">
            <input class="btn" type="button" onclick="doUpdate()" value="提交"/>
            <button class="btn" type="button" onclick="back()">返回</button>
        </p>
    </form>
</div>
</body>
<SCRIPT LANGUAGE="JavaScript">
    function doUpdate()
    {
        var form=$("#funcForm");
        if($("#funcName").val()==""||$("#funcName").val()==null) {
            alert("功能名称不能为空");
            return;
        }
        form.submit();
        return ;
    }
    function back()
    {
        window.location.href="${pageContext.request.contextPath}/function/funcMgr.cfg";
        return;
    }
    function upLoadImg(divId,upId,imgId,widthT,heightT){

        if(document.getElementById(upId).value.toString()=="")
        {
            alert("请先选择要上传的图片");
            return;
        }

        $.ajaxFileUpload({
            url : "${pageContext.request.contextPath}/common/upLoadImg.json",
            type:"post",
            secureuri: false,
            dataType:"text",
            fileElementId: upId,
            success : function(data) {
                alert("图片已上传");
                document.getElementById(imgId).value=data;
                document.getElementById(divId).innerHTML = "<img style='width:"+widthT+"px;height:"+heightT+"px;'src='${pageContext.request.contextPath}"+data+"'/>";
            },
            error: function (data, status, e){
                alert("error:"+e);
            }
        });

    }
</SCRIPT>
</html>
