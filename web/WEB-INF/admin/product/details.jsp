<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/images/admin/template/images/skin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        td{
            text-align: left;
            font-size: 12px;
        }
    </style>
</head>
<body>
<span class="left_bt" style="text-align: center;margin: 15px 0;display: block;">产品详细信息<a href="/product/product_listProduct.action" style="float:right;margin-right: 90px;font-size: 14px;">返回</a></span>
    <table cellpadding="0" cellspacing="0" border="1" width="80%" align="center">
        <tr>
            <td>产品名称：</td>
            <td><s:property value="product.productName" /></td>
        </tr>
        <tr>
            <td>产品类别：</td>
            <td><s:property value="product.category.categoryName" /></td>
        </tr>
        <tr>
            <td>产品图片：</td>
            <td style="text-align: center;"><img src="<s:property value="product.imageUrl" />" alt="产品图片" style="width: 400px; height: 300px;"></td>
        </tr>
        <tr>
            <td>产品特点：</td>
            <td><s:property value="product.feature" escape="false" /></td>
        </tr>
        <tr>
            <td>产品描述：</td>
            <td><s:property value="product.description" escape="false" /></td>
        </tr>
    </table>
</body>
</html>