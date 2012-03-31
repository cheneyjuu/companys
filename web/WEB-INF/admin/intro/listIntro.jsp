<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
    <title></title>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/base.js"></script>
    <style type="text/css" media="screen">
        .ui-table{
            width:95%;
            height:auto;
            margin:0 auto;
            border: 1px solid #999;
            border-collapse:collapse;
            font-family: Arial, "MS Trebuchet", sans-serif;
        }
        .ui-table thead tr th{
            border: 1px solid #999;
            padding: 0.2em;
        }
        .ui-table tbody tr td{
            border: 1px solid #999;
            padding: 0.2em;
            font-size: 12px
        }
    </style>
</head>
<body>
<form action="/adminUser/listIntro.action" method="post">

    <s:hidden name="page"></s:hidden>
    <s:if test="#request.pageView.totalRecord">

        <h3 style="display: block;text-align: center;margin: 15px 0 15px 0;font-size: 16px;">公司简介管理页面</h3>
        <table class="ui-table">
            <thead>
            <tr>
                <th>
                    序号
                </th>
                <th>
                    简介
                </th>
                <th>
                    添加时间
                </th>
                <th>
                    操作
                </th>
            </tr>
            </thead>
            <tbody>
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
            </tbody>
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