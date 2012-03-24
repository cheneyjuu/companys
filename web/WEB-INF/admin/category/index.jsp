<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12-3-22
  Time: 上午9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>产品类别维护</title>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div style="text-align: left; margin: 15px 0 0 50px;">
    <p style="text-align: center; font-size: 16px; margin-top: 15px;">产品类别维护</p>
    <hr style="margin-bottom: 15px;">
    <table border="1" cellpadding="0" cellspacing="0" width="80%" align="center">
        <tr>
            <td>
                序号
            </td>
            <td>
                类别名称
            </td>
            <td>
                操作
            </td>
        </tr>
        <s:iterator value="categoryList" id="entity" status="status">
            <tr>
                <td>
                    <s:property value="#status.index+1" />
                </td>
                <td>
                    <s:property value="#entity.categoryName" />
                </td>
                <td>
                    <a href="/category/category_deleteCategory.action?category.id=<s:property value="#entity.id" />">删除</a>
                </td>
            </tr>
        </s:iterator>
    </table>
    <hr style="margin: 15px 0 15px 0;">
    <form action="/category/category_addCategory.action" method="post">
        <label>类别名称：</label>
        <input type="text" name="category.categoryName">
        <p>
            <input type="submit" value="添加类别" style="display: block;margin:15px 0 0 65px;">
        </p>
    </form>
</div>
</body>
</html>