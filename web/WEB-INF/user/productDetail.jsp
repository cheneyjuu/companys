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
        <div id="content_product">
            <span id="show_p_name"><s:property value="product.productName" /></span>
        </div>
        <div>
            <!-- 展示图片详细 -->
            <div	id="content_left">
                <div style="border: 1px;margin-left: 30px;">
                    <img id="show_pro_img_detil" src="<s:property value="product.imageUrl" />">
                </div>

            </div>
            <div id="content_right">
                <span style="color:red;">产品特点:<br/><s:property value="product.feature" escape="false" /></span>
            </div>
        </div>
        <div style="background: url(/images/user/titchange.jpg) no-repeat;height: 30px;margin: 0px;margin-top: 400px;margin-left: 30px;">
            <span id="show_p_detil">详细说明</span>
            <hr style="width:90%;height:2px">
        </div>
        <div style="width: 650px;float: left;margin-left: 30px; margin-top: 20px;">
            <s:property value="product.description" escape="false" />
        </div>
    </div>
    <div class="fn-clear"></div>
    <jsp:include page="../bottom.jsp" />
</div>
</body>
</html>