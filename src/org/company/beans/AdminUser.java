package org.company.beans;

import org.apache.struts2.ServletActionContext;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-3-18
 * Time: 下午2:45
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "adminUser")
public class AdminUser {
    
    private Integer id;
    private String userName;
    private String userPassword;

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 用来判断用户是否登录的静态方法
     * 如果用户已登录返回true
     * 否则返回false
     * @return
     */
    public static boolean isLogin(){
        if(null!=ServletActionContext.getRequest().getSession().getAttribute("adminInfo")){
            return true;
        } else {
            return false;
        }
    }
}
