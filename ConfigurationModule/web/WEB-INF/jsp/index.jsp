<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/7/22 0022
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontAwesome/font-awesome.css">
    <script>
        var doc = document, docEl = doc.documentElement;
        docEl.className = docEl.className.replace(/(^|\s)no-js(\s|$)/, " js ");
    </script>
    <style>
        .span-font-set{
            font-family: '幼圆';
            font-weight:bold;
            color:#f8f8f8;
        }
    </style>
    <script src="${pageContext.request.contextPath}/resources/js/responsive-nav.js"></script>
    <title></title>
</head>
<body>
<div style="margin-left: 30px;margin-top: 10px;">
    <span class="span-font-set"  >您好,管理员</span>&nbsp;&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/login/login.cfg">
        <span  class="span-font-set">退出</span>
    </a>&nbsp;&nbsp;&nbsp;
    <a herf="javascript:void(0);" onclick="setAdmin()">
        <i class="icon-cog" style="color:#f8f8f8;"></i>
        <span style="cursor: pointer; " class="span-font-set"> 设置</span>
    </a>
</div>

<div style="margin:20 0 0 30;">
    <p><span style="font-family: '幼圆';font-size: 30px;color:#0099ff;font-weight:bold;" >微领域</span></p>
</div>
<div role="navigation" id="nav" style="margin-top:80px;">
    <ul>

        <li><a href="#" onClick="changeRightContent('1')">首页展示管理</a></li>
        <li><a href="#" onClick="changeRightContent('2')">功能介绍管理</a></li>
        <li><a href="#" onClick="changeRightContent('3')">成功案例管理</a></li>
        <li><a href="#" onClick="changeRightContent('4')">公司介绍管理</a></li>
        <li><a href="#" onClick="changeRightContent('5')">招商加盟管理</a></li>
        <li><a href="#" onClick="changeRightContent('6')">试用申请管理</a></li>
        <li><a href="#" onClick="changeRightContent('7')">公告消息管理</a></li>
    </ul>
</div>
<div class="main">
    <iframe  id="ifream_URL" src=" " style=" margin-left:40px;border: 1px steelblue;"  frameborder=no width="95%" height="680"  ></iframe>
</div>
<script>
    var navigation = responsiveNav("#nav", {customToggle: "#toggle"});
</script>

<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-39967427-1']);
    _gaq.push(['_trackPageview']);
    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
    function setAdmin(){
        document.getElementById("ifream_URL").src='${pageContext.request.contextPath}/login/userMgr.cfg';
        return;
    }
    function adminSettingPassword(){
        document.getElementById("ifream_URL").src='${pageContext.request.contextPath}/slider/sliderMgr.cfg';
        return;
    }
    function changeRightContent(id){

        if(id==1){
            document.getElementById("ifream_URL").src='${pageContext.request.contextPath}/slider/sliderMgr.cfg';
            return;
        }
        if(id==2){
            document.getElementById("ifream_URL").src='${pageContext.request.contextPath}/function/funcMgr.cfg ';
            return;
        }
        if(id==3){
            document.getElementById("ifream_URL").src='${pageContext.request.contextPath}/successfulCase/successfulCaseMgr.cfg';
            return;
        }
        if(id==4){
            document.getElementById("ifream_URL").src='${pageContext.request.contextPath}/aboutUs/aboutUsMgr.cfg';
            return;
        }
        if(id==5){
            document.getElementById("ifream_URL").src='${pageContext.request.contextPath}/cooperation/cooperationMgr.cfg';
            return;
        }
        if(id==6){
            document.getElementById("ifream_URL").src='${pageContext.request.contextPath}/trial/trialMgr.cfg';
            return;
        }
        if(id==7){
            document.getElementById("ifream_URL").src='${pageContext.request.contextPath}/news/newsMgr.cfg';
            return;
        }
    }
</script>
</body>
</html>
