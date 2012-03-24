<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12-3-21
  Time: 下午2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/base.css">
</head>
<body>
<p><s:actionmessage /></p>
<form action="/adminUser/addIntro.action" method="post">
    <textarea cols="70" id="editor1" name="companyIntro.intro" rows="10"></textarea>
    <script type="text/javascript">
        CKEDITOR.replace( 'editor1',
                {
                    fullPage : true,
                    extraPlugins : 'docprops'
                });
    </script>
    <p>
        <input type="submit" value="Submit" />
    </p>
</form>
</body>
</html>