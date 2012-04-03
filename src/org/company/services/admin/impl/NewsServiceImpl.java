package org.company.services.admin.impl;

import org.company.beans.News;
import org.company.daos.base.BaseDaoSupport;
import org.company.services.admin.NewsService;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl extends BaseDaoSupport<News> implements NewsService {
    @Override
    public List<News> getNewsList(int totalData) {
        return super.getSession().createCriteria(News.class).addOrder(Order.desc("id")).setMaxResults(totalData).list();
    }
}
