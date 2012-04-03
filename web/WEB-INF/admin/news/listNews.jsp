<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/images/admin/template/images/skin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/base.js"></script>
    <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
    <style type="text/css" media="screen">
        .ui-table{
            width:95%;
            height:auto;
            margin:0 auto;
            border: 1px solid #999;
            border-collapse:collapse;
            font-family: Arial, "MS Trebuchet", sans-serif;
        }

        .ui-table tr td{
            border: 1px solid #999;
            padding: 0.2em;
            font-size: 75%;
        }
    </style>
</head>
<body>
<span class="left_bt" style="text-align: center;margin: 15px 0;display: block;"><s:actionmessage /></span>
<form action="/product/product_listProduct.action" method="post">

    <s:hidden name="page"></s:hidden>
    <s:if test="#request.pageView.totalRecord">

        <span class="left_bt" style="text-align: center;margin: 15px 0;display: block;">公司简介管理页面</span>
        <table class="ui-table">
            <tr>
                <td>
                    序号
                </td>
                <td>
                    新闻标题
                </td>
                <td>
                    作者
                </td>
                <td>
                    创建时间
                </td>
                <td>
                    内容
                </td>
                <td>
                    新闻类型
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
                        <s:property value="#entity.title" />
                    </td>
                    <td>
                        <s:property value="#entity.author" />
                    </td>
                    <td>
                        <s:property value="#entity.createTime" />
                    </td>
                    <td>
                        <s:property value="content.length()>50?content.substring(0,50)+' ...':content" escape="false" />
                    </td>
                    <td>
                        <s:if test="#entity.newsType==1">
                            公司新闻
                        </s:if>
                        <s:else>行业动态</s:else>
                    </td>
                    <td>
                        <input type="hidden" id="newsId" value="<s:property value="#entity.id" />">
                        <a href="javascript:void(0)" onclick="deleteProduct()">删除</a> <span style="font-size: 12px;">|</span>
                        <a href="/news/news_toUpdateNews.action?news.id=<s:property value="#entity.id" />">修改</a>
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
<script type="text/javascript">
    function deleteProduct(){
        var result = window.confirm("请确认删除");
        if(result){
            var nid = $("#newsId").val();
            window.location.href="/news/news_delNews.action?news.id="+nid;
        }
    }
</script>
</body>
</html>