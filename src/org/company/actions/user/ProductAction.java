package org.company.actions.user;

import org.company.actions.base.BaseActionSupport;
import org.company.services.admin.CategoryService;
import org.company.services.admin.ProductService;

import javax.annotation.Resource;

public class ProductAction extends BaseActionSupport{
    @Resource
    private ProductService productService;
    @Resource
    private CategoryService categoryService;
}
