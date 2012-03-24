<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/base.css">
</head>
<body>
<form action="/adminUser/updateCompanyIntro.action" method="post">
    <input type="hidden" name="companyIntro.id" value="<s:property value='companyIntro.id' />">
    <textarea cols="70" id="editor1" name="companyIntro.intro" rows="10"><s:property value="companyIntro.intro" /></textarea>
    <script type="text/javascript">
        CKEDITOR.replace( 'editor1',
                {
                    fullPage : true,
                    extraPlugins : 'docprops'
                });
    </script>
    <p>
        <input type="submit" value="更新" />
    </p>
</form>
</body>
</html>