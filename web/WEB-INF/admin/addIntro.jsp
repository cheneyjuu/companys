<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/base.css">
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
<p><s:actionmessage /></p>
<form action="/adminUser/addIntro.action" method="post">
    <table class="ui-table">
        <tbody>
            <tr><td>
                简介类型:
            </td>
            <td>
                <select name="companyIntro.introType">
                    <option value="-1">--请选择--</option>
                    <option value="0010">公司简介</option>
                    <option value="0020">企业文化</option>
                    <option value="0030">组织机构</option>
                    <option value="0040">成功案例</option>
                    <option value="0050">荣誉资质</option>
                    <option value="0060">销售网络</option>
                </select>
            </td>
            </tr>
        <tr>
            <td>
                简介：
            </td>
            <td>
                <textarea cols="30" id="editor1" name="companyIntro.intro" rows="10"></textarea>
                <script type="text/javascript">
                    CKEDITOR.replace( 'editor1',
                            {
                                fullPage : false,
                                width:700
                            });
                </script>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="新增简介" />
            </td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>