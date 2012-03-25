package org.company.services.admin.impl;

import org.company.beans.Product;
import org.company.daos.base.BaseDaoSupport;
import org.company.services.admin.ProductService;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl extends BaseDaoSupport<Product> implements ProductService{
    @Override
    public void addProduct(Product product) {
        super.save(product);
    }

    @Override
    public void updateProduct(Product product) {
    }
}
