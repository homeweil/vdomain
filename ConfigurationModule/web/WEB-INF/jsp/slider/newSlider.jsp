<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/7/23 0023
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>新增轮播图</title>
</head>

<body>
<form id="sliderForm"  action="${pageContext.request.contextPath}/slider/newSliderDo.cfg" method="post" >
    <p><label class="titlelabel">新增轮播图</label></p>
    <div style="margin:20px auto;margin-left:30px;">
        <p><label>轮播图类型</label></p>
        <p>
        <div style="font-size:12px;">
        <input name="sliderType" type="radio" value="头部轮播图"/>头部轮播图 &nbsp;&nbsp;
        <input name="sliderType" type="radio" value="案例轮播图"/>案例轮播图 &nbsp;&nbsp;
        <input name="sliderType" type="radio" value="合作伙伴轮播图"/>合作伙伴轮播 &nbsp;&nbsp;
    </div>
        </p>

        <p><label>轮播图指向链接</label><input id="targetUrl" name="targetUrl" type="text" style="width:250px;"></p>
        <p>
            <label>选择图片</label>
            <input style="display: none;" id="imgUrl"  name="imgUrl" >
            <input id="chooseImgFile" name="chooseImgFile" type="file"style="display: none;" onchange='PreviewImage("ImgPreview",this,"350","90%")' />
            <input type="button" class="btn" onclick="chooseImgFile.click()" value="选择图片">
        <div id="ImgPreview" style='max-width:350px; margin-bottom:20px;'>
        <img src="${pageContext.request.contextPath}/resources/images/PreviewBig.jpg"  style='width:350px; '/>
    </div>
        <input type="button" class="btn" onclick="upLoadImg('ImgPreview','chooseImgFile','imgUrl','350','200')" value="上传图片"/>
        </p>

        <p><label>轮播图介绍</label><textarea id="imgDesc"  name="imgDesc" class="textComment"></textarea></p>
        <p style="margin-left:65px;"><button class="btn" onclick="doSave()">提交</button> <button class="btn" onclick="back()">返回</button></p>
    </div>
</form>
</body>
<script language="JavaScript">
    function doSave()
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
