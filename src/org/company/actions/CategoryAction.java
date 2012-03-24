package org.company.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.company.actions.base.BaseActionSupport;
import org.company.beans.AdminUser;
import org.company.beans.Category;
import org.company.services.admin.CategoryService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * User: Administrator
 * Date: 12-3-21
 * Time: 下午9:05
 */
public class CategoryAction extends BaseActionSupport {

    @Resource
    private CategoryService categoryService;
    private Category category;
    private List<Category> categoryList;
    
    public String addCategory() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        AdminUser adminUser = (AdminUser)session.getAttribute("adminInfo");
        if (null!=adminUser){
            categoryService.addCategory(category);
            findAllCategory();
            return SUCCESS;
        } else {
            addActionError("您还未登录或登录已超时！");
            return ERROR;
        }
    }


    public String index() throws Exception {
        findAllCategory();
        return "success";
    }
    
    public String findAllCategory(){
        categoryList = categoryService.findAllCategory();
        System.out.println("list size: "+categoryList.size());
        return SUCCESS;
    }
    
    public String deleteCategory(){
        categoryService.delete(category.getId());
        findAllCategory();
        return SUCCESS;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }
}
