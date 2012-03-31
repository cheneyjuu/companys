<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
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
            font-size: 75%;
        }
    </style>
</head>
<body>
    <s:property value="result" />
    <form action="/adminUser/upload.action" method="post" enctype="multipart/form-data">
        <table class="ui-table">
            <tbody>
                <tr>
                    <td><label>简介类型：</label></td>
                    <td><select name="companyIntro.introType">
                        <option value="-1">--请选择--</option>
                        <option value="类型1">类型1</option>
                        <option value="类型2">类型2</option>
                    </select></td>
                </tr>
            <tr>
                <td><label>标题：</label></td>
                <td><input type="text" name="companyIntro.imageTitle"></td>
            </tr>
            <tr>
                <td><label>上传图片：</label></td>
                <td><input type="file" name="image"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="上传"></td>
            </tr>
            </tbody>
        </table>
    </form>
</body>
</html>