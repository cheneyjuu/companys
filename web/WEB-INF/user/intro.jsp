<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/css/index.css" />
    <script type="text/javascript" src="/js/scrollPic.js"></script>
    <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
</head>
<body>
<div id="container">
    <jsp:include page="../header.jsp" />

    <div id="intro_left_nav">
        <div  class="productclass_dolphin" style="height: 330px; " >
            <a href="javascript:void(0);" class="productclass_dolphin" style="width: 100%;">公司简介</a>
            <a href="javascript:void(0);" class="productclass_dolphin" style="width: 100%;">企业文化</a>
            <a href="javascript:void(0);" class="productclass_dolphin" style="width: 100%;">组织机构</a>
            <a href="javascript:void(0);" class="productclass_dolphin" style="width: 100%;">成功案例</a>
            <a href="javascript:void(0);" class="productclass_dolphin" style="width: 100%;">荣誉资质</a>
            <a href="javascript:void(0);" class="productclass_dolphin" style="width: 100%;">销售网络</a>
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
<script type="text/javascript">
    $(function(){
        var typeId;
        var curId;
        $("#intro_left_nav div a").each(function(i){
            $(this).click(function(){
                curId = i+1;
                window.location.href="/intro.action?type=00"+curId+"0";
            });
        });
    });
</script>
</html>