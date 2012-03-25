package org.company.services.admin;

import org.company.beans.Product;
import org.company.daos.base.IBaseDao;

public interface ProductService extends IBaseDao<Product>{

    void addProduct(Product product);

    void updateProduct(Product product);

}
