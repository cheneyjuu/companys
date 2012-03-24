package org.company.actions;

import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.company.actions.base.BaseActionSupport;
import org.company.beans.AdminUser;
import org.company.beans.CompanyIntro;
import org.company.beans.base.PageView;
import org.company.services.admin.LoginService;
import org.company.services.admin.UploadService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * User: Administrator
 * Date: 12-3-18
 * Time: 下午2:59
 */
public class AdminUserAction extends BaseActionSupport{
    @Resource
    private LoginService loginService;
    @Resource
    private UploadService uploadService;

    private AdminUser adminUser;
    private CompanyIntro companyIntro;
    private File image;
	private String imageFileName;
	private String imageContentType;
    
    public String adminLogin(){
        return SUCCESS;
    }

    public String login(){
        adminUser = loginService.findByUser(adminUser);
        if(null!=adminUser){
            ServletActionContext.getRequest().getSession().setAttribute("adminInfo",adminUser);
            return SUCCESS;
        } else {
            return ERROR;
        }

    }
    
    public String findAllCompanyIntroWithPage(){
        ActionContext ctx = ActionContext.getContext();
        HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
        if (null!=request.getSession().getAttribute("adminInfo")){
            int maxResult = 5;
            PageView<CompanyIntro> pageView = new PageView<CompanyIntro>(maxResult,getPage());
            pageView.setQueryResult(uploadService.getScrollData(pageView.getFirstResult(),maxResult));
            request.setAttribute("pageView", pageView);
            return SUCCESS;
        } else {
            addActionError("您还未登录或登录已超时！");
            return ERROR;
        }

    }
    
    public String right(){
        return SUCCESS;
    }
    
    public String toUpload(){
        
        return SUCCESS;
    }
    
    public String addCompanyIntro(){
        HttpSession session = ServletActionContext.getRequest().getSession();
        adminUser = (AdminUser)session.getAttribute("adminInfo");
        if (null!=adminUser){
            companyIntro.setCreateTime(SimpleDateFormat.getInstance().format(new Date()));
            companyIntro.setAdminId(adminUser.getId());
            uploadService.saveInfo(companyIntro);
            addActionMessage("公司简介添加成功！");
            return SUCCESS;
        } else {
            addActionError("您还未登录或登录以超时！");
            return ERROR;
        }
    }

    public String upload() throws IOException {
        HttpSession session = ServletActionContext.getRequest().getSession();
        adminUser = (AdminUser)session.getAttribute("adminInfo");
        if (null!=adminUser){
            String realPath = ServletActionContext.getServletContext().getRealPath(
                    "/images/" + new SimpleDateFormat("yyyy-MM").format(new Date()) + "/"
                            + new SimpleDateFormat("dd").format(new Date()));
            String filePath = "/images/" + new SimpleDateFormat("yyyy-MM").format(new Date())
                    + "/" + new SimpleDateFormat("dd").format(new Date()) + "/";
            String fileName = generateFileName(imageFileName);
            File target = new File(realPath,fileName);
            FileUtils.copyFile(image,target);
            companyIntro.setCreateTime(DateFormat.getInstance().format(new Date()));
            companyIntro.setImageUrl(filePath+fileName);
            companyIntro.setAdminId(adminUser.getId());
            uploadService.saveInfo(companyIntro);
            return SUCCESS;
        } else {
            addActionError("您还未登录或登录以超时！");
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

    /**
     * 添加简介跳转
     * @return
     */
    public String toAddIntro(){
        return SUCCESS;
    }

    public AdminUser getAdminUser() {
        return adminUser;
    }

    public void setAdminUser(AdminUser adminUser) {
        this.adminUser = adminUser;
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

    public CompanyIntro getCompanyIntro() {
        return companyIntro;
    }

    public void setCompanyIntro(CompanyIntro companyIntro) {
        this.companyIntro = companyIntro;
    }
}
