package org.company.actions;

import org.apache.struts2.ServletActionContext;
import org.company.actions.base.BaseActionSupport;
import org.company.beans.News;
import org.company.beans.base.PageView;
import org.company.services.admin.NewsService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NewsAction extends BaseActionSupport {

    private News news;
    @Resource
    private NewsService newsService;

    public String addNews(){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        news.setCreateTime(dateFormat.format(new Date()));
        newsService.save(news);
        addActionMessage("新闻添加成功！");
        return "toAddNews";
    }

    public String listNews(){
        HttpServletRequest request = ServletActionContext.getRequest();
        int maxResult = 10;
        PageView<News> pageView = new PageView<News>(maxResult,getPage());
        pageView.setQueryResult(newsService.getScrollData(pageView.getFirstResult(),maxResult));
        request.setAttribute("pageView", pageView);
        return SUCCESS;
    }

    public String delNews(){
        newsService.delete(news.getId());
        return listNews();
    }

    public String toUpdateNews(){
        news = newsService.find(news.getId());
        return "toUpdateNews";
    }

    public String updateNews(){
        newsService.update(news);
        return listNews();
    }

    public String toAddNews(){
        return "toAddNews";
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }
}
