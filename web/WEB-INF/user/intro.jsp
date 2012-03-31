<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/css/index.css" />
    <script type="text/javascript" src="/js/scrollPic.js"></script>
</head>
<body>
<div id="container">
    <jsp:include page="../header.jsp" />

    <div id="intro_left_nav">
        <div  class="productclass_dolphin" style="height: 330px; " >
            <a href="/intro.action?type=0010" class="productclass_dolphin" style="width: 100%;">公司简介</a>
            <a href="/intro.action?type=0020" class="productclass_dolphin" style="width: 100%;">企业文化</a>
            <a href="/intro.action?type=0030" class="productclass_dolphin" style="width: 100%;">组织机构</a>
            <a href="/intro.action?type=0040" class="productclass_dolphin" style="width: 100%;">成功案例</a>
            <a href="/intro.action?type=0050" class="productclass_dolphin" style="width: 100%;">荣誉资质</a>
            <a href="/intro.action?type=0060" class="productclass_dolphin" style="width: 100%;">销售网络</a>
        </div>
    </div>

    <div id="intro_content">
        <p style="background: url('/images/user/contitle.jpg') no-repeat; width: 100%; height: 38px; margin-top: 12px; margin-left: 20px;">
            <span style="line-height: 35px; padding-left: 55px; font-size: 16px;">
                <s:property value="typeName" default="公司简介" />
            </span></p>
        <div style="margin-left: 50px;margin-top: 20px;">
            <s:property value="companyIntro.intro" escape="false" />
        </div>
    </div>
    <div class="fn-clear"></div>
    <jsp:include page="../bottom.jsp" />
</div>
</body>
</html>