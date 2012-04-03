package org.company.services.admin;

import org.company.beans.News;
import org.company.daos.base.IBaseDao;

import java.util.List;

public interface NewsService extends IBaseDao<News> {

    List<News> getNewsList(int totalData);
}
