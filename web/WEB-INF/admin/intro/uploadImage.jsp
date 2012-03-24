<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12-3-18
  Time: 下午3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
</head>
<body>
    <form action="/adminUser/upload.action" method="post" enctype="multipart/form-data">
        <div id="mainContent">
            <p>
                <label>简介类型：</label>
                <select name="companyIntro.introType">
                    <option value="-1">--请选择--</option>
                    <option value="1">类型1</option>
                    <option value="2">类型2</option>
                </select>
            </p>
            <p>
                <label>标题：</label>
                <input type="text" name="companyIntro.imageTitle">
            </p>
            <p>
                <label>上传图片：</label>
                <input type="file" name="image">
            </p>
            <p>
                <input type="submit" value="上传">
            </p>
        </div>
    </form>
</body>
</html>