package org.company.actions;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.company.actions.base.BaseActionSupport;
import org.company.beans.AdminUser;
import org.company.beans.Category;
import org.company.beans.Product;
import org.company.beans.base.PageView;
import org.company.services.admin.CategoryService;
import org.company.services.admin.ProductService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class ProductAction extends BaseActionSupport{
    @Resource
    private ProductService productService;
    @Resource
    private CategoryService categoryService;
    private List<Category> categoryList;
    private Product product;
    private Integer categoryId;
    private File image;
    private String imageFileName;
    private String imageContentType;

    public String listProduct(){
        if  (AdminUser.isLogin()){
            HttpServletRequest request = ServletActionContext.getRequest();
            int maxResult = 10;
            PageView<Product> pageView = new PageView<Product>(maxResult,getPage());
            pageView.setQueryResult(productService.getScrollData(pageView.getFirstResult(),maxResult));
            request.setAttribute("pageView", pageView);
            return SUCCESS;
        } else {
            addActionError("您还未登录或登录已超时！");
            return ERROR;
        }
    }

    public String toAddProduct(){
        if (AdminUser.isLogin()){
            categoryList = categoryService.findByCategoryType(1);
            return "toAddProduct";
        } else {
            addActionError("您还未登录或登录已超时！");
            return ERROR;
        }
    }
    
    public String addProduct(){
        if (AdminUser.isLogin()){
            String realPath = ServletActionContext.getServletContext().getRealPath(
                    "/images/" + new SimpleDateFormat("yyyy-MM").format(new Date()) + "/"
                            + new SimpleDateFormat("dd").format(new Date()));
            String filePath = "/images/" + new SimpleDateFormat("yyyy-MM").format(new Date())
                    + "/" + new SimpleDateFormat("dd").format(new Date()) + "/";
            String fileName = generateFileName(imageFileName);
            File target = new File(realPath,fileName);
            try {
                FileUtils.copyFile(image, target);
                product.setImageUrl(filePath + fileName);
                product.setCategory(categoryService.find(categoryId));
                System.out.println("feature:  "+product.getFeature()+"\n"+"desc:  "+product.getDescription()+"\n"+"  category id:  "+categoryId);
                product.setCreateTime(DateFormat.getInstance().format(new Date()));
                product.setAdminId(((AdminUser)ServletActionContext.getRequest().getSession().getAttribute("adminInfo")).getId());
                productService.addProduct(product);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return listProduct();
        } else {
            addActionError("您还未登录或登录已超时！");
            return ERROR;
        }
    }

    // 为上传文件自动分配文件名称，避免重复
    private String generateFileName(String fileName) {
        // 获得当前时间
        DateFormat format = new SimpleDateFormat("yyMMddHHmmss");
        // 转换为字符串
        String formatDate = format.format(new Date());
        // 随机生成文件编号
        int random = new Random().nextInt(10000);
        // 获得文件后缀名称
        int position = fileName.lastIndexOf(".");
        String extension = fileName.substring(position);
        // 组成一个新的文件名称
        return formatDate + random + extension;
    }
    
    public String details(){
        if (AdminUser.isLogin()){
            product = productService.find(product.getId());
            return "details";
        } else{
            addActionError("您还未登录或登录已超时！");
            return ERROR;
        }
    }
    
    public String deleteProduct(){
        if (AdminUser.isLogin()){
            productService.delete(product.getId());
            return listProduct();
        } else{
            addActionError("您还未登录或登录已超时！");
            return ERROR;
        }
    }

    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }

    public File getImage() {
        return image;
    }

    public void setImage(File image) {
        this.image = image;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    public String getImageContentType() {
        return imageContentType;
    }

    public void setImageContentType(String imageContentType) {
        this.imageContentType = imageContentType;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
}
