<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/7/23 0023
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="http://cdn.bootcss.com/twitter-bootstrap/2.2.2/css/bootstrap.min.css" rel="stylesheet">

    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jQuery.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/ImgPreview.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/ajaxfileupload.js"></script>
    <style>
        .mainBody
        {
            font: 100% '微软雅黑';
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
    <title>修改轮播图</title>
</head>

<body>
<form id="sliderForm"  action="${pageContext.request.contextPath}/slider/updateSliderDo.cfg" method="post" >
    <p><label class="titlelabel">修改轮播图</label></p>
    <div style="margin:20px auto;margin-left:30px;">
        <p><label>轮播图类型 ID:${param.sliderId}</label></p>
        <input type="hidden" id="id" name="id" value="${param.sliderId}"/>
        <p>
        <div style="font-size:12px;">
        <input name="sliderType" type="radio" value="头部轮播图"     <c:if test="${tSlider.sliderFlag =='头部轮播图'}">checked="true"</c:if>/>头部轮播图 &nbsp;&nbsp;
        <input name="sliderType" type="radio" value="案例轮播图"     <c:if test="${tSlider.sliderFlag =='案例轮播图'}">checked="true"</c:if>/>案例轮播图 &nbsp;&nbsp;
        <input name="sliderType" type="radio" value="合作伙伴轮播图" <c:if test="${tSlider.sliderFlag =='合作伙伴轮播图'}">checked="true"</c:if>/>合作伙伴轮播 &nbsp;&nbsp;
    </div>
        </p>

        <p>
            <label>轮播图指向链接</label>
            <input id="targetUrl" name="targetUrl" type="text" style="width:250px;" value="${tSlider.targetUrl}">
        </p>
        <p>
            <label>选择图片</label>
            <input style="display: none;" id="imgUrl"  name="imgUrl" value="${tSlider.imgUrl}">
            <input id="chooseImgFile" name="chooseImgFile" type="file"style="display: none;" onchange='PreviewImage("ImgPreview",this,"350","100%")' />
            <input type="button" class="btn" onclick="chooseImgFile.click()" value="选择图片">
        <div id="ImgPreview" style='max-width:350px;margin-bottom:20px;'>
        <img
                <c:choose>
                    <c:when test="${tSlider.imgUrl==null}">src="${pageContext.request.contextPath}/resources/images/PreviewBig.jpg"</c:when>
                    <c:otherwise>src="${pageContext.request.contextPath}${tSlider.imgUrl}"</c:otherwise>
                </c:choose>
                style='width:350px;'/>
    </div>
        <input type="button" class="btn" onclick="upLoadImg('ImgPreview','chooseImgFile','imgUrl','350','100%')" value="上传图片"/>
        </p>
        <p><label>轮播图介绍</label><textarea id="imgDesc"  name="imgDesc" class="textComment">${tSlider.imgDesc}</textarea></p>
        <p style="margin-left:65px;">
            <button class="btn" type="button" onclick="doUpdate()">提交</button>
            <button class="btn" type="button" onclick="back()">返回</button></p>
    </div>
</form>
</body>
<script language="JavaScript">
    function doUpdate()
    {
        var form=$("#sliderForm");
        form.submit();
    }
    function back()
    {
        window.location.href="${pageContext.request.contextPath}/slider/sliderMgr.cfg";
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
                document.getElementById(divId).innerHTML = "<img style='width:"+widthT+"px;height:"+heightT + "px;' src='${pageContext.request.contextPath}"+data+"'/>";
            },
            error: function (data, status, e){
                alert("error:"+e);
            }
        });

    }
</script>
</html>
