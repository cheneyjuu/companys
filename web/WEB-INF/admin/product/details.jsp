<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <table cellpadding="0" cellspacing="0" border="1" width="80%" align="center" style="margin: 15px 0;">
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
            <td><img src="<s:property value="product.imageUrl" />" alt="产品图片" style="width: 400px; height: 300px;"></td>
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