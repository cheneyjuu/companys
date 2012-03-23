<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新筑后台管理登陆</title>
    <link rel="stylesheet" type="text/css" href="/css/base.css">
    <link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<body>
    <form action="/adminUser/login.action" method="post">
        <div id="header"></div>
        <div id="content">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <label>用户名：</label>
                    </td>
                    <td>
                        <input type="text" name="adminUser.userName">
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>
                            密&nbsp;&nbsp;&nbsp;码：
                        </label>
                    </td>
                    <td>
                        <input type="password" name="adminUser.userPassword">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>