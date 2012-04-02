package org.company.actions.user;

import org.apache.struts2.ServletActionContext;
import org.company.actions.base.BaseActionSupport;
import org.company.beans.Category;
import org.company.beans.CompanyIntro;
import org.company.beans.Product;
import org.company.beans.base.PageView;
import org.company.services.admin.CategoryService;
import org.company.services.admin.ProductService;
import org.company.services.admin.UploadService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class Index extends BaseActionSupport{
    private Category category;
    @Resource
    private CategoryService categoryService;
    @Resource
    private UploadService uploadService;
    @Resource
    private ProductService productService;
    private List<Category> categoryList;
    private List<CompanyIntro> introList;
    private CompanyIntro companyIntro;
    private String type;
    private String typeName;

    private Integer productId;

    private List<Product> productList;
    public String index(){

        categoryList = categoryService.findAllCategory();
        companyIntro = uploadService.findIntro(type);

        HttpServletRequest request = ServletActionContext.getRequest();
        int maxResult = 3;
        PageView<Product> pageView = new PageView<Product>(maxResult,getPage());
        pageView.setQueryResult(productService.getScrollData(pageView.getFirstResult(),maxResult));
        request.setAttribute("pageView", pageView);
        return SUCCESS;
    }

    public String product(){

        categoryList = categoryService.findAllCategory();
        HttpServletRequest request = ServletActionContext.getRequest();
        int maxResult = 9;
        PageView<Product> pageView = new PageView<Product>(maxResult,getPage());
        if (null!=productId){
            pageView.setQueryResult(productService.getScrollData(pageView.getFirstResult(),maxResult,"category.id="+productId,null,null));
        } else {
            pageView.setQueryResult(productService.getScrollData(pageView.getFirstResult(),maxResult));
        }
        request.setAttribute("pageView", pageView);
        return SUCCESS;
    }
    private Product product;

    /**
     * 产品详情
     * @return
     */
    public String productDetails(){
       product = productService.find(productId);
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

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }
}
