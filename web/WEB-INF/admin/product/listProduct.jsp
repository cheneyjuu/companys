<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/base.js"></script>
</head>
<body>
<form action="/product/product_listProduct.action" method="post">

    <s:hidden name="page"></s:hidden>
    <s:if test="#request.pageView.totalRecord">

        <h3 style="display: block;text-align: center;margin: 15px 0 15px 0;font-size: 16px;">公司简介管理页面</h3>
        <table border="1" cellpadding="0" cellspacing="0" width="80%" align="center">
            <tr>
                <td>
                    序号
                </td>
                <td>
                    产品名称
                </td>
                <td>
                    产品类别
                </td>
                <td>
                    产品特性
                </td>
                <td>
                    产品描述
                </td>
                <td>
                    详细信息
                </td>
                <td>
                    操作
                </td>
            </tr>
            <s:iterator value="#request.pageView.records" id="entity" status="status">
                <tr>
                    <td>
                        <s:property value="#status.index+1" />
                    </td>
                    <td>
                        <s:property value="#entity.productName" />
                    </td>
                    <td>
                        <s:property value="#entity.category.categoryName" />
                    </td>
                    <td>
                        <s:property value="#entity.feature" escape="false" />
                    </td>
                    <td>
                        <s:property value="#entity.description" escape="false" />
                    </td>
                    <td>
                        <a href="/product/product_details.action?product.id=<s:property value="#entity.id" />">详细</a>
                    </td>
                    <td>
                        <a href="/product/product_toAddProduct.action">新增产品</a> |
                        <a href="/product/product_deleteProduct.action?product.id=<s:property value="#entity.id" />">删除</a> |
                        <a href="/product/product_toUpdateProduct.action?product.id=<s:property value="#entity.id" />">修改</a>
                    </td>
                </tr>
            </s:iterator>
        </table>
        <div style="text-align: center;margin: 15px 0 15px 0;">
            <s:if test="#request.pageView.totalPage > 1">
                <%@ include file="/WEB-INF/content/share/page.jsp"%>
            </s:if>
        </div>
    </s:if>
    <s:else>
        没有记录
    </s:else>
</form>
</body>
</html>