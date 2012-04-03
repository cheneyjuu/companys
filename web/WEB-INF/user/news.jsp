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
        <p style="background: url('/images/user/contitle.jpg') no-repeat; width: 100%; height: 38px; margin-top: 12px; margin-left: 20px; margin-bottom: 30px;">
            <span style="line-height: 35px; padding-left: 55px; font-size: 16px;">
                公司新闻
            </span></p>
    <form action="product.action" method="post">
        <s:hidden name="page"></s:hidden>
        <s:if test="#request.pageView.totalRecord">
            <s:iterator value="#request.pageView.records" id="entity">
                <div id="newsquery">
                    <ul id="queryul">
                        <li class="title">
                            <div class="title">
                                <a href="newsDetail.action?news.id=<s:property value="#entity.id" />"><s:property value="#entity.title" /></a>
                            </div>
                            <div class="time"><s:property value="#entity.createTime" /></div>
                        </li>
                    </ul>
                </div>
            </s:iterator>
            <div class="fn-clear"></div>
            <div style="text-align: left;margin-left: 60px;">
                <s:if test="#request.pageView.totalPage > 1">
                    <%@ include file="/WEB-INF/content/share/page.jsp"%>
                </s:if>
            </div>
        </s:if>
        <s:else>
            没有记录
        </s:else>
    </form>
            </div>
    <div class="fn-clear"></div>
    <jsp:include page="../bottom.jsp" />
</div>
</body>
</html>