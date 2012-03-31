package org.company.actions.user;

import org.company.actions.base.BaseActionSupport;
import org.company.beans.Category;
import org.company.beans.CompanyIntro;
import org.company.services.admin.CategoryService;
import org.company.services.admin.UploadService;

import javax.annotation.Resource;
import java.util.List;

public class Index extends BaseActionSupport{
    private Category category;
    @Resource
    private CategoryService categoryService;
    @Resource
    private UploadService uploadService;
    private List<Category> categoryList;
    private List<CompanyIntro> introList;
    private CompanyIntro companyIntro;

    public String index(){
        categoryList = categoryService.findAllCategory();
        companyIntro = uploadService.findIntro();
        return SUCCESS;
    }

    public List getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List categoryList) {
        this.categoryList = categoryList;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<CompanyIntro> getIntroList() {
        return introList;
    }

    public void setIntroList(List<CompanyIntro> introList) {
        this.introList = introList;
    }

    public CompanyIntro getCompanyIntro() {
        return companyIntro;
    }

    public void setCompanyIntro(CompanyIntro companyIntro) {
        this.companyIntro = companyIntro;
    }
}
