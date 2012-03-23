﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台管理系统</title>
    <link href="../../../css/div.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/txt.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="../../../js/menu.js"></script>
    <script language="javascript" src="../../../js/time.js"></script>
</head>


<body scroll="no">
<div class="height_box" id="web_height">
    <div class="webbox" id="up_box">
        <div class="logo_bg"><img src="../../../images/admin/logo.jpg" alt="这里是LOGO" width="222" height="70" /></div>
        <div class="logo_menu_box" id="web_top">
            <div class="logo_menu1">
                <div class="logo_home"><a href="http://www.liuyuefeng.com" target="_blank"><img src="../../../images/admin/logo_home.jpg" border="0" /></a></div>
                <div class="logo_home_menu">&nbsp;&nbsp;<a href="#" class="logo_menu_txt">后台管理页面</a><img src="../../../images/admin/logo_home_line.jpg" width="2" height="18" /><a href="#" target="main" class="logo_menu_txt">修改密码</a><img src="../../../images/admin/logo_home_line.jpg" width="2" height="18" /><a href="/admin/logout.action" class="logo_menu_txt">退出登录</a></div>
            </div>
            <div class="logo_menu2"></div>
            <div class="logo_menu3">
                <div class="logo_menu3_txt txt_C2"><strong class="txt_C3">欢迎信息:</strong>欢迎您<b style="color:#FF0000">管理员</b>!&nbsp;您现在登录的是后台管理系统!&nbsp;当前时间:<script language="javascript">showTime()</script></div>
            </div>
        </div>
    </div>
    <s:set name="menu" value="rightsSrv.getMenu(#session['admin_key'])" />
    <div class="webbox" id="bottom_box">
        <div class="left" id="web_left" style="overflow:scroll;">
            <div class="left_line5"></div>
            <div class="left_title">
                <strong class="txt_C1"><img src="../../../images/admin/left_title_dot.gif" width="7" height="7" />模块管理</strong>
            </div>

            <div class="left_title">
                <strong class="txt_C1">
                    <img src="../../../images/admin/left_title_dot.gif" width="7" height="7" />
                    <a href="/adminUser/toUpload.action" target="main">上传管理</a>
                </strong>
            </div>
            <div class="left_title">
                <strong class="txt_C1">
                    <img src="../../../images/admin/left_title_dot.gif" width="7" height="7" />
                    <a href="/adminUser/toAddIntro.action" target="main">简介管理</a>
                </strong>
            </div>
            <div class="left_title">
                <strong class="txt_C1">
                    <img src="../../../images/admin/left_title_dot.gif" width="7" height="7" />
                    <a href="/category/category_index.action" target="main">产品类别维护</a>
                </strong>
            </div>
            <%--<div class="left_title_list_box_other" id="left_m1">--%>
                <%--<a href="#" class="txt_C2"  target="main">link</a>--%>
            <%--</div>--%>

            <div class="left_copy text_en" id="l_copy">Powered by <a href="#" class="txt_C1" target="_blank">copyright</a></div>
        </div>


        <div class="right" id="web_right">
            <div class="main_center_article" id="web_main">
                <iframe src="/adminUser/right.action" name="main" width="100%" height="100%" scrolling="yes" frameborder="0"  ></iframe>
            </div>
        </div>
    </div>
</div>
<script language="javascript">
    window.onresize = window.onload = setDiv;
    function setDiv(){
        var space = 1;
        var maxX = document.getElementById("web_height").clientWidth;
        var maxY = document.getElementById("web_height").clientHeight;
        var webH = maxY-space;
        document.getElementById("web_top").style.width = maxX-250-space + "px";
        document.getElementById("bottom_box").style.height = document.getElementById("web_left").style.height = webH-90+ "px";
        document.getElementById("web_right").style.width = maxX-200-space + "px";
        document.getElementById("web_main").style.height = webH - 90 + "px";
    }
</script>
</body>
</html>
