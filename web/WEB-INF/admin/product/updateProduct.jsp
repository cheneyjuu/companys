<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/images/admin/template/images/skin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
    <style type="text/css">
        td{
            text-align: left;
            font-size: 12px;
        }
    </style>
</head>
<body>
<span class="left_bt" style="text-align: center;margin: 15px 0;display: block;">修改产品信息</span>
<form action="/product/product_updateProduct.action" method="post" enctype="multipart/form-data">
    <table cellpadding="0" cellspacing="0" border="1" width="80%" align="center">
        <tbody>
        <tr>
            <td>
                产品类别:
            </td>
            <td>
                <select name="categoryId">
                    <option value="-1">--请选择产品类别--</option>
                    <s:iterator value="categoryList" id="entity" status="st">
                        <option value="<s:property value="#entity.id" />"><s:property value="#entity.categoryName" /></option>
                    </s:iterator>
                </select>
            </td>
        </tr>
        <tr>
            <td>产品图片：</td>
            <td>
                <input type="file" name="image">
                <img src="<s:property value="product.imageUrl" />" alt="原图" style="width: 25%; height: auto;">
            </td>
        </tr>
        <tr>
            <td>
                产品名称：
            </td>
            <td>
                <input type="text" name="product.productName" value="<s:property value="product.productName" />">
            </td>
        </tr>
        <tr>
            <td>
                产品特点：
            </td>
            <td>
                <textarea cols="70" id="editor1" name="product.feature" rows="5">
                    <s:property value="product.feature" />
                </textarea>
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
        <tr>
            <td>
                产品描述：
            </td>
            <td>
                <textarea cols="70" id="editor2" name="product.description" rows="10">
                    <s:property value="product.description" />
                </textarea>
                <script type="text/javascript">
                    CKEDITOR.replace( 'editor2',
                            {
                                fullPage : false,
                                removePlugins:'elementspath',
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
                <button style="display:block;width: 100px;height: 25px;margin: 5px 0 5px 0;">修改产品</button>
            </td>
        </tr>
        </tfoot>
    </table>
</form>
</body>
</html>