<%--
  Created by IntelliJ IDEA.
  User: juchen
  Date: 12-3-24
  Time: 上午10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
    <title></title>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/base.js"></script>
</head>
<body>
<form action="/adminUser/listIntro.action" method="post">

    <s:hidden name="page"></s:hidden>
    <s:if test="#request.pageView.totalRecord">

        <h3 style="display: block;text-align: center;margin: 15px 0 15px 0;font-size: 16px;">公司简介管理页面</h3>
        <table border="1" cellpadding="0" cellspacing="0" width="80%" align="center">
            <tr>
                <td>
                    序号
                </td>
                <td>
                    简介
                </td>
                <td>
                    添加时间
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
                        <s:property value="#entity.intro" escape="false" />
                    </td>
                    <td>
                        <s:property value="#entity.createTime" />
                    </td>
                    <td>
                        <a href="/adminUser/delIntro.action?companyIntro.id=<s:property value="#entity.id" />">删除</a> |
                        <a href="/adminUser/toAddIntro.action">新增简介</a> |
                        <a href="/adminUser/toUpdateIntro.action?companyIntro.id=<s:property value="#entity.id" />">修改</a>
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