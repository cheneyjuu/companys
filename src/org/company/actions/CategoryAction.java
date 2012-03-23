package org.company.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.company.beans.AdminUser;
import org.company.beans.Category;
import org.company.services.admin.CategoryService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * User: Administrator
 * Date: 12-3-21
 * Time: 下午9:05
 */
@Controller(value = "categoryAction")
public class CategoryAction extends ActionSupport {

    @Resource
    private CategoryService categoryService;
    private Category category;
    
    private String index(){
        return SUCCESS;
    }
    
    private String addCategory(){
        HttpSession session = ServletActionContext.getRequest().getSession();
        AdminUser adminUser = (AdminUser)session.getAttribute("adminInfo");
        if (null!=adminUser){
            categoryService.addCategory(category);
            return "index";
        } else {
            addActionError("您还未登录或登录已超时！");
            return ERROR;
        }
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
