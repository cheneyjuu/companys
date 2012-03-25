package org.company.services.admin;

import org.company.beans.Category;
import org.company.daos.base.IBaseDao;

import java.util.List;

/**
 * User: Administrator
 * Date: 12-3-22
 * Time: 上午9:36
 */
public interface CategoryService extends IBaseDao<Category>{

    void addCategory(Category category);

    /**
     * 无分页
     * @return
     */
    List<Category> findAllCategory();

    List<Category> findByCategoryType(int categoryType);
}
