package org.company.services.admin.impl;

import org.company.beans.News;
import org.company.daos.base.BaseDaoSupport;
import org.company.services.admin.NewsService;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl extends BaseDaoSupport<News> implements NewsService {
}
