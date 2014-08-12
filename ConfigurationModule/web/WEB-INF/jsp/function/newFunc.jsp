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
    <title>新增功能介绍</title>
</head>
<body>

<p><label class="titlelabel">新增功能介绍</label></p>
<div style="margin-left:30px;">
        <form id="funcForm" action="${pageContext.request.contextPath}/function/newFuncDo.cfg" method="post"  >
            <p><label>功能名称</label><input  id="funcName" name="funcName" type="text" style="width:250px;"/></p>
            <p><label>介绍标题</label><input  id="funcTitle" name="funcTitle" type="text" style="width:250px;"/></p>
            <p><label>父级ID</label>
               <input id="funcPanterId" name="funcParentId" type="text" style="width:250px;" onkeyup="value=value.replace(/[^\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
            </p>


            <p>
                <label>介绍图片</label>
                <input style="display: none;"id="funcPicUrl"  name="funcPicUrl" >
                <input id="chooseIntroductionFile" name="chooseIntroductionFile" type="file"style="display: none;" onchange='PreviewImage("introductionImgPreview",this,"350","100%")' />
                <input type="button" class="btn" onclick="chooseIntroductionFile.click()" value="选择图片">
                <div id="introductionImgPreview" style='max-width:350px;margin-bottom:20px;'>
                    <img src="${pageContext.request.contextPath}/resources/images/PreviewBig.jpg"  style='width:350px;'/>
                </div>
                <input type="button" class="btn" onclick="upLoadImg('introductionImgPreview','chooseIntroductionFile','funcPicUrl','350','100%')" value="上传图片"/>
            </p>
           <p>
                <label>图标图片</label>
                <input style="display: none;"id="funcIconUrl"  name="funcIconUrl" >
                <input id="chooseIconFile" name="chooseIconFile"  type="file" style="display: none;"  onchange='PreviewImage("imgPreview",this,"180","180")' />
                <input type="button" class="btn" onclick="chooseIconFile.click()" value="选择图片">
                <div id="imgPreview"  style='max-width:180px; max-height:180px;margin-bottom:20px;'>
                    <img src="${pageContext.request.contextPath}/resources/images/PreviewImg.jpg"  style='width:180px; height:180px;'/>
                </div>
                <input type="button" onclick="upLoadImg('imgPreview','chooseIconFile','funcIconUrl','180','180')" value="上传图片" class="btn">
           </p>


            <p>
                <label>介绍描述</label>
                <textarea id="funcDesc" name="funcDesc" class="textComment"></textarea>
            </p>
            <p style="margin-left:65px;">
                <button onclick="doSave()" class="btn">提交</button>
                <button onclick="back()" type="button"  class="btn">返回</button>
            </p>
        </form>

</div>

<script LANGUAGE="JavaScript">
    function doSave()
    {
        var form=$("#funcForm");
        if(document.getElementById("funcName").value.toString()=="")
        {
            alert("请输入功能名称");
            return;
        }
        form.submit();
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
    function back()
    {
        window.location.href="${pageContext.request.contextPath}/function/funcMgr.cfg";
    }


</script>
</body>
</html>
