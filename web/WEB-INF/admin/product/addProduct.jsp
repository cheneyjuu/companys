<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
</head>
<body>
    <p style="text-align: center;font-size: 16px;margin: 15px 0 15px 0;">新增产品</p>
    <form action="/product/product_addProduct.action" method="post" enctype="multipart/form-data">
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
                </td>
            </tr>
            <tr>
                <td>
                    产品名称：
                </td>
                <td>
                    <input type="text" name="product.productName">
                </td>
            </tr>
            <tr>
                <td>
                    产品特点：
                </td>
                <td>
                    <textarea cols="70" id="editor1" name="product.feature" rows="10"></textarea>
                    <script type="text/javascript">
                        CKEDITOR.replace( 'editor1',
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
                <tr>
                    <td>
                        产品描述：
                    </td>
                    <td>
                        <textarea cols="70" id="editor2" name="product.description" rows="10"></textarea>
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
                    <td colspan="2">
                        <input type="submit" value="新增产品">
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>
</body>
</html>