<%--
  Created by IntelliJ IDEA.
  User: 邓风森
  Date: 2014/7/22
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>微领域-智能WiFi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/smartWiFi.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/css/bootstrap/js/jquery-2.0.0.min.js"></script>
</head>
<body>
<div class="pageContent">

</div>
<!--顶部导航-->
<div id="header" style="z-index: 9999;position: fixed;top: 0;left: 0;">
    <jsp:include page="/common/header.do"/>
</div>
<%--页脚--%>
<div style="min-width: 1024;width: 100%;overflow:hidden ">
    <center>
        <jsp:include page="/common/footer.do"/>
    </center>
</div>
</body>
</html>
