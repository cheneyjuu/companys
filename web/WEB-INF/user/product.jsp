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
    <div id="left_nav">


        <div   class="productclass_dolphin" style="height: 330px; overflow:hidden;" >
            <s:iterator value="categoryList" id="entity">
                <a href="product.action?productId=<s:property value="#entity.id" />" class="productclass_dolphin" ><s:property value="#entity.categoryName" /></a>
            </s:iterator>
        </div>

        <div id="left_addres" >
            <p  class="left_addres_p" >地址:上海市闸北区</p>
            <p class="left_addres_p">电话:021-12345678</p>
            <p class="left_addres_p">邮箱:gegmingjun001@gmail.com</p>
        </div>
    </div>
        <div id="content">
    <form action="product.action" method="post">
        <s:hidden name="page"></s:hidden>
        <s:if test="#request.pageView.totalRecord">
            <s:iterator value="#request.pageView.records" id="entity">
                <div>
                    <div id="show_product">
                        <a href="#" target="_self">
                            <img id="show_pro_img" src="<s:property value="#entity.imageUrl" />">
                        </a>
                    </div>
                    <div>
                        <a href="#" target="_self">
                            <p id="show_name" ><s:property value="#entity.productName" /></p>
                        </a>
                    </div>
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