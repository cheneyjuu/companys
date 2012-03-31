<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>巧筑 -- 上海硕铭建筑装饰</title>
		<link rel="stylesheet" type="text/css" href="/css/base.css" />
		<link rel="stylesheet" type="text/css" href="/css/index.css" />
        <script type="text/javascript" src="/js/scrollPic.js"></script>
	</head>
	<body>
	<div id="container">
		<jsp:include page="../header.jsp" />

        <div id="left_nav">


            <div   class="productclass_dolphin" style="height: 330px; overflow:hidden;" >
                <s:iterator value="categoryList" id="entity">
                    <a href="#" class="productclass_dolphin" ><s:property value="#entity.categoryName" /></a>
                </s:iterator>
            </div>

            <div id="left_addres" >
                <p  class="left_addres_p" >地址:上海市闸北区</p>
                <p class="left_addres_p">电话:021-12345678</p>
                <p class="left_addres_p">邮箱:gegmingjun001@gmail.com</p>
            </div>
        </div>

        <div id="content">
            <!-- 主分区-->
            <div style="border:0px">
                <!-- /*左侧*/-->
                <div id="content_left" >
                    <div id="content_left_logo" >
                        <div id="content_left_more_a">
                            <a  style="display:inline;" href="page/html/company.php">
                                <img style="border:0px;padding-top:19px;margin-left: -20px;" src="/images/user/more.jpg">
                            </a>
                        </div>
                    </div>
                    <!-- /*简介*/v-->
                    <div>
                        </br>
                        <div style="margin-left:15px;"><s:property value="companyIntro.intro" escape="false" /></div>
                    </div>
                </div>
                <!-- /*右侧*/v-->
                <div id="content_right">
                    <div id="content_right_logo">
                        <div id="content_right_more">
                            <a style="display:inline;" href="page/html/company.php">
                                <img style="border:0px;padding-top:19px;margin-left: -20px;" src="/images/user/more.jpg">
                            </a>
                        </div>
                    </div>
                    <!-- /*新闻展示* <a class="newslist">sdsds</a>/-->
                    <div >
                        <ul  class="newslist">
                            <li class="newslist" >
                                <a class="newslist">顶顶顶</a>
                            </li>
                        </ul>
                    </div>
                    <div >
                        <ul  class="newslist">
                            <li class="newslist" >
                                <a class="newslist">顶顶顶</a>
                            </li>
                        </ul>
                    </div>
                    <div >
                        <ul  class="newslist">
                            <li class="newslist" >
                                <a class="newslist">顶顶顶</a>
                            </li>
                        </ul>
                    </div>
                    <div >
                        <ul  class="newslist">
                            <li class="newslist" >
                                <a class="newslist">顶顶顶</a>
                            </li>
                        </ul>
                    </div>
                    <div >
                        <ul  class="newslist">
                            <li class="newslist" >
                                <a class="newslist">顶顶顶</a>
                            </li>
                        </ul>
                    </div>
                    <!--style="margin:0px;padding:0px"-->
                    <div >
                        <ul  class="newslist">
                            <li class="newslist" >
                                <a class="newslist">顶顶顶</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /*循环图片*/-->
            <div id="content_product">
                <div style="float:right;width:49px;height:16px;">
                    <a style="display:inline;" href="page/html/company.php">
                        <img style="border:0px;padding-top:19px;margin-left: -60px;" src="/images/user/more.jpg">
                    </a>
                </div>
            </div>

        </div>
        <div class="fn-clear"></div>
        <jsp:include page="../bottom.jsp" />
	</div>
	</body>
</html>