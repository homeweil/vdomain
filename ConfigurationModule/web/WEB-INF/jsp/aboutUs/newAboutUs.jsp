<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/8/1 0001
  Time: 16:58
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
    <title>新增企业介绍</title>
</head>
<body>
<p><label class="titlelabel">新增企业介绍</label></p>
<div style="margin-left:30px;">
    <form id="tForm" action="${pageContext.request.contextPath}/aboutUs/newAboutUsDo.cfg" method="post" >
        <p><label>侧边栏名称</label><input  id="title" name="title" type="text" style="width:250px;"/></p>
        <p>
            <label>版面图片</label>
            <input style="display: none;" id="imgUrl"  name="imgUrl" >
            <input id="chooseImgFile" name="chooseImgFile" type="file"style="display: none;" onchange='PreviewImage("ImgPreview",this,"350","100%")' />
            <input type="button" class="btn" onclick="chooseImgFile.click()" value="选择图片">
        <div id="ImgPreview" style='max-width:350px; margin-bottom:20px;'>
            <img src="${pageContext.request.contextPath}/resources/images/PreviewBig.jpg"  style='width:350px; '/>
        </div>
        <input type="button" class="btn" onclick="upLoadImg('ImgPreview','chooseImgFile','imgUrl','350','100%')" value="上传图片"/>
        </p>
        <p>
            <label>简要描述</label>
            <textarea id="aboutDesc" name="aboutDesc" class="textComment"></textarea>
        </p>
        <p style="margin-left:65px;">
            <button onclick="doSave()" class="btn">提交</button>
            <button onclick="back()" type="button"  class="btn">返回</button>
        </p>
    </form>
</div>
</body>
<script language="JavaScript">
    function doSave()
    {
        var form=$("#tForm");
        if($("#title").val()==""||$("#title").val()==null)
            alert("侧边栏名称不能为空");
        form.submit();
    }
    function back()
    {
        window.location.href="${pageContext.request.contextPath}/aboutUs/aboutUsMgr.cfg";
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
                document.getElementById(divId).innerHTML = "<img style='width:"+widthT+"px;height:"+heightT+"px;'"+ "src='${pageContext.request.contextPath}"+data+"'/>";
            },
            error: function (data, status, e){
                alert("error:"+e);
            }
        });

    }
</script>
</html>
