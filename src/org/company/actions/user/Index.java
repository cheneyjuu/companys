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
    private String type;
    private String typeName;

    public String index(){

        categoryList = categoryService.findAllCategory();
        companyIntro = uploadService.findIntro(type);
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

    public String intro() throws Exception {
        if(null!=type){
            if(type.equals("0010")){
                typeName="公司简介";
            } else if(type.equals("0020")){
                typeName="企业文化";
            } else if(type.equals("0030")){
                typeName="组织机构";
            } else if(type.equals("0040")){
                typeName="成功案例";
            } else if(type.equals("0050")){
                typeName="荣誉资质";
            } else if(type.equals("0060")){
                typeName="销售网络";
            }
        }
        companyIntro = uploadService.findIntro(type);
        return "success";
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
