<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/images/admin/template/images/skin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
    <style type="text/css" media="screen">
        .ui-table{
            width:95%;
            height:auto;
            margin:0 auto;
            border: 1px solid #999;
            border-collapse:collapse;
            font-family: Arial, "MS Trebuchet", sans-serif;
        }
        .ui-table tbody tr td{
            border: 1px solid #999;
            padding: 0.2em;
            font-size: 75%;
        }
    </style>
</head>
<body>
    <s:actionmessage />
    <span class="left_bt" style="text-align: center;margin: 15px 0;display: block;">添加新闻</span>
    <form action="/news/news_addNews.action" method="post">
        <table class="ui-table">
            <tbody>
            <tr>
                <td>新闻类型：</td>
                <td>
                    <select name="news.newsType">
                        <option value="-1">--请选择--</option>
                        <option value="1">公司新闻</option>
                        <option value="2">行业动态</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    新闻标题:
                </td>
                <td>
                    <input type="text" name="news.title">
                </td>
            </tr>
            <tr>
                <td>作者：</td>
                <td>
                    <input type="text" name="news.author">
                </td>
            </tr>
            <tr>
                <td>
                    内容：
                </td>
                <td>
                    <textarea cols="70" id="editor1" name="news.content" rows="5"></textarea>
                    <script type="text/javascript">
                        CKEDITOR.replace( 'editor1',
                                {
                                    fullPage : false,
                                    removePlugins:'elementspath',
                                    height:50,
                                    toolbar :
                                        [
                                            [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],

                                            ['TextColor','BGColor']
                                        ]
                                });
                    </script>
                </td>
            </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2" style="padding-left: 120px;">
                        <button style="display:block;width: 100px;height: 25px;margin: 5px 0 5px 0;">新增新闻</button>
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>
</body>
</html>