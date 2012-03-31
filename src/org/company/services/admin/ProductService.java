package org.company.services.admin;

import org.company.beans.Product;
import org.company.daos.base.IBaseDao;

import java.util.List;

public interface ProductService extends IBaseDao<Product>{

    void addProduct(Product product);

    void updateProduct(Product product);

    List<Product> findByCategory(String category);

}
