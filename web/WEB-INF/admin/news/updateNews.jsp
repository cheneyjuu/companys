<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/images/admin/template/images/skin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
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
        .ui-table tbody tr td{
            border: 1px solid #999;
            padding: 0.2em;
            font-size: 75%;
        }
    </style>
</head>
<body>
<span class="left_bt" style="text-align: center;margin: 15px 0;display: block;">修改新闻信息</span>
<form action="/news/news_updateNews.action" method="post" >
    <input type="hidden" name="news.id" value="<s:property value="news.id" />">
    <input type="hidden" name="news.createTime" value="<s:property value="news.createTime" />">
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
                <input type="text" name="news.title" value="<s:property value="news.title" />">
            </td>
        </tr>
        <tr>
            <td>作者：</td>
            <td>
                <input type="text" name="news.author" value="<s:property value="news.author" />">
            </td>
        </tr>
        <tr>
            <td>
                内容：
            </td>
            <td>
                <textarea cols="70" id="editor1" name="news.content" rows="5"><s:property value="news.content" /></textarea>
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
                <button style="display:block;width: 100px;height: 25px;margin: 5px 0 5px 0;">修改新闻</button>
            </td>
        </tr>
        </tfoot>
    </table>
</form>
</body>
<script type="text/javascript">
    $(function(){
        $("button").click(function(){
            var ov = $("select option:selected").val();
            if(ov==-1){
                alert("请选择新闻类别");
                return;
            } else {
                $("form").submit();
            }
        });
    });
</script>
</html>