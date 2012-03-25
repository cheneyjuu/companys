package org.company.services.admin.impl;

import org.company.beans.Category;
import org.company.daos.base.BaseDaoSupport;
import org.company.services.admin.CategoryService;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: Administrator
 * Date: 12-3-22
 * Time: 上午9:38
 */
@Service
public class CategoryServiceImpl extends BaseDaoSupport<Category> implements CategoryService {
    @Override
    public void addCategory(Category category) {
        super.save(category);
    }

    @Override
    public List<Category> findAllCategory() {
        return super.getSession().createCriteria(Category.class).list();
    }

    @Override
    public List<Category> findByCategoryType(int categoryType) {
        return super.getSession().createCriteria(Category.class).add(Restrictions.eq("categoryType",categoryType)).list();
    }
}
