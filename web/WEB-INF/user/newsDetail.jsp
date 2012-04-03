<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/css/index.css" />
    <script type="text/javascript" src="/js/scrollPic.js"></script>
    <script type="text/javascript" src="/js/base.js"></script>
    <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
</head>
<body>
<div id="container">
    <jsp:include page="../header.jsp" />
    <div id="left_news_nav">
        <div   class="productclass_dolphin" style="overflow:hidden; height: 150px;" >
            <a href="/news.action?newsId=1" class="productclass_dolphin" >公司新闻</a>
            <a href="/news.action?newsId=2" class="productclass_dolphin" >行业动态</a>
        </div>

        <div id="left_addres" >
            <p  class="left_addres_p" >地址:上海市闸北区</p>
            <p class="left_addres_p">电话:021-12345678</p>
            <p class="left_addres_p">邮箱:gegmingjun001@gmail.com</p>
        </div>
    </div>
    <div id="content" style="width: 807px; height: 402px;">
        <h1 style="text-align: center; font-size: 16px; margin-top: 20px;"><s:property value="news.title" /></h1>
        <div id="content_id" style="margin-top: 40px; margin-left: 20px; width: 95%;">
            <s:property value="news.content" escape="false" />
        </div>
    </div>
    <div class="fn-clear"></div>
    <jsp:include page="../bottom.jsp" />
</div>
</body>
</html>